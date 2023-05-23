;===================================================
; SDP : fonction permettant d'effectuer les applats de couleurs 
; sur les elements de calcul de surface de Planchers
;===================================================
; fonction principale
 (defun TA()
            ;;; Planchers avant déductions 	
            (command "-layer" "E" 0 "g" "*" "l" "GEX_EDS_sdp_teinte_contour" "l" "GEX_EDS_sdp_SDP_su" "")""
            
            (foreach element liste	
              (command "-calque" "ch" "0" "" "")
              (command "-calque" "l" element "")
              
              (setq sel (ssget "X" (list (cons -4 "<or")(cons -4 "<and") (cons 0 "LWPOLYLINE")(cons 8 element) 
                            (cons -4 "and>")(cons -4 "<and") (cons 0 "CIRCLE")(cons 8 element)
                            (cons -4 "and>") (cons -4 "or>"))))
              
              (command "-hachures" "p" "s" "a" "s" "n" "a" "o" "i" "o" "h" "o" "" "")
              (command "_clayer" "GEX_EDS_sdp_teinte_contour")  
              (command "-hachures" "s" sel "" "")
              (command "_clayer" "GEX_EDS_sdp_SDP_su")
            )
            
            (getCalqueAppliqueApplatSDP "GEX_EDS_sdp_teinte_contour" 1)
            
            ;;; Vides ;;;  
            (command "-layer" "E" 0 "g" "*" "l" "GEX_EDS_sdp_2-tremie" "l" "GEX_EDS_sdp_2-tremie_su" "")

            (setq sel-T (ssget "X" '((-4 . "<or")(-4 . "<and") (0 . "LWPOLYLINE")(8 . "GEX_EDS_sdp_2-tremie") (-4 . "and>")
                      (-4 . "<and") (0 . "CIRCLE")(8 . "GEX_EDS_sdp_2-tremie") (-4 . "and>") (-4 . "or>"))))

            (command "-hachures" "p" "s" "a" "s" "n" "a" "o" "i" "o" "h" "o" "" "")
            (command "_clayer" "GEX_EDS_sdp_2-tremie")
            (command "-hachures" "s" sel-T "" "") 
            (command "_clayer" "GEX_EDS_sdp_2-tremie_su")
            (getCalqueAppliqueApplatSDP "GEX_EDS_sdp_2-tremie" 0)
            

            ;;; Surfaces dont h < 1.80 m ;;;
            (command "-layer" "E" 0 "g" "*" "l" "GEX_EDS_sdp_3-h-180" "l" "GEX_EDS_sdp_3-h-180_su" "")

            (setq sel-C (ssget "X" '((-4 . "<or")(-4 . "<and") (0 . "LWPOLYLINE")(8 . "GEX_EDS_sdp_3-h-180") (-4 . "and>")
                      (-4 . "<and") (0 . "CIRCLE")(8 . "GEX_EDS_sdp_3-h-180") (-4 . "and>") (-4 . "or>"))))

            (command "-hachures" "p" "s" "a" "s" "n" "a" "o" "i" "o" "h" "o" "" "") 
            (command "_clayer" "GEX_EDS_sdp_3-h-180") 
            (command "-hachures" "s" sel-C "" "")  
            (command "_clayer" "GEX_EDS_sdp_3-h-180_su")
            (getCalqueAppliqueApplatSDP "GEX_EDS_sdp_3-h-180" 0)
)

