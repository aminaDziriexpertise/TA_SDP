
; fonction de calcul de TA_sdp_EXISTANT

(setq launchSdpCounter 1)
(defun c:TA_SDP__existant( )
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
		;	(if (=  (tblsearch "style" "INT_Roman") nil)(command "-STYLER" "INT_Roman" "swissl.ttf" "0.000" "" "" "" "" "")"")
			;;(if (=  (tblsearch "style" "SURF") nil)(command "-STYLER" "SURF" "swissl.ttf" "0.000" "" "" "" "" "")"")
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
      (setq surfpoly_teinte_existant surfpoly)
      ;(alert surfpoly_teinte_existant)
			
			;;; Vides ;;;  
			(command "-layer" "E" 0 "g" "*" "l" "GEX_EDS_sdp_2-tremie" "l" "GEX_EDS_sdp_2-tremie_su" "")

			(setq sel-T (ssget "X" '((-4 . "<or")(-4 . "<and") (0 . "LWPOLYLINE")(8 . "GEX_EDS_sdp_2-tremie") (-4 . "and>")
								(-4 . "<and") (0 . "CIRCLE")(8 . "GEX_EDS_sdp_2-tremie") (-4 . "and>") (-4 . "or>"))))

			(command "-hachures" "p" "s" "a" "s" "n" "a" "o" "i" "o" "h" "o" "" "")
			(command "_clayer" "GEX_EDS_sdp_2-tremie")
			(command "-hachures" "s" sel-T "" "") 
			(command "_clayer" "GEX_EDS_sdp_2-tremie_su")
			(getCalqueAppliqueApplatSDP "GEX_EDS_sdp_2-tremie" 0)
      (setq surfpoly_tremie_existant surfpoly)
      ;(alert surfpoly_tremie_existant)
			

			;;; Surfaces dont h < 1.80 m ;;;
			(command "-layer" "E" 0 "g" "*" "l" "GEX_EDS_sdp_3-h-180" "l" "GEX_EDS_sdp_3-h-180_su" "")

			(setq sel-C (ssget "X" '((-4 . "<or")(-4 . "<and") (0 . "LWPOLYLINE")(8 . "GEX_EDS_sdp_3-h-180") (-4 . "and>")
								(-4 . "<and") (0 . "CIRCLE")(8 . "GEX_EDS_sdp_3-h-180") (-4 . "and>") (-4 . "or>"))))

			(command "-hachures" "p" "s" "a" "s" "n" "a" "o" "i" "o" "h" "o" "" "") 
			(command "_clayer" "GEX_EDS_sdp_3-h-180") 
			(command "-hachures" "s" sel-C "" "")  
			(command "_clayer" "GEX_EDS_sdp_3-h-180_su")
			(getCalqueAppliqueApplatSDP "GEX_EDS_sdp_3-h-180" 0)
      (setq surfpoly_h_180_existant surfpoly)
      ;(alert surfpoly_h_180_existant)

			;;; Stationnement ;;;	  
			(command "-layer" "E" 0 "g" "*" "l" "GEX_EDS_sdp_5-PK" "l" "GEX_EDS_sdp_5-PK_su" "")

			(setq sel-H (ssget "X" '((-4 . "<or")(-4 . "<and") (0 . "LWPOLYLINE")(8 . "GEX_EDS_sdp_5-PK") (-4 . "and>")
								(-4 . "<and") (0 . "CIRCLE")(8 . "GEX_EDS_sdp_5-PK") (-4 . "and>") (-4 . "or>"))))

			(command "-hachures" "p" "s" "a" "s" "n" "a" "o" "i" "o" "h" "o" "" "")
			(command "_clayer" "GEX_EDS_sdp_5-PK") 
			(command "-hachures" "s" sel-H "" "") 
			(command "_clayer" "GEX_EDS_sdp_5-PK_su")
			(getCalqueAppliqueApplatSDP "GEX_EDS_sdp_5-PK" 0)
      (setq surfpoly_pk_existant surfpoly)
      ;(alert surfpoly_pk_existant)
			;;; Combles ;;;	  
			(command "-layer" "E" 0 "g" "*" "l" "GEX_EDS_sdp_6-combles" "l" "GEX_EDS_sdp_6-combles_su" "")

			(setq sel-L (ssget "X" '((-4 . "<or")(-4 . "<and") (0 . "LWPOLYLINE")(8 . "GEX_EDS_sdp_6-combles") (-4 . "and>")
								(-4 . "<and") (0 . "CIRCLE")(8 . "GEX_EDS_sdp_6-combles") (-4 . "and>") (-4 . "or>"))))

			(command "-hachures" "p" "s" "a" "s" "n" "a" "o" "i" "o" "h" "o" "" "")
			(command "_clayer" "GEX_EDS_sdp_6-combles")
			(command "-hachures" "s" sel-L "" "") 
			(command "_clayer" "GEX_EDS_sdp_6-combles_su")
			(getCalqueAppliqueApplatSDP "GEX_EDS_sdp_6-combles" 0)
      (setq surfpolycomble_existant surfpoly)
      ;(alert surfpolycomble_existant)

			;;; Locaux techniques ;;;	  
			(command "-layer" "E" 0 "g" "*" "l" "GEX_EDS_sdp_7-LT" "l" "GEX_EDS_sdp_7-LT_su" "")

			(setq sel-P (ssget "X" '((-4 . "<or")(-4 . "<and") (0 . "LWPOLYLINE")(8 . "GEX_EDS_sdp_7-LT") (-4 . "and>")
								(-4 . "<and") (0 . "CIRCLE")(8 . "GEX_EDS_sdp_7-LT") (-4 . "and>") (-4 . "or>"))))

			(command "-hachures" "p" "s" "a" "s" "n" "a" "o" "i" "o" "h" "o" "" "")
			(command "_clayer" "GEX_EDS_sdp_7-LT") 
			(command "-hachures" "s" sel-P "" "")
			(command "_clayer" "GEX_EDS_sdp_7-LT_su")
			(getCalqueAppliqueApplatSDP "GEX_EDS_sdp_7-LT" 0)
      (setq surfpoly_LT_existant surfpoly)
      ;(alert surfpoly_LT_existant)


			;;; Caves ;;;	  
			(command "-layer" "E" 0 "g" "*" "l" "GEX_EDS_sdp_8-cave" "l" "GEX_EDS_sdp_8-cave_su" "")

			(setq sel-S (ssget "X" '((-4 . "<or")(-4 . "<and") (0 . "LWPOLYLINE")(8 . "GEX_EDS_sdp_8-cave") (-4 . "and>")
								(-4 . "<and") (0 . "CIRCLE")(8 . "GEX_EDS_sdp_8-cave") (-4 . "and>") (-4 . "or>"))))

			(command "-hachures" "p" "s" "a" "s" "n" "a" "o" "i" "o" "h" "o" "" "")
			(command "_clayer" "GEX_EDS_sdp_8-cave")
			(command "-hachures" "s" sel-S "" "") 
			(command "_clayer" "GEX_EDS_sdp_8-cave_su")
			(getCalqueAppliqueApplatSDP "GEX_EDS_sdp_8-cave" 0)
      (setq surfpoly_CA_existant surfpoly)
      ;(alert surfpoly_CA_existant)
		
			(command "-layer" "l" "*" "E" "0" "g" "GEX_EDS_sdp_teinte_contour" "")
			;(alert "         *********   O P E R A T I O N    T E R M I N E E   *********        ")
			(setvar "osmode" os)
			(princ "\n")
			(princ)

      ;==========================================================================================
                                ;Calcul TA SDP_existant
      ;===================================== Planchers avant déductions =========================
      (setq total_val_text_SP_existant (getDesignationEtAfficheValeursdp "GEX_EDS_sdp_SDP_su" "SP"))
      (alert (rtos total_val_text_SP_existant 2 0))


      ;======================================== VIDES ===========================================
      (setq total_val_text_V_existant (getDesignationEtAfficheValeursdp "GEX_EDS_sdp_2-tremie_su" "V"))
      ;(alert (rtos total_val_text_V 2 0))

      ;======================================= H 180 ============================================
      (setq total_val_text_180_existant (getDesignationEtAfficheValeursdp "GEX_EDS_sdp_3-h-180_su" "180"))

      ;====================================== TOTAL TA ==========================================
      (setq total_val_text_TA_existant (- (atof (rtos total_val_text_SP_existant 2 0)) (atof (rtos total_val_text_V_existant 2 0)) (atof (rtos total_val_text_180_existant 2 0)) ))
      (setq total_val_text_TA_existant (rtos total_val_text_TA_existant 2 0))
      ;(alert  total_val_text_TA_existant)
      
      (command "-attedit" "N" "N" "SDP" "TA" "0" "0" total_val_text_TA_existant)

      ;====================================== STATIONEMENT ======================================	
      (setq total_val_text_ST_existant (getDesignationEtAfficheValeursdp "GEX_EDS_sdp_5-PK_su" "ST"))

      ;======================================== COMBLES =========================================
      (setq total_val_text_CO_existant (getDesignationEtAfficheValeursdp "GEX_EDS_sdp_6-combles_su" "CO"))

      ;==================================== LOCAUX TECHNIQUE ====================================
      (setq total_val_text_LT_existant (getDesignationEtAfficheValeursdp "GEX_EDS_sdp_7-LT_su" "LT"))

      ;======================================= CAVE =============================================
      (setq total_val_text_c_existant (getDesignationEtAfficheValeursdp "GEX_EDS_sdp_8-cave_su" "C"))
      
      ;====================================== ISOLATION =========================================
      (initget "Locaux Habitation Mixte" )  
      (setq choix (getkword "\n Type du batiment (Locaux (L), Habitation(H), Mixte (M)): <Locaux> "))
      
      (if (= choix nil)(setq choix "L"))  ; valeur par defaut si Nature vide == Locaux 

      (if (= choix "M") 
        (setq total_val_text_i_existant (* (getint "\n Entrer la superficie de locaux d'habitation : ") 0.10)))		
      (if (= choix "L") (setq total_val_text_i_existant 0.0))	
      (if (= choix "H")
        (setq total_val_text_i_existant (* (- (atof total_val_text_TA_existant) total_val_text_LT_existant total_val_text_c_existant total_val_text_CO_existant total_val_text_ST_existant ) 0.10)))

      (command "-attedit" "N" "N" "SDP" "ISOL" "0" "0" (rtos total_val_text_i_existant 2 0))
      
      ;========================================= SDP ===========================================
      (setq total_val_text_sdp_existant (- (atof total_val_text_TA_existant) (atof (rtos total_val_text_ST_existant 2 0)) (atof (rtos total_val_text_CO_existant 2 0)) (atof (rtos total_val_text_LT_existant 2 0))
      (atof (rtos total_val_text_c_existant 2 0)) (atof (rtos total_val_text_i_existant 2 0)) ))
      
      (setq total_val_text_sdp_existant (atoi (rtos total_val_text_sdp_existant 2 0)))
      ;(alert  (rtos total_val_text_sdp_existant))
      
      (princ total_val_text_sdp_existant)
      (princ "\n")
      
      (command "-attedit" "N" "N" "SDP" "SDP" "0" "0" total_val_text_sdp_existant)
      ;(alert "         *********   O P E R A T I O N    T E R M I N E E   *********        ")
      (setvar "osmode" os)
      (princ "\n")
      (princ)
		)
	)

		(if (= (/= launchSdpCounter 1) T) ( boxMessagesdp ))


)
;========================================================================================================
;========================================================================================================
;========================================================================================================



