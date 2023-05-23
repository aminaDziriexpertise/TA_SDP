
(defun c:jf () (c:pljoinfuzz)) ; this line can be commented out if there is an existing command called jf
(defun c:plcheck (/ ss1 entLine objType oldcmdecho oldpeditaccept fuzz okObjects)
  (setq oldcmdecho (getvar "cmdecho"))
  (setq oldpeditaccept (getvar "PEDITACCEPT"))
  (setvar "cmdecho" 0)
  (setq A2k4 (>= (substr (getvar "ACADVER") 1 2) "16"))
  (if A2k4 (setvar "PEDITACCEPT" 0))
  (setq	okObjects '((0 . "LINE,ARC,POLYLINE,LWPOLYLINE")))
  (princ "\nSelect object to join: ")
  (setq ss1 (ssget okObjects))
  (setq fuzz (getdist "\nFuzz distance <0>: "))
  (if (= fuzz nil) (setq fuzz 0))
  (if (/= ss1 nil)
      (progn
	(setq objType (cdr (assoc 0 (entget (setq entLine (ssname ss1 0))))))
	(if (= (sslength ss1) 1) (setq ss1 (ssget "X" okObjects)))
	(if (member objType '("LINE" "ARC"))
	  (command "_.pedit" "_M" ss1 "" "_Y" "_J" "_J" "_B" fuzz "")
	  (command "_.pedit" "_M" ss1 "" "_J" "_J" "_B" fuzz "")
	)
      )
  )
  (setq ss1 nil)
  (setvar "cmdecho" oldcmdecho)
  (if A2k4 (setvar "PEDITACCEPT" oldpeditaccept))
  (princ)
)
(defun c:SCTQ (/)
 (princ "\nFor this while you can select only Polylines: ")
 (sssetfirst nil (ssget '((0 . "*POLYLINE"))))
)

(defun c:SCTAQ (/)
 (princ "\nAll Polylines are selected.")
 (sssetfirst nil (ssget "_X" '((0 . "*POLYLINE"))))
)
(defun c:SALL ()
 (setq TargEnt (car (entsel "\nSelect object on layer to select: ")))
 (princ TargEnt)
 (setq TargLayer (assoc 8 (entget TargEnt)))
 (sssetfirst nil (ssget "_X" (list TargLayer)))
 (princ)
)
(defun C:FMP ; = Fillet Multiple Polylines
  (/ plss n)
  (if (setq plss (ssget "_:L" '((0 . "LWPOLYLINE"))))
    (repeat (setq n (sslength plss))
      (command "_.fillet" "_polyline" (ssname plss (setq n (1- n))))
    ); repeat
  ); if
  (princ)
); defun

(defun rh:sammlung_n (o_lst grp / tmp n_lst)
  (setq n_lst nil)
  (cond ( (and o_lst (= (rem (length o_lst) grp) 0))
          (while o_lst
            (repeat grp (setq tmp (cons (car o_lst) tmp) o_lst (cdr o_lst)))
            (setq n_lst (cons (reverse tmp) n_lst) tmp nil)
          );end_while
        )
  );end_cond
  (if n_lst (reverse n_lst))
);end_defun rh:sammlung_n

(defun c:TEST (/ *error* c_doc c_spc sv_lst sv_vals ss cnt ent obj v_lst dst ans)

  (defun *error* ( msg )
    (if (and c_doc (= 8 (logand 8 (getvar 'UNDOCTL)))) (vla-endundomark c_doc))
    (mapcar 'setvar sv_lst sv_vals)
    (if (not (wcmatch (strcase msg) "*BREAK*,*CANCEL*,*EXIT*")) (princ (strcat "\nOops an Error : " msg " occurred.")))
    (princ)
  );end_*error*_defun
  
  (setq c_doc (vla-get-activedocument (vlax-get-acad-object))
        c_spc (vlax-get-property c_doc (if (= 1 (getvar 'cvport)) 'paperspace 'modelspace))
        sv_lst (list 'osmode 'cmdecho 'dynmode 'dynprompt)
        sv_vals (mapcar 'getvar sv_lst)
  );end_setq
  
  (mapcar 'setvar sv_lst '(0 0 3 1))

  (if (and c_doc (= 8 (logand 8 (getvar 'UNDOCTL)))) (vla-endundomark c_doc))
  (vla-startundomark c_doc)
  
  (prompt "\nSelect Polylines : ")
  (setq ss (ssget ":L" '((0 . "LWPOLYLINE,POLYLINE"))))
  (cond (ss
          (repeat (setq cnt (sslength ss))
            (setq obj (vlax-ename->vla-object (setq ent (ssname ss (setq cnt (1- cnt))))))
            (cond ( (= :vlax-false (vlax-get-property obj 'closed))
                    (cond ( (= (cdr (assoc 0 (entget ent))) "POLYLINE") (setq v_lst (rh:sammlung_n (vlax-get obj 'coordinates) 3)))
                          ( (= (cdr (assoc 0 (entget ent))) "LWPOLYLINE") (setq v_lst (rh:sammlung_n (vlax-get obj 'coordinates) 2)))
                    );end_cond
                    (setq dst (distance (car v_lst) (last v_lst)))
                    (initget "Yes No")
                    (setq ans (cond ( (getkword (strcat "Distance Start Pt -> End Pt " (rtos dst 2 4) " Close Polyline : ? [Yes/No] <No>"))) ("No")))
                    (cond ( (= ans "Yes")
                            (setq v_lst (reverse (cdr (reverse v_lst))))
                            (vlax-put obj 'coordinates (apply 'append v_lst))
                            (vlax-put-property obj 'closed :vlax-true)
                          )
                    );end_cond
                  )
            );end_cond
          );end_repeat
        )
  );end_cond

  (if (and c_doc (= 8 (logand 8 (getvar 'UNDOCTL)))) (vla-endundomark c_doc))
  (mapcar 'setvar sv_lst sv_vals)
  (princ)
);end_defun