(defun SDP()
            ;;; Stationnement ;;;	  
            (command "-layer" "E" 0 "g" "*" "l" "GEX_EDS_sdp_5-PK" "l" "GEX_EDS_sdp_5-PK_su" "")

            (setq sel-H (ssget "X" '((-4 . "<or")(-4 . "<and") (0 . "LWPOLYLINE")(8 . "GEX_EDS_sdp_5-PK") (-4 . "and>")
                      (-4 . "<and") (0 . "CIRCLE")(8 . "GEX_EDS_sdp_5-PK") (-4 . "and>") (-4 . "or>"))))

            (command "-hachures" "p" "s" "a" "s" "n" "a" "o" "i" "o" "h" "o" "" "")
            (command "_clayer" "GEX_EDS_sdp_5-PK") 
            (command "-hachures" "s" sel-H "" "") 
            (command "_clayer" "GEX_EDS_sdp_5-PK_su")
            (getCalqueAppliqueApplatSDP "GEX_EDS_sdp_5-PK" 0)

            ;;; Combles ;;;	  
            (command "-layer" "E" 0 "g" "*" "l" "GEX_EDS_sdp_6-combles" "l" "GEX_EDS_sdp_6-combles_su" "")

            (setq sel-L (ssget "X" '((-4 . "<or")(-4 . "<and") (0 . "LWPOLYLINE")(8 . "GEX_EDS_sdp_6-combles") (-4 . "and>")
                      (-4 . "<and") (0 . "CIRCLE")(8 . "GEX_EDS_sdp_6-combles") (-4 . "and>") (-4 . "or>"))))

            (command "-hachures" "p" "s" "a" "s" "n" "a" "o" "i" "o" "h" "o" "" "")
            (command "_clayer" "GEX_EDS_sdp_6-combles")
            (command "-hachures" "s" sel-L "" "") 
            (command "_clayer" "GEX_EDS_sdp_6-combles_su")
            (getCalqueAppliqueApplatSDP "GEX_EDS_sdp_6-combles" 0)


            ;;; Locaux techniques ;;;	  
            (command "-layer" "E" 0 "g" "*" "l" "GEX_EDS_sdp_7-LT" "l" "GEX_EDS_sdp_7-LT_su" "")

            (setq sel-P (ssget "X" '((-4 . "<or")(-4 . "<and") (0 . "LWPOLYLINE")(8 . "GEX_EDS_sdp_7-LT") (-4 . "and>")
                      (-4 . "<and") (0 . "CIRCLE")(8 . "GEX_EDS_sdp_7-LT") (-4 . "and>") (-4 . "or>"))))

            (command "-hachures" "p" "s" "a" "s" "n" "a" "o" "i" "o" "h" "o" "" "")
            (command "_clayer" "GEX_EDS_sdp_7-LT") 
            (command "-hachures" "s" sel-P "" "")
            (command "_clayer" "GEX_EDS_sdp_7-LT_su")
            (getCalqueAppliqueApplatSDP "GEX_EDS_sdp_7-LT" 0)


            ;;; Caves ;;;	  
            (command "-layer" "E" 0 "g" "*" "l" "GEX_EDS_sdp_8-cave" "l" "GEX_EDS_sdp_8-cave_su" "")

            (setq sel-S (ssget "X" '((-4 . "<or")(-4 . "<and") (0 . "LWPOLYLINE")(8 . "GEX_EDS_sdp_8-cave") (-4 . "and>")
                      (-4 . "<and") (0 . "CIRCLE")(8 . "GEX_EDS_sdp_8-cave") (-4 . "and>") (-4 . "or>"))))

            (command "-hachures" "p" "s" "a" "s" "n" "a" "o" "i" "o" "h" "o" "" "")
            (command "_clayer" "GEX_EDS_sdp_8-cave")
            (command "-hachures" "s" sel-S "" "") 
            (command "_clayer" "GEX_EDS_sdp_8-cave_su")
            (getCalqueAppliqueApplatSDP "GEX_EDS_sdp_8-cave" 0)
)

