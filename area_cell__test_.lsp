(defun C:compareLayers ( / ent1 ent2 layer1 layer2)
  (setq ent1 (car (entsel)))
  (setq ent2 (car (entsel)))
  (setq layer1 (cdr (assoc 8 (entget ent1))))
  (setq layer2 (cdr (assoc 8 (entget ent2))))
  (if (equal layer1 layer2)
      (alert "Les couches sont identiques")
      (alert "Les couches sont différentes"))
)

(defun c:test_surf_cal()
  (command "-layer" "E" 0 "g" "*" "l" "GEX_EDS_sdp__Suppression" "l" "GEX_EDS_sdp__Suppression_su" "")

  (setq sel-P (ssget "X" '((-4 . "<or")(-4 . "<and") (0 . "LWPOLYLINE")(8 . "GEX_EDS_sdp__Suppression") (-4 . "and>")(-4 . "<and") (0 . "CIRCLE")(8 . "GEX_EDS_sdp__Suppression") (-4 . "and>") (-4 . "or>"))))

    (command "-hachures" "p" "s" "a" "s" "n" "a" "o" "i" "o" "h" "o" "" "")
    (command "_clayer" "GEX_EDS_sdp__Suppression") 
    (command "-hachures" "s" sel-P "" "")
    (command "_clayer" "GEX_EDS_sdp__Suppression_su")
    (command "_area" sel-P)

;(setq sel1 (ssget "X" (list (cons 0 "HATCH")(cons 8 "GEX_EDS_sdp__Suppression"))))



)

(defun c:aream (/ olderr oldcmdecho errexit undox restore ss1 nr en tot_area)
  (defun errexit (s)
    (restore)
  )
 
  (defun undox ()
    (command "._undo" "_E")
    (setvar "cmdecho" oldcmdecho)
    (setq *error* olderr)
    (princ)
  )
 
  (setq olderr  *error*
        restore undox
        *error* errexit
  )
  (setq oldcmdecho (getvar "cmdecho"))
  (setvar "cmdecho" 0)
  (command "._UNDO" "_BE")
  (if (setq ss1 (ssget '((-4 . "<OR")
                         (0 . "POLYLINE")
                         (0 . "LWPOLYLINE")
                         (0 . "CIRCLE")
                         (0 . "ELLIPSE")
                         (0 . "SPLINE")
                         (0 . "REGION")
                         (-4 . "OR>")
                        )
                )
      )
    (progn
      (setq nr 0)
      (setq tot_area 0.0)
      (setq en (ssname ss1 nr))
      (while en
        (command "._area" "_O" en)
        (setq tot_area (+ tot_area (getvar "area")))
        (setq nr (1+ nr))
        (setq en (ssname ss1 nr))
      )
      (princ "\nTotal Area = ")
      (princ tot_area)
    )
  )
  (setq ss1 nil)
  (restore)
)

(defun c:ACPTC (/ File f PlineSelSet PlineArea)

  (defun *error* (emsg)
    (if (or (= emsg "quit / exit abort")
            (= emsg "bad argument type: lselsetp nil")
        ) ;_  or
      (princ)
      (princ emsg)
    ) ;_  if
    (setvar 'OSMODE osm)
    (setvar 'CMDECHO cmd)
    (gc)
  ) ;_  defun


  (setq cmd (getvar 'CMDECHO)
        osm (getvar 'OSMODE)
  ) ;_  setq
  (setvar 'CMDECHO 0)
  (setvar 'OSMODE 0)

  (vl-load-com)
  (while
    (setq PlineSelSet (ssadd (car (entsel "\nSelect a Closed Polyline for Area Calculation "))))
    (command "._area" "O" PlineSelSet)
    (setq PlineArea (atof(rtos(getvar "area")2 2)))
    (setq AreaLayer (cdr (assoc 8 (entget (ssname PlineSelSet 0)))))
    (setq ent(entsel "\nSelect table cell to fill with area value!"))
    (vla-HitTest
      (vlax-ename->vla-object (car ent))
      (vlax-3d-point (cadr ent))
      (vlax-3d-point (trans (getvar 'ViewDir) 1 0))
      'outRow
      'outCol
      )
    (princ outRow)
    (princ outCol)
    (setq MyTable(vlax-ename->vla-object (car ent)))
    (setq sID1 (vla-CreateContent MyTable outRow outCol 0))
    (vla-SetTextString MyTable outRow outCol sID1 PlineArea)
    (vla-Regen doc :vlax-true)
  ) ; while


) ; Defun

(princ "\nArea of closed polylines to table cell...Type ACPTC")


;|«Visual LISP© Format Options»
(100 2 1 2 T " " 100 6 0 0 1 nil T nil T)
;*** DO NOT add text below the comment! ***|;

(defun c:Hatch2Excel (/ acdoc lst tot file cell sheet n)
 (vl-load-com)
 (setq	acdoc (vla-get-ActiveDocument (vlax-get-acad-object))
lst   (vl-sort
	(mapcar
	  (function
	    (lambda (l)
	      (setq tot 0.0)
	      (if (ssget "_X" (list '(0 . "HATCH") (cons 8 l)))
		(vlax-for h (vla-get-ActiveSelectionSet acdoc)
		  (setq tot (+ tot (vla-get-area h)))
		)
	      )
	      (list l tot)
	    )
	  )
	  (getlayers nil nil nil)
	)
	(function (lambda (x1 x2) (	      )
 )
 (if lst
   (if	(member (type getexcel) '(SUBR USUBR))
     (if (setq file (getfiled "Choisir ou créer un fichier Excel" "" "xls" 33))
(if (member (type doubleinputbox) '(SUBR USUBR))
  (progn
    (while (not	(and
		  (setq	cell  (doubleinputbox
				"Hachures vers Excel"
				"Nom de la feuille Excel"
				"Cellule de départ"
				"Feuil1"
				"A1"
			       )
			sheet (car cell)
			cell  (cadr cell)
		  )
		  (cell-p cell)
		)
	   )
      (alert "Référence de cellule non valide.")
    )
    (and (= sheet "") (setq sheet nil))
    (OpenExcel (cond ((findfile file))) sheet nil)
    (repeat (setq n (length lst))
      (putCell cell (car lst))
      (setq lst	 (cdr lst)
	    cell (Row+n cell 1)
      )
    )
    ;;---------------- Somme des surfaces ----------------;;
    (putCell
      cell
      (list "Total"
	    (strcat "=somme("
		    (column+n (row+n cell (- n)) 1)
		    ":"
		    (column+n (row+n cell (- 1)) 1)
	    )
      )
    )
    ;;----------------------------------------------------;;
    (CloseExcel file)
  )
  (alert "La routine LISP DoubleInputBox doit être chargée.")
)
     )
     (alert "GetExcel.lsp doit être chargé")
   )
 )
 (princ)
) )))