; fonction de calcul de TA_sdp_PROJET
(setq launchSdpCounter 1)
(defun c:TA_SDP__projet( )
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
      (if (=  (tblsearch "layer" "GEX_EDS_ta-sdp_cahier_demolition") nil)(command "-layer" "n" "GEX_EDS_ta-sdp_cahier_demolition" "_color" "7" "GEX_EDS_ta-sdp_cahier_demolition" ""))			
;;======================Add Style convenable au charte graphique================================================ 
		;	(if (=  (tblsearch "style" "INT_Roman") nil)(command "-STYLER" "INT_Roman" "swissl.ttf" "0.000" "" "" "" "" "")"")
			;;(if (=  (tblsearch "style" "SURF") nil)(command "-STYLER" "SURF" "swissl.ttf" "0.000" "" "" "" "" "")"")
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
      (setq surfpoly_teinte_projet surfpoly)
      ;(alert surfpoly_teinte_projet)
			
			;;; Vides ;;;  
			(command "-layer" "E" 0 "g" "*" "l" "GEX_EDS_sdp_2-tremie" "l" "GEX_EDS_sdp_2-tremie_su" "")

			(setq sel-T (ssget "X" '((-4 . "<or")(-4 . "<and") (0 . "LWPOLYLINE")(8 . "GEX_EDS_sdp_2-tremie") (-4 . "and>")
								(-4 . "<and") (0 . "CIRCLE")(8 . "GEX_EDS_sdp_2-tremie") (-4 . "and>") (-4 . "or>"))))

			(command "-hachures" "p" "s" "a" "s" "n" "a" "o" "i" "o" "h" "o" "" "")
			(command "_clayer" "GEX_EDS_sdp_2-tremie")
			(command "-hachures" "s" sel-T "" "") 
			(command "_clayer" "GEX_EDS_sdp_2-tremie_su")
			(getCalqueAppliqueApplatSDP "GEX_EDS_sdp_2-tremie" 0)
      (setq surfpoly_tremie_projet surfpoly)
      ;(alert surfpoly_tremie_projet)
			

			;;; Surfaces dont h < 1.80 m ;;;
			(command "-layer" "E" 0 "g" "*" "l" "GEX_EDS_sdp_3-h-180" "l" "GEX_EDS_sdp_3-h-180_su" "")

			(setq sel-C (ssget "X" '((-4 . "<or")(-4 . "<and") (0 . "LWPOLYLINE")(8 . "GEX_EDS_sdp_3-h-180") (-4 . "and>")
								(-4 . "<and") (0 . "CIRCLE")(8 . "GEX_EDS_sdp_3-h-180") (-4 . "and>") (-4 . "or>"))))

			(command "-hachures" "p" "s" "a" "s" "n" "a" "o" "i" "o" "h" "o" "" "") 
			(command "_clayer" "GEX_EDS_sdp_3-h-180") 
			(command "-hachures" "s" sel-C "" "")  
			(command "_clayer" "GEX_EDS_sdp_3-h-180_su")
			(getCalqueAppliqueApplatSDP "GEX_EDS_sdp_3-h-180" 0)
      (setq surfpoly_h_180_projet surfpoly)
      ;(alert surfpoly_h_180_projet)

			;;; Stationnement ;;;	  
			(command "-layer" "E" 0 "g" "*" "l" "GEX_EDS_sdp_5-PK" "l" "GEX_EDS_sdp_5-PK_su" "")

			(setq sel-H (ssget "X" '((-4 . "<or")(-4 . "<and") (0 . "LWPOLYLINE")(8 . "GEX_EDS_sdp_5-PK") (-4 . "and>")
								(-4 . "<and") (0 . "CIRCLE")(8 . "GEX_EDS_sdp_5-PK") (-4 . "and>") (-4 . "or>"))))

			(command "-hachures" "p" "s" "a" "s" "n" "a" "o" "i" "o" "h" "o" "" "")
			(command "_clayer" "GEX_EDS_sdp_5-PK") 
			(command "-hachures" "s" sel-H "" "") 
			(command "_clayer" "GEX_EDS_sdp_5-PK_su")
			(getCalqueAppliqueApplatSDP "GEX_EDS_sdp_5-PK" 0)
      (setq surfpoly_pk_projet surfpoly)
      ;(alert surfpoly_pk_projet)
			;;; Combles ;;;	  
			(command "-layer" "E" 0 "g" "*" "l" "GEX_EDS_sdp_6-combles" "l" "GEX_EDS_sdp_6-combles_su" "")

			(setq sel-L (ssget "X" '((-4 . "<or")(-4 . "<and") (0 . "LWPOLYLINE")(8 . "GEX_EDS_sdp_6-combles") (-4 . "and>")
								(-4 . "<and") (0 . "CIRCLE")(8 . "GEX_EDS_sdp_6-combles") (-4 . "and>") (-4 . "or>"))))

			(command "-hachures" "p" "s" "a" "s" "n" "a" "o" "i" "o" "h" "o" "" "")
			(command "_clayer" "GEX_EDS_sdp_6-combles")
			(command "-hachures" "s" sel-L "" "") 
			(command "_clayer" "GEX_EDS_sdp_6-combles_su")
			(getCalqueAppliqueApplatSDP "GEX_EDS_sdp_6-combles" 0)
      (setq surfpolycomble_projet surfpoly)
      ;(alert surfpolycomble_projet)

			;;; Locaux techniques ;;;	  
			(command "-layer" "E" 0 "g" "*" "l" "GEX_EDS_sdp_7-LT" "l" "GEX_EDS_sdp_7-LT_su" "")

			(setq sel-P (ssget "X" '((-4 . "<or")(-4 . "<and") (0 . "LWPOLYLINE")(8 . "GEX_EDS_sdp_7-LT") (-4 . "and>")
								(-4 . "<and") (0 . "CIRCLE")(8 . "GEX_EDS_sdp_7-LT") (-4 . "and>") (-4 . "or>"))))

			(command "-hachures" "p" "s" "a" "s" "n" "a" "o" "i" "o" "h" "o" "" "")
			(command "_clayer" "GEX_EDS_sdp_7-LT") 
			(command "-hachures" "s" sel-P "" "")
			(command "_clayer" "GEX_EDS_sdp_7-LT_su")
			(getCalqueAppliqueApplatSDP "GEX_EDS_sdp_7-LT" 0)
      (setq surfpoly_LT_projet surfpoly)
      ;(alert surfpoly_LT_projet)
			;;; Caves ;;;	  
			(command "-layer" "E" 0 "g" "*" "l" "GEX_EDS_sdp_8-cave" "l" "GEX_EDS_sdp_8-cave_su" "")

			(setq sel-S (ssget "X" '((-4 . "<or")(-4 . "<and") (0 . "LWPOLYLINE")(8 . "GEX_EDS_sdp_8-cave") (-4 . "and>")
								(-4 . "<and") (0 . "CIRCLE")(8 . "GEX_EDS_sdp_8-cave") (-4 . "and>") (-4 . "or>"))))

			(command "-hachures" "p" "s" "a" "s" "n" "a" "o" "i" "o" "h" "o" "" "")
			(command "_clayer" "GEX_EDS_sdp_8-cave")
			(command "-hachures" "s" sel-S "" "") 
			(command "_clayer" "GEX_EDS_sdp_8-cave_su")
			(getCalqueAppliqueApplatSDP "GEX_EDS_sdp_8-cave" 0)
      (setq surfpoly_CA_projet surfpoly)
      ;(alert surfpoly_CA_projet)

      	;;; GEX_EDS_ta-sdp_cahier_demolition ;;;  
			(command "-layer" "E" 0 "g" "*" "l" "GEX_EDS_ta-sdp_cahier_demolition" "")

			(setq sel-demoli (ssget "X" '((-4 . "<or")(-4 . "<and") (0 . "LWPOLYLINE")(8 . "GEX_EDS_ta-sdp_cahier_demolition") (-4 . "and>")
								(-4 . "<and") (0 . "CIRCLE")(8 . "GEX_EDS_ta-sdp_cahier_demolition") (-4 . "and>") (-4 . "or>"))))

			(command "-hachures" "p" "s" "a" "s" "n" "a" "o" "i" "o" "h" "o" "" "")
			(command "_clayer" "GEX_EDS_ta-sdp_cahier_demolition")
			(command "-hachures" "s" sel-demoli "" "") 
			(command "_clayer" "GEX_EDS_ta-sdp_cahier_demolition_su")
			(getCalqueAppliqueApplatSDP "GEX_EDS_ta-sdp_cahier_demolition" 0)
      (setq surfpoly_demolie_projet surfpoly)
      ;(alert surfpoly_tremie_projet)
			
		
			(command "-layer" "l" "*" "E" "0" "g" "GEX_EDS_sdp_teinte_contour" "")
			;(alert "         *********   O P E R A T I O N    T E R M I N E E   *********        ")
			(setvar "osmode" os)
			(princ "\n")
			(princ)

    ;==========================================================================================
                                ;Calcul TA SDP_projet
    ;===================================== Planchers avant déductions =========================
      (setq total_val_text_SP_projet (getDesignationEtAfficheValeursdp "GEX_EDS_sdp_SDP_su" "SP"))
      (alert (rtos total_val_text_SP_projet 2 0))

      ;======================================== VIDES ===========================================
      (setq total_val_text_V_projet (getDesignationEtAfficheValeursdp "GEX_EDS_sdp_2-tremie_su" "V"))
      ;(alert (rtos total_val_text_V 2 0))


      ;======================================= H 180 ============================================
      (setq total_val_text_180_projet (getDesignationEtAfficheValeursdp "GEX_EDS_sdp_3-h-180_su" "180"))
      

      ;====================================== TOTAL TA_projet ==========================================
      (setq total_val_text_TA_projet (- (atof (rtos total_val_text_SP_projet 2 0)) (atof (rtos total_val_text_V_projet 2 0)) (atof (rtos total_val_text_180_projet 2 0)) ))
      (setq total_val_text_TA_projet (rtos total_val_text_TA_projet 2 0))
      ;(alert  total_val_text_TA_projet)
      
      (command "-attedit" "N" "N" "SDP" "TA" "0" "0" total_val_text_TA_projet)

      ;====================================== STATIONEMENT ======================================	
      (setq total_val_text_ST_projet (getDesignationEtAfficheValeursdp "GEX_EDS_sdp_5-PK_su" "ST"))

      ;======================================== COMBLES =========================================
      (setq total_val_text_CO_projet (getDesignationEtAfficheValeursdp "GEX_EDS_sdp_6-combles_su" "CO"))

      ;==================================== LOCAUX TECHNIQUE ====================================
      (setq total_val_text_LT_projet (getDesignationEtAfficheValeursdp "GEX_EDS_sdp_7-LT_su" "LT"))

      ;======================================= CAVE =============================================
      (setq total_val_text_c_projet (getDesignationEtAfficheValeursdp "GEX_EDS_sdp_8-cave_su" "C"))


      ;======================================= sdp_cahier_demolition =============================================
      (setq total_val_text_demolie_reconstruite_projet (getDesignationEtAfficheValeursdp "GEX_EDS_ta-sdp_cahier_demolition_su" "demoli"))
      
      ;====================================== ISOLATION =========================================
      (initget "Locaux Habitation Mixte" )  
      (setq choix (getkword "\n Type du batiment (Locaux (L), Habitation(H), Mixte (M)): <Locaux> "))
      
      (if (= choix nil)(setq choix "L"))  ; valeur par defaut si Nature vide == Locaux 

      (if (= choix "M") 
        (setq total_val_text_i_projet (* (getint "\n Entrer la superficie de locaux d'habitation : ") 0.10)))		
      (if (= choix "L") (setq total_val_text_i_projet 0.0))	
      (if (= choix "H")
        (setq total_val_text_i_projet (* (- (atof total_val_text_TA_projet) total_val_text_LT_projet total_val_text_c_projet total_val_text_CO_projet total_val_text_ST_projet ) 0.10)))

      (command "-attedit" "N" "N" "SDP" "ISOL" "0" "0" (rtos total_val_text_i_projet 2 0))
      
      ;========================================= SDP ===========================================
      (setq total_val_text_sdp_projet (- (atof total_val_text_TA_projet) (atof (rtos total_val_text_ST_projet 2 0)) (atof (rtos total_val_text_CO_projet 2 0)) (atof (rtos total_val_text_LT_projet 2 0))
      (atof (rtos total_val_text_c_projet 2 0)) (atof (rtos total_val_text_i_projet 2 0)) ))
      
      (setq total_val_text_sdp_projet (atoi (rtos total_val_text_sdp_projet 2 0)))
      ;(alert  (rtos total_val_text_sdp_projet))
      
      (princ total_val_text_sdp_projet)
      (princ "\n")
      
      (command "-attedit" "N" "N" "SDP" "SDP" "0" "0" total_val_text_sdp_projet)
      ;(alert "         *********   O P E R A T I O N    T E R M I N E E   *********        ")


    
      (setvar "osmode" os)
      (princ "\n")
      (princ)
		)
	)

		(if (= (/= launchSdpCounter 1) T) ( boxMessagesdp ))
)
;=======================Comparer projet_calculs==================
(defun c:comparer_data_statics()
 (setq grade 80)

(if (> grade 90)
    (setq result "A")
    (if (> grade 80)
        (setq result "B")
        (if (> grade 70)
            (setq result "C")
            (setq result "D"))))
)