(setq launchSdpCounter 1)
(defun c:TAsdp( )
	(setq os (getvar "osmode"))
	(setvar "osmode" 0)
	(setvar "HPISLANDDETECTIONMODE" 0)
		(if (= (= launchSdpCounter 1) T)(
			(setq launchSdpCounter (+ launchSdpCounter 1))	
			; check de tous les calques utilisés dans le programme (TODO : Verifier la cohérence des noms de calques avec charte)
			(setq liste (getLayersdp "GEX_EDS_sdp_1-"))	
			;(if (=  liste nil) (command "_layer" "_new" "GEX_EDS_sdp_1-SDP" "C" "U" "255,0,0" "GEX_EDS_sdp_1-SDP" ""))
			(if (=  (tblsearch "layer" "GEX_EDS_sdp_2-tremie") nil)(command "-layer" "n" "GEX_EDS_sdp_2-tremie" "CO" "U" "255,255,127" "GEX_EDS_sdp_2-tremie" ""))
			(if (=  (tblsearch "layer" "GEX_EDS_sdp_3-h-180") nil)(command "-layer" "n" "GEX_EDS_sdp_3-h-180" "CO" "U" "165,82,82" "GEX_EDS_sdp_3-h-180" ""))
			(if (=  (tblsearch "layer" "GEX_EDS_sdp_5-pk") nil)(command "-layer" "n" "GEX_EDS_sdp_5-pk" "CO" "U" "153,153,153" "GEX_EDS_sdp_5-PK" ""))
			(if (=  (tblsearch "layer" "GEX_EDS_sdp_6-combles") nil)(command "-layer" "n" "GEX_EDS_sdp_6-combles" "CO" "U" "82,0,165" "GEX_EDS_sdp_6-combles" ""))
			(if (=  (tblsearch "layer" "GEX_EDS_sdp_7-lt") nil)(command "-layer" "n" "GEX_EDS_sdp_7-lt" "CO" "U" "0,127,255" "GEX_EDS_sdp_7-LT" "")"")
			(if (=  (tblsearch "layer" "GEX_EDS_sdp_8-cave") nil)(command "-layer" "n" "GEX_EDS_sdp_8-cave" "CO" "U" "255,191,127" "GEX_EDS_sdp_8-cave"  ""))
			(if (=  (tblsearch "layer" "GEX_EDS_sdp_teinte_contour") nil)(command "-layer" "n" "GEX_EDS_sdp_teinte_contour" "CO" "U" "255,127,127" "GEX_EDS_sdp_teinte_contour" ""))
			(if (=  (tblsearch "layer" "GEX_EDS_sdp_SDP_su") nil)(command "-layer" "n" "GEX_EDS_sdp_SDP_su" "CO" "U" "255,0,0" "GEX_EDS_sdp_SDP_su"  "")"")
			(if (=  (tblsearch "layer" "GEX_EDS_sdp_2-tremie_su") nil)(command "-layer" "n" "GEX_EDS_sdp_2-tremie_su" "_color" "7" "GEX_EDS_sdp_2-tremie_su" ""))
			(if (=  (tblsearch "layer" "GEX_EDS_sdp_3-h-180_su") nil)(command "-layer" "n" "GEX_EDS_sdp_3-h-180_su" "_color" "7" "GEX_EDS_sdp_3-h-180_su"  ""))
			(if (=  (tblsearch "layer" "GEX_EDS_sdp_5-pk_su") nil)(command "-layer" "n" "GEX_EDS_sdp_5-pk_su" "_color" "7" "GEX_EDS_sdp_5-PK_su" ""))
			(if (=  (tblsearch "layer" "GEX_EDS_sdp_6-combles_su") nil)(command "-layer" "n" "GEX_EDS_sdp_6-combles_su" "_color" "7" "GEX_EDS_sdp_6-combles_su"  ""))
			(if (=  (tblsearch "layer" "GEX_EDS_sdp_7-lt_su") nil)(command "-layer" "n" "GEX_EDS_sdp_7-lt_su" "_color" "7" "GEX_EDS_sdp_7-LT_su" "")"")
			(if (=  (tblsearch "layer" "GEX_EDS_sdp_8-cave_su") nil)(command "-layer" "n" "GEX_EDS_sdp_8-cave_su" "_color" "7" "GEX_EDS_sdp_8-cave_su" ""))
			;;======================Add Style convenable au charte graphique================================================ 
			(if (=  (tblsearch "style" "INT_Roman") nil)(command "-STYLER" "INT_Roman" "swissl.ttf" "0.000" "" "" "" "" "")"")
			;;(if (=  (tblsearch "style" "SURF") nil)(command "-STYLER" "SURF" "swissl.ttf" "0.000" "" "" "" "" "")"")
			; Lancer le calcul TA et SDP
      (TA)
		  (SDP)
      ; Appliquer la comparaison entre deux plans
    ;  (cdwg)
			(command "-layer" "l" "*" "E" "0" "g" "GEX_EDS_sdp_teinte_contour" "")
			(alert "         *********   O P E R A T I O N    T E R M I N E E   *********        ")
			(setvar "osmode" os)
			(princ "\n")
			(princ)
		)
	)

		(if (= (/= launchSdpCounter 1) T) ( boxMessagesdp ))


)
;==================================centre Inert =====================

(defun centreInersdp (s1)
  (setq Last_region (entlast))
  (setq lst nil)
  (vl-load-com)
  (if entlast
    (progn
       (setq anObj (vlax-ename->vla-object (entlast)))
       (princ (strcat "\nObject Name: " (setq objName (vla-Get-ObjectName anObj))))
        (if (equal objName "AcDbRegion")
        (progn
          (setq vCentroid (vla-Get-Centroid anObj))
          (setq strCentroidProp (vl-princ-to-string (setq CentroidLst
          (vlax-safearray->list (vlax-variant-value vCentroid)))))
          (if (< (length CentroidLst) 3)
           (setq CentroidLst (append CentroidLst (list 0.0)))
          )
          (princ CentroidLst)
          (princ (strcat "\nRegion Centroid: " strCentroidProp))
          (setvar "PDMODE" 3)
          (setq *MS* (vla-Get-ModelSpace (setq acadDoc
          (vla-Get-ActiveDocument (setq acadApp (vlax-get-acad-object))))))
          (setq ptObj (vla-AddPoint *MS* (vlax-3d-Point CentroidLst)))
          (vla-Put-Color ptObj acYellow)
        )
        (princ "\nRegion was not selected !")
       )
    )
  )
 (princ CentroidLst)

)
;====================================init plan========================
(defun boxMessagesdp() 

     	(lspOkCancel "Commande lancer 2 fois " "appuyer sur cancel pour annuler" "Ou appuyer sur ok pour continuer" "warning !")
  		(if (= result T) (
		 	 (prompt "annuler les commandes precedente \n")
		 	 (command "annuler" "90" )
			 (alert "    *********  commande Annuler veuillez relancer vos calcul SDP  *********        ")
			 (setq launchSdpCounter 1)
		  )
		  )
        (if (= result nil) (prompt "annuler la commande actuelle \n"))
)

;;; fonction de recuperation du Calque et de calcul de la surface à afficher
(defun getCalqueAppliqueApplatSDP(calqueC iscontour)
	;;; de l'ensemble des contours du calque passé en parametre 
	(princ calqueC)
	(princ "\n")
	
	(setq sel1 (ssget "X" (list (cons 0 "HATCH")(cons 8 calqueC))))
	(command "_draworder" "p" "" "_back")	
	(setq ind 0 surftotal 0 surfad 0 somme 0)

	(if (/= sel1 nil)						;si l'ensemble des elements du calque n'est pas vide 
		(while (setq nm (ssname sel1 ind))			;Recuperartion de chaque elemment de la liste issue de ssget (calque)
			(setq s1 (cdr (assoc -1 (entget nm))))	;recupere l'entité à partir de son nom 
			(setq entite (entget nm))
			(setq ind1 0 totx 0 toty 0)
			
			(setq entite (entget s1))
			(setq entite (member (assoc 72 entite) entite))
			
			(while (= (car(assoc 11 entite)) 11)	; recuperation du text designation et calcul de la position du texte à afficher
				(setq x (nth 1 (assoc 11 entite)))
				(setq y (nth 2 (assoc 11 entite)))
				(setq totx (+ totx x))
				(setq toty (+ toty y))
				(setq entite (member (assoc 72 entite) entite))
				(setq entite (member (assoc 11 entite) entite))
				(setq ind1 (1+ ind1)))							;fin du while 2

			(setq xmoyen (/ totx ind1))
			(setq ymoyen (/ toty ind1))
			(setq cxyz (list xmoyen ymoyen))
			(setq cxyz (trans cxyz 0 1))
			(command "_area" "_o" s1)			; calcul de l'aire de la polyligne 
			
			(setq surfpoly (getvar "area"))
			(setq surfpoly (rtos surfpoly 2 1))
			(setq surfpoly (strcat surfpoly " m\\U+00B2"))  ; valeur à afficher et mettre carré
				;; calcul du centre 
			(princ s1) (princ " entity name  \n")
			(command "-EDITHACH" s1 "c" "r" "o")				 
			(setq centroidPointsdp (centreInersdp s1))

			(if (= iscontour 1) (command "_TEXT" "S" "surf" "j" "MC" centroidPointsdp 0.5 100 surfpoly))
			(if (= iscontour 0) (command "_TEXT" "S" "surf" "j" "MC" centroidPointsdp 0.15 100 surfpoly))
		
			(setq ind (1+ ind)) )							   ;fin du while 1
    )                                                          ;fin de if
)