(defun c:comparer_TA_data_calque()
 
 ;(alert (rtos total_val_text_SP 2 0))
  ;==============================Comparer TA_SP=====================================
  (if (> total_val_text_SP_projet total_val_text_SP_existant)
      (setq TA_SP_cree (-(total_val_text_SP_projet total_val_text_SP_existant)))
      (if (< total_val_text_SP_projet total_val_text_SP_existant)
          (setq TA_SP_supp (-(total_val_text_SP_existant total_val_text_SP_projet)))
          (setq result "D")))
   ;==============================Comparer TA_SP=====================================
  (if (> total_val_text_V_projet total_val_text_V_existant)
      (setq TA_V_cree (-(total_val_text_V_projet total_val_text_V_existant)))
      (if (< total_val_text_V_projet total_val_text_V_existant)
          (setq TA_V_supp (-(total_val_text_V_existant total_val_text_V_projet)))
          (setq result "D")))
   ;==============================Comparer TA_H_180=====================================
  (if (> total_val_text_180_projet total_val_text_180_existant)
      (setq TA_H_cree (-(total_val_text_180_projet total_val_text_180_existant)))
      (if (< total_val_text_180_projet total_val_text_180_existant)
          (setq TA_H_supp (-(total_val_text_180_existant total_val_text_180_projet)))
          (setq result "D")))
   ;==============================Calcul TA_Cree=====================================
  (setq TA_cree_ (-(TA_SP_cree TA_V_cree TA_H_cree )))
  ;==============================Calcul TA_supprimee=====================================
  (setq TA_supp_ (-(TA_SP_supp TA_V_cree TA_H_supp )))
  
   ;==============================Calcul Surface_STATIONEMENT====================================
  
  (if (> total_val_text_ST_projet total_val_text_ST_existant)
      (setq TA_stationnement_cree (-(total_val_text_ST_projet total_val_text_ST_existant)))
      (if (< total_val_text_ST_projet total_val_text_ST_existant)
          (setq TA_stationnement__supp (-(total_val_text_ST_existant total_val_text_ST_projet)))
          (setq result "D")))
  
   ;==============================Calcul Surface_comble====================================
  (if (> total_val_text_CO_projet total_val_text_CO_existant)
      (setq TA_Comble_cree (-(total_val_text_CO_projet total_val_text_CO_existant)))
      (if (< total_val_text_CO_projet total_val_text_CO_existant)
          (setq TA_Comble_supp (-(total_val_text_CO_existant total_val_text_CO_projet)))
          (setq result "D")))
    ;==============================Calcul Surface_cave =====================================
  (if (> total_val_text_c_projet total_val_text_c_existant)
      (setq TA_cave_cree (-(total_val_text_c_projet total_val_text_c_existant)))
      (if (< total_val_text_c_projet total_val_text_c_existant)
          (setq TA_cave_supp (-(total_val_text_c_existant total_val_text_c_projet)))
          (setq result "D")))
   ;==============================Calcul Surface_isolation====================================
  (if (> total_val_text_i_projet total_val_text_i_existant)
      (setq TA_isolation_cree (-(total_val_text_i_projet total_val_text_i_existant)))
      (if (< total_val_text_i_projet total_val_text_i_existant)
          (setq TA_isolation_supp (-(total_val_text_i_existant total_val_text_i_projet)))
          (setq result "D")))
  
   ;==============================Calcul Surface_demolie_reconstruite====================================
    (setq TA_demolie_reconstruite (total_val_text_demolie_reconstruite_projet))
     
    ;==============================Calcul Surface_Locaux technique====================================
  (if (> total_val_text_LT_projet total_val_text_LT_existant)
      (setq TA_LT_cree (-(total_val_text_LT_projet total_val_text_LT_existant)))
      (if (< total_val_text_LT_projet total_val_text_LT_existant)
          (setq TA_LT_supp (-(total_val_text_LT_existant total_val_text_LT_projet)))
          (setq result "D")))
  
  ;==============================Calcul Surface_Cree=====================================
  (setq surface_cree_ (-(TA_cree_ TA_stationnement_cree TA_Comble_cree TA_cave_cree TA_isolation_cree TA_LT_cree)))

 ;==============================Calcul Surface_supprimee=====================================
  (setq surface_supprimee_ (-(TA_supp_ TA_stationnement__supp TA_Comble_supp TA_cave_supp TA_isolation_supp TA_LT_supp)))
 ; (alert (rtos(surface_cree_)))
)