;=========================================================

(defun lspOkCancel (message1 message2 message3 main)

  (setq dcl_id (load_dialog "msgbox.dcl"))
  (if (not (new_dialog "lspOkCancel" dcl_id))
    (exit)
  )

  (set_tile "message1" message1)
  (set_tile "message2" message2)
  (set_tile "message3" message3)
  (set_tile "main" main)

  (action_tile "cancel" "(done_dialog) (setq result nil)")
  (action_tile "accept" "(done_dialog) (setq result T)" )
  (start_dialog)
  (unload_dialog dcl_id)
  (princ)
)

;===============================================
;;; search all layers with certain caracter
(defun getLayersdp (searchparamtext)
	(setq searchparam (strcat "*" searchparamtext "*"))
	
	(while (/= (setq newelem (tblnext "layer")) nil); Start loop for remaining layers
		(if (= (wcmatch (cdr (assoc 2 newelem)) searchparam) T) (setq newelem (list (cdr (assoc 2 newelem)))) (setq newelem nil)); Check each Layer
		(if (/= nil newelem) (setq laylist (append laylist newelem)))	; Add to Layer list if appropriate
	)	
	;(setq laylist (acad_strlsort laylist))
	(setq listlength (rtos (length laylist) 2 0))
	;(alert (strcat "There are " listlength " layers that contain \"" searchparamtext "\""))
	(princ laylist)
)
  
  
;===================================================
; 				SDT  :  TABLEAU SDP                 
;===================================================
(defun c:sdt ()
	;===================================== Planchers avant déductions =========================
	(setq total_val_text_SP (getDesignationEtAfficheValeursdp "GEX_EDS_sdp_SDP_su" "SP"))
	;======================================== VIDES ===========================================
	(setq total_val_text_V (getDesignationEtAfficheValeursdp "GEX_EDS_sdp_2-tremie_su" "V"))
	;======================================= H 180 ============================================
	(setq total_val_text_180 (getDesignationEtAfficheValeursdp "GEX_EDS_sdp_3-h-180_su" "180"))
	;====================================== TOTAL TA ==========================================
	(setq total_val_text_TA (- (atof (rtos total_val_text_SP 2 0)) (atof (rtos total_val_text_V 2 0)) (atof (rtos total_val_text_180 2 0)) ))
	(setq total_val_text_TA (rtos total_val_text_TA 2 0))
	(command "-attedit" "N" "N" "SDP" "TA" "0" "0" total_val_text_TA)
	;====================================== STATIONEMENT ======================================	
	(setq total_val_text_ST (getDesignationEtAfficheValeursdp "GEX_EDS_sdp_5-PK_su" "ST"))
	;======================================== COMBLES =========================================
	(setq total_val_text_CO (getDesignationEtAfficheValeursdp "GEX_EDS_sdp_6-combles_su" "CO"))
	;==================================== LOCAUX TECHNIQUE ====================================
	(setq total_val_text_LT (getDesignationEtAfficheValeursdp "GEX_EDS_sdp_7-LT_su" "LT"))
	;======================================= CAVE =============================================
	(setq total_val_text_c (getDesignationEtAfficheValeursdp "GEX_EDS_sdp_8-cave_su" "C"))
	;====================================== ISOLATION =========================================
	(initget "Locaux Habitation Mixte" )  
	(setq choix (getkword "\n Type du batiment (Locaux (L), Habitation(H), Mixte (M)): <Locaux> "))
	
	(if (= choix nil)(setq choix "L"))  ; valeur par defaut si Nature vide == Locaux 
	(if (= choix "M") 
		(setq total_val_text_i (* (getint "\n Entrer la superficie de locaux d'habitation : ") 0.10)))		
	(if (= choix "L") (setq total_val_text_i 0.0))	
	(if (= choix "H")
		(setq total_val_text_i (* (- (atof total_val_text_TA) total_val_text_LT total_val_text_c total_val_text_CO total_val_text_ST ) 0.10)))

	(command "-attedit" "N" "N" "SDP" "ISOL" "0" "0" (rtos total_val_text_i 2 0))
	
	;========================================= SDP ===========================================
	(setq total_val_text_sdp (- (atof total_val_text_TA) (atof (rtos total_val_text_ST 2 0)) (atof (rtos total_val_text_CO 2 0)) (atof (rtos total_val_text_LT 2 0))
	 (atof (rtos total_val_text_c 2 0)) (atof (rtos total_val_text_i 2 0)) ))
	 
	(setq total_val_text_sdp (atoi (rtos total_val_text_sdp 2 0)))
	(princ total_val_text_sdp)
	(princ "\n")
	
	(command "-attedit" "N" "N" "SDP" "SDP" "0" "0" total_val_text_sdp)
	(alert "         *********   O P E R A T I O N    T E R M I N E E   *********        ")
	(setvar "osmode" os)
	(princ "\n")
	(princ)
)
(princ)

;;; fonction qui recupere le texte des hachures et calcule les elements de la legende puis les affiches
(defun getDesignationEtAfficheValeursdp(calqueC texte)
	(print calqueC)
	(setq ind 0 total_val 0 total 0)
	(setq sel_SP (ssget "x" (list (cons 8 calqueC) (cons 0 "TEXT"))))	
	
	(if (/= sel_SP nil)	
		(progn
			(while (setq nm (ssname sel_SP ind))
				(setq val_text_SP (assoc 1 (entget nm))
					val_text_SP (atof (cdr val_text_SP))
					total_val (+ total val_text_SP)
					total total_val
					ind (1+ ind)) 
			)
			(command "-attedit" "N" "N" "SDP" texte "0" "0" (rtos total_val 2 0))
			(princ total_val)	
		)
		(princ total_val)
	)
)

;=============== FIN SDT =========================== 

;===================================================
; MISE A ZERO DE TOUTES LES VALEURS DU TABLEAU SDP 
;===================================================
(defun c:sd0 ()
	; edition de la légende et remettre toutes les valeurs à 0
	(command "-attedit" "N" "N" "SDP" "SP" (rtos total_val_text_SP 2 0) (rtos total_val_text_SP 2 0) "0" )
	(command "_regen")
	(command "-attedit" "N" "N" "SDP" "V" (rtos total_val_text_V 2 0) (rtos total_val_text_V 2 0) "0" )
    (command "_regen")
    (command "-attedit" "N" "N" "SDP" "180" (rtos total_val_text_180 2 0) (rtos total_val_text_180 2 0) "0" )
	(command "_regen")
	(command "-attedit" "N" "N" "SDP" "TA" total_val_text_TA total_val_text_TA "0" )
	(command "_regen")
    (command "-attedit" "N" "N" "SDP" "ST" (rtos total_val_text_ST 2 0) (rtos total_val_text_ST 2 0) "0" )
	(command "_regen")
    (command "-attedit" "N" "N" "SDP" "CO" (rtos total_val_text_CO 2 0) (rtos total_val_text_CO 2 0) "0" )
	(command "_regen")
	(command "-attedit" "N" "N" "SDP" "LT" (rtos total_val_text_LT 2 0) (rtos total_val_text_LT 2 0) "0" )
	(command "_regen")
	(command "-attedit" "N" "N" "SDP" "C" (rtos total_val_text_c 2 0) (rtos total_val_text_c 2 0) "0" )
	(command "_regen")
	(command "-attedit" "N" "N" "SDP" "ISOL" (rtos total_val_text_i 2 0) (rtos total_val_text_i 2 0) "0" )
	(command "_regen")
	(command "-attedit" "N" "N" "SDP" "SDP" (atoi (rtos total_val_text_sdp 2 0)) (atoi (rtos total_val_text_sdp 2 0)) "0" )
	(command "_regen")
	)

;======= FIN SD0 ===================================

;_____________________ Comparer les plans d'existant et du projet _____________________

(vl-load-com)