(defun c:GEtRequest  (/ url data http_object) 
; (setq url_inserted   (strcat(setq URL (get_tile "insert") )))
 
 (setq
  url   "http://127.0.0.1:5000"
  Amina  "Amina DZIRI"
  ;;data "username=billythekid&email=thekid@billythekid.com" ;; this data is not XML, it's a plain http type of data string
  ;URL_Input(get_tile "insert")
  http_object (vlax-create-object "WinHTTP.WinHTTPRequest.5.1") ;; so we need to use this, not the XML lib
  )
 (vlax-invoke-method http_object 'open "GET" url :vlax-false)
 (vlax-invoke-method http_object 'SetRequestHeader "Content-type" "application/x-www-form-urlencoded")
 ;; (vlax-invoke-method http_object 'SetRequestHeader "Content-length" (strlen data))
 (vlax-invoke-method http_object 'send) ;envoyer lien du ticket ODOO
 
 (print (vlax-get-property http_object "ResponseText"))
 (if http_object (vlax-release-object http_object))
 (princ)
)












;===========================Etages=======================
(defun PostRequest_etage  (/ url data http_object) 
 (setq etage_inserted   (strcat(setq data (get_tile "insert") )))
 (setq
  url   "http://127.0.0.1:5000"
  Amina  "Amina DZIRI"
  ;;data "username=billythekid&email=thekid@billythekid.com" ;; this data is not XML, it's a plain http type of data string
  ;URL_Input(get_tile "insert")
  http_object (vlax-create-object "WinHTTP.WinHTTPRequest.5.1") ;; so we need to use this, not the XML lib
  )
 (vlax-invoke-method http_object 'open "POST" url :vlax-false)
 (vlax-invoke-method http_object 'SetRequestHeader "Content-type" "application/json")
 ;; (vlax-invoke-method http_object 'SetRequestHeader "Content-length" (strlen data))
 (vlax-invoke-method http_object 'send total_val_text_SP_projet) 
 
 (print (vlax-get-property http_object "ResponseText"))
 (if http_object (vlax-release-object http_object))
 (princ)
)


;========================TA_PROJET TA_SDP=================
(defun PostRequest_TA_existant1 (/ url data http_object) 
 (setq
  url   "http://127.0.0.1:5000/TA_EXISTANT"
  Amina  "Amina DZIRI"
  ;;data "username=billythekid&email=thekid@billythekid.com" ;; this data is not XML, it's a plain http type of data string
  ;URL_Input(get_tile "insert")
  http_object (vlax-create-object "WinHTTP.WinHTTPRequest.5.1") ;; so we need to use this, not the XML lib
  )
 (vlax-invoke-method http_object 'open "POST" url :vlax-false)
 (vlax-invoke-method http_object 'SetRequestHeader "Content-type" "application/json")
 ;; (vlax-invoke-method http_object 'SetRequestHeader "Content-length" (strlen data))
 (vlax-invoke-method http_object 'send total_val_text_TA_existant) 
 
 (print (vlax-get-property http_object "ResponseText"))
 (if http_object (vlax-release-object http_object))
 (princ)
)

(defun PostRequest_SDP_existant1 (/ url data http_object) 
 (setq
  url   "http://127.0.0.1:5000/SDP_EXISTANT"
  Amina  "Amina DZIRI"
  ;;data "username=billythekid&email=thekid@billythekid.com" ;; this data is not XML, it's a plain http type of data string
  ;URL_Input(get_tile "insert")
  http_object (vlax-create-object "WinHTTP.WinHTTPRequest.5.1") ;; so we need to use this, not the XML lib
  )
 (vlax-invoke-method http_object 'open "POST" url :vlax-false)
 (vlax-invoke-method http_object 'SetRequestHeader "Content-type" "application/json")
 ;; (vlax-invoke-method http_object 'SetRequestHeader "Content-length" (strlen data))
 (vlax-invoke-method http_object 'send total_val_text_sdp_existant) 
 
 (print (vlax-get-property http_object "ResponseText"))
 (if http_object (vlax-release-object http_object))
 (princ)
)
;========================TA_PROJET TA_SDP=================


(defun PostRequest_TA_projet1 (/ url data http_object) 
 (setq
  url   "http://127.0.0.1:5000/TA_PROJET"
  Amina  "Amina DZIRI"
  ;;data "username=billythekid&email=thekid@billythekid.com" ;; this data is not XML, it's a plain http type of data string
  ;URL_Input(get_tile "insert")
  http_object (vlax-create-object "WinHTTP.WinHTTPRequest.5.1") ;; so we need to use this, not the XML lib
  )
 (vlax-invoke-method http_object 'open "POST" url :vlax-false)
 (vlax-invoke-method http_object 'SetRequestHeader "Content-type" "application/json")
 ;; (vlax-invoke-method http_object 'SetRequestHeader "Content-length" (strlen data))
 (vlax-invoke-method http_object 'send total_val_text_TA_projet) 
 
 (print (vlax-get-property http_object "ResponseText"))
 (if http_object (vlax-release-object http_object))
 (princ)
)

(defun PostRequest_SDP_projet1 (/ url data http_object) 
 (setq
  url   "http://127.0.0.1:5000/SDP_PROJET"
  Amina  "Amina DZIRI"
  ;;data "username=billythekid&email=thekid@billythekid.com" ;; this data is not XML, it's a plain http type of data string
  ;URL_Input(get_tile "insert")
  http_object (vlax-create-object "WinHTTP.WinHTTPRequest.5.1") ;; so we need to use this, not the XML lib
  )
 (vlax-invoke-method http_object 'open "POST" url :vlax-false)
 (vlax-invoke-method http_object 'SetRequestHeader "Content-type" "application/json")
 ;; (vlax-invoke-method http_object 'SetRequestHeader "Content-length" (strlen data))
 (vlax-invoke-method http_object 'send total_val_text_sdp_projet) 
 
 (print (vlax-get-property http_object "ResponseText"))
 (if http_object (vlax-release-object http_object))
 (princ)
)
;=====================TA_projet===========================
(defun PostRequest_SP_projet  (/ url data http_object) 
; (setq url_inserted   (strcat(setq URL (get_tile "insert") )))
 (setq
  url   "http://127.0.0.1:5000/ta_SP_projet"
  Amina  "Amina DZIRI"
  ;;data "username=billythekid&email=thekid@billythekid.com" ;; this data is not XML, it's a plain http type of data string
  ;URL_Input(get_tile "insert")
  http_object (vlax-create-object "WinHTTP.WinHTTPRequest.5.1") ;; so we need to use this, not the XML lib
  )
 (vlax-invoke-method http_object 'open "POST" url :vlax-false)
 (vlax-invoke-method http_object 'SetRequestHeader "Content-type" "application/json")
 ;; (vlax-invoke-method http_object 'SetRequestHeader "Content-length" (strlen data))
 (vlax-invoke-method http_object 'send total_val_text_SP_projet) 
 
 (print (vlax-get-property http_object "ResponseText"))
 (if http_object (vlax-release-object http_object))
 (princ)
)

(defun PostRequest_V_projet  (/ url data http_object) 
; (setq url_inserted   (strcat(setq URL (get_tile "insert") )))
 (setq
  url   "http://127.0.0.1:5000/ta_vide_projet"
  Amina  "Amina DZIRI"
  ;;data "username=billythekid&email=thekid@billythekid.com" ;; this data is not XML, it's a plain http type of data string
  ;URL_Input(get_tile "insert")
  http_object (vlax-create-object "WinHTTP.WinHTTPRequest.5.1") ;; so we need to use this, not the XML lib
  )
 (vlax-invoke-method http_object 'open "POST" url :vlax-false)
 (vlax-invoke-method http_object 'SetRequestHeader "Content-type" "application/json")
 ;; (vlax-invoke-method http_object 'SetRequestHeader "Content-length" (strlen data))
 
 (vlax-invoke-method http_object 'send total_val_text_V_projet) 
 
 (print (vlax-get-property http_object "ResponseText"))
 (if http_object (vlax-release-object http_object))
 (princ)
)

(defun PostRequest_H_180_projet  (/ url data http_object) 
; (setq url_inserted   (strcat(setq URL (get_tile "insert") )))
 (setq
  url   "http://127.0.0.1:5000/ta_h_180_projet"
  Amina  "Amina DZIRI"
  ;;data "username=billythekid&email=thekid@billythekid.com" ;; this data is not XML, it's a plain http type of data string
  ;URL_Input(get_tile "insert")
  http_object (vlax-create-object "WinHTTP.WinHTTPRequest.5.1") ;; so we need to use this, not the XML lib
  )
 (vlax-invoke-method http_object 'open "POST" url :vlax-false)
 (vlax-invoke-method http_object 'SetRequestHeader "Content-type" "application/json")
 ;; (vlax-invoke-method http_object 'SetRequestHeader "Content-length" (strlen data))
 
 (vlax-invoke-method http_object 'send total_val_text_180_projet) 
 
 (print (vlax-get-property http_object "ResponseText"))
 (if http_object (vlax-release-object http_object))
 (princ)
)

(defun c:PostRequest_TA_projet ()
  (PostRequest_SDP_projet1)
  (PostRequest_TA_projet1)
  (PostRequest_SP_projet)
  (PostRequest_V_projet)
  (PostRequest_H_180_projet)
)
;=====================Projet_SDP=============================
;====================================== STATIONEMENT ======================================	
(defun PostRequest_ST_projet  (/ url data http_object) 
; (setq url_inserted   (strcat(setq URL (get_tile "insert") )))
 (setq
  url   "http://127.0.0.1:5000/ST_projet"
  Amina  "Amina DZIRI"
  ;;data "username=billythekid&email=thekid@billythekid.com" ;; this data is not XML, it's a plain http type of data string
  ;URL_Input(get_tile "insert")
  http_object (vlax-create-object "WinHTTP.WinHTTPRequest.5.1") ;; so we need to use this, not the XML lib
  )
 (vlax-invoke-method http_object 'open "POST" url :vlax-false)
 (vlax-invoke-method http_object 'SetRequestHeader "Content-type" "application/x-www-form-urlencoded")
 ;; (vlax-invoke-method http_object 'SetRequestHeader "Content-length" (strlen data))
 
 (vlax-invoke-method http_object 'send total_val_text_ST_projet) 
 
 (print (vlax-get-property http_object "ResponseText"))
 (if http_object (vlax-release-object http_object))
 (princ)
)
;======================================== COMBLES =========================================
(defun PostRequest_CO_projet  (/ url data http_object) 
; (setq url_inserted   (strcat(setq URL (get_tile "insert") )))
 (setq
  url   "http://127.0.0.1:5000/CO_projet"
  Amina  "Amina DZIRI"
  ;;data "username=billythekid&email=thekid@billythekid.com" ;; this data is not XML, it's a plain http type of data string
  ;URL_Input(get_tile "insert")
  http_object (vlax-create-object "WinHTTP.WinHTTPRequest.5.1") ;; so we need to use this, not the XML lib
  )
 (vlax-invoke-method http_object 'open "POST" url :vlax-false)
 (vlax-invoke-method http_object 'SetRequestHeader "Content-type" "application/x-www-form-urlencoded")
 ;; (vlax-invoke-method http_object 'SetRequestHeader "Content-length" (strlen data))
 
 (vlax-invoke-method http_object 'send total_val_text_CO_projet) 
 
 (print (vlax-get-property http_object "ResponseText"))
 (if http_object (vlax-release-object http_object))
 (princ)
)
;==================================== LOCAUX TECHNIQUE ====================================
(defun PostRequest_LT_projet  (/ url data http_object) 
; (setq url_inserted   (strcat(setq URL (get_tile "insert") )))
 (setq
  url   "http://127.0.0.1:5000/LT_projet"
  Amina  "Amina DZIRI"
  ;;data "username=billythekid&email=thekid@billythekid.com" ;; this data is not XML, it's a plain http type of data string
  ;URL_Input(get_tile "insert")
  http_object (vlax-create-object "WinHTTP.WinHTTPRequest.5.1") ;; so we need to use this, not the XML lib
  )
 (vlax-invoke-method http_object 'open "POST" url :vlax-false)
 (vlax-invoke-method http_object 'SetRequestHeader "Content-type" "application/x-www-form-urlencoded")
 ;; (vlax-invoke-method http_object 'SetRequestHeader "Content-length" (strlen data))
 
 (vlax-invoke-method http_object 'send total_val_text_LT_projet) 
 
 (print (vlax-get-property http_object "ResponseText"))
 (if http_object (vlax-release-object http_object))
 (princ)
)
;======================================= CAVE =============================================
(defun PostRequest_C_projet  (/ url data http_object) 
; (setq url_inserted   (strcat(setq URL (get_tile "insert") )))
 (setq
  url   "http://127.0.0.1:5000/cave_projet"
  Amina  "Amina DZIRI"
  ;;data "username=billythekid&email=thekid@billythekid.com" ;; this data is not XML, it's a plain http type of data string
  ;URL_Input(get_tile "insert")
  http_object (vlax-create-object "WinHTTP.WinHTTPRequest.5.1") ;; so we need to use this, not the XML lib
  )
 (vlax-invoke-method http_object 'open "POST" url :vlax-false)
 (vlax-invoke-method http_object 'SetRequestHeader "Content-type" "application/x-www-form-urlencoded")
 ;; (vlax-invoke-method http_object 'SetRequestHeader "Content-length" (strlen data))
 
 (vlax-invoke-method http_object 'send total_val_text_c_projet) 
 
 (print (vlax-get-property http_object "ResponseText"))
 (if http_object (vlax-release-object http_object))
 (princ)
)
;====================================== ISOLATION =========================================
(defun PostRequest_ISOLATION_projet  (/ url data http_object) 
; (setq url_inserted   (strcat(setq URL (get_tile "insert") )))
 (setq
  url   "http://127.0.0.1:5000/Isolation_projet"
  Amina  "Amina DZIRI"
  ;;data "username=billythekid&email=thekid@billythekid.com" ;; this data is not XML, it's a plain http type of data string
  ;URL_Input(get_tile "insert")
  http_object (vlax-create-object "WinHTTP.WinHTTPRequest.5.1") ;; so we need to use this, not the XML lib
  )
 (vlax-invoke-method http_object 'open "POST" url :vlax-false)
 (vlax-invoke-method http_object 'SetRequestHeader "Content-type" "application/x-www-form-urlencoded")
 ;; (vlax-invoke-method http_object 'SetRequestHeader "Content-length" (strlen data))
 
 (vlax-invoke-method http_object 'send total_val_text_i_projet) 
 
 (print (vlax-get-property http_object "ResponseText"))
 (if http_object (vlax-release-object http_object))
 (princ)
)
(defun c:PostRequestSDP_projet ()
  (PostRequest_ST_projet)
  (PostRequest_CO_projet)
  (PostRequest_LT_projet)
  (PostRequest_C_projet)
  (PostRequest_ISOLATION_projet)

)
;===========================================================
;===========================================================
;===========================================================

;=====================TA_existant===========================

(defun PostRequest_SP_existant  (/ url data http_object) 
; (setq url_inserted   (strcat(setq URL (get_tile "insert") )))
 (setq
  url   "http://127.0.0.1:5000/ta_SP_existant"
  Amina  "Amina DZIRI"
  ;;data "username=billythekid&email=thekid@billythekid.com" ;; this data is not XML, it's a plain http type of data string
  ;URL_Input(get_tile "insert")
  http_object (vlax-create-object "WinHTTP.WinHTTPRequest.5.1") ;; so we need to use this, not the XML lib
  )
 (vlax-invoke-method http_object 'open "POST" url :vlax-false)
 (vlax-invoke-method http_object 'SetRequestHeader "Content-type" "application/x-www-form-urlencoded")
 ;; (vlax-invoke-method http_object 'SetRequestHeader "Content-length" (strlen data))
 (vlax-invoke-method http_object 'send total_val_text_SP_existant) 
 
 (print (vlax-get-property http_object "ResponseText"))
 (if http_object (vlax-release-object http_object))
 (princ)
)

(defun PostRequest_V_existant  (/ url data http_object) 
; (setq url_inserted   (strcat(setq URL (get_tile "insert") )))
 (setq
  url   "http://127.0.0.1:5000/ta_vide_existant"
  Amina  "Amina DZIRI"
  ;;data "username=billythekid&email=thekid@billythekid.com" ;; this data is not XML, it's a plain http type of data string
  ;URL_Input(get_tile "insert")
  http_object (vlax-create-object "WinHTTP.WinHTTPRequest.5.1") ;; so we need to use this, not the XML lib
  )
 (vlax-invoke-method http_object 'open "POST" url :vlax-false)
 (vlax-invoke-method http_object 'SetRequestHeader "Content-type" "application/x-www-form-urlencoded")
 ;; (vlax-invoke-method http_object 'SetRequestHeader "Content-length" (strlen data))
 
 (vlax-invoke-method http_object 'send total_val_text_V_existant) 
 
 (print (vlax-get-property http_object "ResponseText"))
 (if http_object (vlax-release-object http_object))
 (princ)
)

(defun PostRequest_H_180_existant  (/ url data http_object) 
; (setq url_inserted   (strcat(setq URL (get_tile "insert") )))
 (setq
  url   "http://127.0.0.1:5000/ta_h_180_existant"
  Amina  "Amina DZIRI"
  ;;data "username=billythekid&email=thekid@billythekid.com" ;; this data is not XML, it's a plain http type of data string
  ;URL_Input(get_tile "insert")
  http_object (vlax-create-object "WinHTTP.WinHTTPRequest.5.1") ;; so we need to use this, not the XML lib
  )
 (vlax-invoke-method http_object 'open "POST" url :vlax-false)
 (vlax-invoke-method http_object 'SetRequestHeader "Content-type" "application/x-www-form-urlencoded")
 ;; (vlax-invoke-method http_object 'SetRequestHeader "Content-length" (strlen data))
 
 (vlax-invoke-method http_object 'send total_val_text_180_existant) 
 
 (print (vlax-get-property http_object "ResponseText"))
 (if http_object (vlax-release-object http_object))
 (princ)
)
;================================================================
;================================================================
(defun c:PostRequest_TA_existant ()
  (PostRequest_TA_existant1)
  (PostRequest_SDP_existant1)
  (PostRequest_SP_existant)
  (PostRequest_V_existant)
  (PostRequest_H_180_existant)
)
;=====================Existant_SDP===============================
;====================================== STATIONEMENT ======================================	
(defun PostRequest_ST_existant  (/ url data http_object) 
; (setq url_inserted   (strcat(setq URL (get_tile "insert") )))
 (setq
  url   "http://127.0.0.1:5000/ST_existant"
  Amina  "Amina DZIRI"
  ;;data "username=billythekid&email=thekid@billythekid.com" ;; this data is not XML, it's a plain http type of data string
  ;URL_Input(get_tile "insert")
  http_object (vlax-create-object "WinHTTP.WinHTTPRequest.5.1") ;; so we need to use this, not the XML lib
  )
 (vlax-invoke-method http_object 'open "POST" url :vlax-false)
 (vlax-invoke-method http_object 'SetRequestHeader "Content-type" "application/x-www-form-urlencoded")
 ;; (vlax-invoke-method http_object 'SetRequestHeader "Content-length" (strlen data))
 
 (vlax-invoke-method http_object 'send total_val_text_ST_existant) 
 
 (print (vlax-get-property http_object "ResponseText"))
 (if http_object (vlax-release-object http_object))
 (princ)
)
;======================================== COMBLES =========================================
(defun PostRequest_CO_existant  (/ url data http_object) 
; (setq url_inserted   (strcat(setq URL (get_tile "insert") )))
 (setq
  url   "http://127.0.0.1:5000/CO_existant"
  Amina  "Amina DZIRI"
  ;;data "username=billythekid&email=thekid@billythekid.com" ;; this data is not XML, it's a plain http type of data string
  ;URL_Input(get_tile "insert")
  http_object (vlax-create-object "WinHTTP.WinHTTPRequest.5.1") ;; so we need to use this, not the XML lib
  )
 (vlax-invoke-method http_object 'open "POST" url :vlax-false)
 (vlax-invoke-method http_object 'SetRequestHeader "Content-type" "application/x-www-form-urlencoded")
 ;; (vlax-invoke-method http_object 'SetRequestHeader "Content-length" (strlen data))
 
 (vlax-invoke-method http_object 'send total_val_text_CO_existant) 
 
 (print (vlax-get-property http_object "ResponseText"))
 (if http_object (vlax-release-object http_object))
 (princ)
)
;==================================== LOCAUX TECHNIQUE ====================================
(defun PostRequest_LT_existant  (/ url data http_object) 
; (setq url_inserted   (strcat(setq URL (get_tile "insert") )))
 (setq
  url   "http://127.0.0.1:5000/LT_existant"
  Amina  "Amina DZIRI"
  ;;data "username=billythekid&email=thekid@billythekid.com" ;; this data is not XML, it's a plain http type of data string
  ;URL_Input(get_tile "insert")
  http_object (vlax-create-object "WinHTTP.WinHTTPRequest.5.1") ;; so we need to use this, not the XML lib
  )
 (vlax-invoke-method http_object 'open "POST" url :vlax-false)
 (vlax-invoke-method http_object 'SetRequestHeader "Content-type" "application/x-www-form-urlencoded")
 ;; (vlax-invoke-method http_object 'SetRequestHeader "Content-length" (strlen data))
 
 (vlax-invoke-method http_object 'send total_val_text_LT_existant) 
 
 (print (vlax-get-property http_object "ResponseText"))
 (if http_object (vlax-release-object http_object))
 (princ)
)
;======================================= CAVE =============================================
(defun PostRequest_C_existant  (/ url data http_object) 
; (setq url_inserted   (strcat(setq URL (get_tile "insert") )))
 (setq
  url   "http://127.0.0.1:5000/cave_existant"
  Amina  "Amina DZIRI"
  ;;data "username=billythekid&email=thekid@billythekid.com" ;; this data is not XML, it's a plain http type of data string
  ;URL_Input(get_tile "insert")
  http_object (vlax-create-object "WinHTTP.WinHTTPRequest.5.1") ;; so we need to use this, not the XML lib
  )
 (vlax-invoke-method http_object 'open "POST" url :vlax-false)
 (vlax-invoke-method http_object 'SetRequestHeader "Content-type" "application/x-www-form-urlencoded")
 ;; (vlax-invoke-method http_object 'SetRequestHeader "Content-length" (strlen data))
 
 (vlax-invoke-method http_object 'send total_val_text_c_existant) 
 
 (print (vlax-get-property http_object "ResponseText"))
 (if http_object (vlax-release-object http_object))
 (princ)
)
;====================================== ISOLATION =========================================
(defun PostRequest_ISOLATION_existant  (/ url data http_object) 
; (setq url_inserted   (strcat(setq URL (get_tile "insert") )))
 (setq
  url   "http://127.0.0.1:5000/Isolation_existant"
  Amina  "Amina DZIRI"
  ;;data "username=billythekid&email=thekid@billythekid.com" ;; this data is not XML, it's a plain http type of data string
  ;URL_Input(get_tile "insert")
  http_object (vlax-create-object "WinHTTP.WinHTTPRequest.5.1") ;; so we need to use this, not the XML lib
  )
 (vlax-invoke-method http_object 'open "POST" url :vlax-false)
 (vlax-invoke-method http_object 'SetRequestHeader "Content-type" "application/x-www-form-urlencoded")
 ;; (vlax-invoke-method http_object 'SetRequestHeader "Content-length" (strlen data))
 
 (vlax-invoke-method http_object 'send total_val_text_i_existant) 
 
 (print (vlax-get-property http_object "ResponseText"))
 (if http_object (vlax-release-object http_object))
 (princ)
)
(defun c:PostRequestSDP_existant ()
  (PostRequest_ST_existant)
  (PostRequest_CO_existant)
  (PostRequest_LT_existant)
  (PostRequest_C_existant)
  (PostRequest_ISOLATION_existant)

)




(defun c:Compare_v01()
  
  ;===================================== Planchers avant déductions =========================
 (if (> total_val_text_SP_projet  total_val_text_SP_existant)
       (setq diff_SP_cree (- total_val_text_SP_projet total_val_text_SP_existant))
      ;(princ "total_val_text_SP_projet  est plus grand que total_val_text_SP_existant")
      
    (if (< total_val_text_SP_projet  total_val_text_SP_existant)
        (setq diff_SP_supprimee (- total_val_text_SP_existant total_val_text_SP_projet))
        ;(princ "total_val_text_SP_existant est plus grand que total_val_text_SP_projet ")
        ;
       ; (alert diff_SP_supprimee)
       
      (princ "total_val_text_SP_projet  est égal à total_val_text_SP_existant")
    )
 )
;======================================== VIDES ===========================================
 (if (> total_val_text_V_projet  total_val_text_V_existant)
      (princ "total_val_text_V_projet  est plus grand que total_val_text_V_existant")
      ;(setq diff_V_cree (- total_val_text_V_projet total_val_text_V_existant))
    (if (< total_val_text_V_projet  total_val_text_V_existant)
      ; (progn
        (princ "total_val_text_V_existant est plus grand que total_val_text_V_projet ")
        ;(setq diff_V_supprimee (- total_val_text_V_existant total_val_text_V_projet))
       ; (alert diff_V_supprimee)
      ; )
      (princ "total_val_text_V_projet  est égal à total_val_text_V_existant")
    )
 )
;======================================= H 180 ============================================
 (if (> total_val_text_180_projet  total_val_text_180_existant)
      (princ "total_val_text_180_projet  est plus grand que total_val_text_180_existant")
      ;(setq diff_180_cree (- total_val_text_180_projet total_val_text_180_existant))
    (if (< total_val_text_180_projet  total_val_text_180_existant)
      ; (progn
        (princ "total_val_text_180_existant est plus grand que total_val_text_180_projet ")
       ; (setq diff_180_supprimee (- total_val_text_180_existant total_val_text_180_projet))
        
      ; )
      (princ "total_val_text_180_projet  est égal à total_val_text_180_existant")
    )
 )

  ;====================================== TOTAL TA_cree ==========================================
     ; (setq total_val_text_TA_cree_projet (- (atof (rtos diff_SP_cree 2 0)) (atof (rtos diff_V_cree 2 0)) (atof (rtos diff_180_cree 2 0)) ))
     ; (setq total_val_text_TA_cree_projet (rtos total_val_text_TA_cree_projet 2 0))
     ; (alert  "total_val_text_TA_cree_projet")
  ;====================================== TOTAL TA_supprimee ==========================================
     ; (setq total_val_text_TA_supprimee_projet (- (atof (rtos diff_SP_supprimee 2 0)) (atof (rtos diff_V_supprimee 2 0)) (atof (rtos diff_180_supprimee 2 0)) ))
     ; (setq total_val_text_TA_supprimee_projet (rtos total_val_text_TA_supprimee_projet 2 0))
      





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

;;; fonction de recuperation du Calque et de calcul la surface à afficher
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
;;; search all layers with certain cracter
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
  (alert (rtos total_val_text_SP 2 0))


	;======================================== VIDES ===========================================
	(setq total_val_text_V (getDesignationEtAfficheValeursdp "GEX_EDS_sdp_2-tremie_su" "V"))
  (alert (rtos total_val_text_V 2 0))

	;======================================= H 180 ============================================
	(setq total_val_text_180 (getDesignationEtAfficheValeursdp "GEX_EDS_sdp_3-h-180_su" "180"))

	;====================================== TOTAL TA ==========================================
	(setq total_val_text_TA (- (atof (rtos total_val_text_SP 2 0)) (atof (rtos total_val_text_V 2 0)) (atof (rtos total_val_text_180 2 0)) ))
	(setq total_val_text_TA (rtos total_val_text_TA 2 0))
    (alert total_val_text_TA)
	
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
  (alert (rtos total_val_text_sdp))
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