(defun c:cdwg (/       app     cdoc    fichier old     name    sp1
       sp2     lst2    e       obj     lstmodif	       lstajout
       lstsuppr	       lst     obj     sup
      )

(setq ACADLSPASDOC (getvar "ACADLSPASDOC"))
(setvar "ACADLSPASDOC" 0)

 (setq	app	(vlax-get-acad-object)
        cdoc	(vla-get-activedocument app)
        fichier	(getfiled "Selection du plan existant"(strcat (vl-filename-directory (vla-get-fullname cdoc)) "/" )"dwg"4)
        old	(vla-open (vla-get-documents app) fichier)
        name	(vla-get-fullname cdoc)
        s	(getvar "date")
        t1 	(* 86400.0 (- s (fix s)))
 )

 (vla-saveas
   cdoc
   (strcat (substr name 1 (- (strlen name) 4))
    " Modications depuis "
    (vla-get-name old)
   )
 )

 (setq	sp1 (vla-get-modelspace cdoc)
        sp2 (vla-get-modelspace old)
 )

 (vlax-for lay	(setq layers (vla-get-layers cdoc))
   (vlax-put lay 'color 253)
   (vla-put-lock lay :vlax-false)
 )

 (vlax-for lay	(vla-get-layers old)
   (vla-put-lock lay :vlax-false)
 )

 (vlax-for ent	sp2
   (setq lst2 (cons (cons (vla-get-handle ent) ent) lst2))
 )

 (defun equal-objects1 (obj1 obj2)
   (vl-every
     (function
(lambda	(p)
  (or (not (vlax-property-available-p obj1 p))
      (equal (vlax-get obj1 p)
	     (vlax-get obj2 p)
	     1e-9
      )
  )
)
     )
     '(ObjectName    Center	    Radius	  Coordinates
StartPoint    EndPoint	    StartAngle	  EndAngle
MajorAxis     RadiusRatio   TextString	  InsertionPoint
Width	      Height
      )
   )
 )

;; EQUAL-OBJECTS (gile)
;; Compare les propriétés de deux objets

(defun equal-objects (obj1 obj2)
 (vl-every
   (function
     (lambda (p)
(and
  (or
    (not (vlax-property-available-p obj1 p))
    (equal (vlax-get obj1 p)
	   (vlax-get obj2 p)
	   1e-9
    )
  )
  (or
    (not
      (and (= (vla-get-ObjectName obj1) "AcDbBlockReference")
	   (= (vla-get-HasAttributes obj1))
      )
    )
    (vl-every 'equal-objects
	      (vlax-invoke obj1 'getAttributes)
	      (vlax-invoke obj2 'getAttributes)
    )
  )
)
     )
   )
   '(ObjectName     Center	    Radius	   Coordinates
     StartPoint     EndPoint	    StartAngle	   EndAngle
     MajorAxis	     RadiusRatio    TextString	   InsertionPoint
     Width	     Height	    Rotation	   XScaleFactor
     YScaleFacor    ZScaleFactor
    )
 )
)

 (vlax-put (vla-add layers "GEX_EDS_sdp__Ajout") 'color 172)
 (vlax-put (vla-add layers "GEX_EDS_sdp__Modication") 'color 92)
 (vlax-put (vla-add layers "GEX_EDS_sdp__Suppression") 'color 10)

 (vlax-for ent	sp1
   (vla-put-color ent 256)

   (if	(setq e (assoc (vlax-get ent 'handle) lst2))
     ;;vérifie si le handle existe sur les 2 plans
     (progn
(cond ((not (equal-objects ent (cdr e)))
       (vla-put-layer ent "GEX_EDS_sdp__Modication")
      )
)
(setq lst2 (vl-remove e lst2))
     )
     (vla-put-layer ent "GEX_EDS_sdp__Ajout")
   )
 )

 (if lst2
   (foreach n lst2
     (vla-put-layer
(car (vlax-invoke old 'CopyObjects (list (cdr n)) sp1))
"GEX_EDS_sdp__Suppression"
     )
   )
 )

 (vla-close old)
 (vla-purgeall cdoc)
 (vla-save cdoc)
 (setq	s  (getvar "date")
t2 (* 86400.0 (- s (fix s)))
tt (- t2 t1)
 )

 (if (> tt 60)
   (progn
     (setq sec	(rem tt 60)
    mn	(strcat (rtos (/ (- tt sec) 60) 2 0) " mn ")
    sec	(strcat (rtos sec 2 0) " s")
     )
   )
   (progn
     (setq sec	(strcat (rtos tt 2 0) " s")
    mn	"0 mn "
     )
   )
 )

 (alert
   (strcat
     "Plan de reperages des modifications\n\nLes ajouts sont en vert\nLes modifications en bleu\nLes suppressions en rouge \n\nTemps d'execution : "
     mn
     sec
   )
 )
(setvar "ACADLSPASDOC" ACADLSPASDOC)

)					;defun
