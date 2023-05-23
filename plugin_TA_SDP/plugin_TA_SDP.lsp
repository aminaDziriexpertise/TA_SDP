(defun c:plugin_TA_SDP()
 
    ;define the function
      (setq dcl_id (load_dialog "plugin_TA_SDP.dcl"))
      ;load the DCL file

      (if (not (new_dialog "TA_SDP" dcl_id))
      ;load the dialogue box

        (exit)
        ;if not loaded exit

      )
      (action_tile "cancel" "(done_dialog) (setq result nil)")
      (action_tile "accept" "(done_dialog) (setq result T)" )
      ;DEstinations calques
      (action_tile "1-spic" " (1-spic)")
      (action_tile "1-industrie" "(1-industrie)")
      (action_tile "1-hotelier" "(1-hotelier)")
      (action_tile "1-habitation" "(1-habitation)")
      (action_tile "1-exploitation" "(1-exploitation)")
      (action_tile "1-entrepot" "(1-entrepot)")
      (action_tile "1-commerce" "(1-commerce)")
      (action_tile "1-bureau" "(1-bureau)")
      (action_tile "1-artisanat" "(1-artisanat)")
      ; Calques_Calcul
         
      (action_tile "2-tremie" " (tremie)")
      (action_tile "3-h-180" "(h-180)")
      (action_tile "5-pk" "(setq 5-pkVar $value)(5-pk)")
      (action_tile "6-combles" "(6-combles)")
      (action_tile "7-lt" "(7-lt)")
      (action_tile "8-cave" "(8-cave)")
      (start_dialog)
      (unload_dialog dcl_id)
      (princ)
)

;Destination_calques
(defun 1-artisanat()
  (if (=  (tblsearch "layer" "GEX_EDS_sdp_1-artisanat") nil)(command "-layer" "n" "GEX_EDS_sdp_1-artisanat" "_color" "7" "GEX_EDS_sdp_1-artisanat" ""))
)

(defun 1-bureau()
	(if (=  (tblsearch "layer" "GEX_EDS_sdp_1-bureau") nil)(command "-layer" "n" "GEX_EDS_sdp_1-bureau" "_color" "7" "GEX_EDS_sdp_1-bureau" ""))
)

(defun 1-commerce()
	(if (=  (tblsearch "layer" "GEX_EDS_sdp_1-commerce") nil)(command "-layer" "n" "GEX_EDS_sdp_1-commerce" "_color" "7" "GEX_EDS_sdp_1-commerce" ""))
)

(defun 1-entrepot()
	(if (=  (tblsearch "layer" "GEX_EDS_sdp_1-entrepot") nil)(command "-layer" "n" "GEX_EDS_sdp_1-entrepot" "_color" "7" "GEX_EDS_sdp_1-entrepot" ""))
)

(defun 1-exploitation()
	(if (=  (tblsearch "layer" "GEX_EDS_sdp_1-exploitation") nil)(command "-layer" "n" "GEX_EDS_sdp_1-exploitation" "_color" "7" "GEX_EDS_sdp_1-exploitation" ""))
)

(defun 1-habitation()
	(if (=  (tblsearch "layer" "GEX_EDS_sdp_1-habitation") nil)(command "-layer" "n" "GEX_EDS_sdp_1-habitation" "_color" "7" "GEX_EDS_sdp_1-habitation" ""))
)

(defun 1-hotelier()
	(if (=  (tblsearch "layer" "GEX_EDS_sdp_1-hotelier") nil)(command "-layer" "n" "GEX_EDS_sdp_1-hotelier" "_color" "7" "GEX_EDS_sdp_1-hotelier" ""))
)

(defun 1-industrie()
	(if (=  (tblsearch "layer" "GEX_EDS_sdp_1-industrie") nil)(command "-layer" "n" "GEX_EDS_sdp_1-industrie" "_color" "7" "GEX_EDS_sdp_1-industrie" ""))
)

(defun 1-spic()
	(if (=  (tblsearch "layer" "GEX_EDS_sdp_1-spic") nil)(command "-layer" "n" "GEX_EDS_sdp_1-spic" "_color" "7" "GEX_EDS_sdp_1-spic" ""))
)
;=================================================
;calques pour calcul
;=================================================


(defun tremie()
  (if (=  (tblsearch "layer" "GEX_EDS_sdp_2-tremie") nil)(command "-layer" "n" "GEX_EDS_sdp_2-tremie" "CO" "U" "255,255,127" "GEX_EDS_sdp_2-tremie" ""))
)

(defun h-180()
	(if (=  (tblsearch "layer" "GEX_EDS_sdp_3-h-180") nil)(command "-layer" "n" "GEX_EDS_sdp_3-h-180" "CO" "U" "165,82,82" "GEX_EDS_sdp_3-h-180" ""))
)

(defun 5-pk()
  (if (=  (tblsearch "layer" "GEX_EDS_sdp_5-pk") nil)(command "-layer" "n" "GEX_EDS_sdp_5-pk" "CO" "U" "153,153,153" "GEX_EDS_sdp_5-PK" ""))
)

(defun 6-combles()
  (if (=  (tblsearch "layer" "GEX_EDS_sdp_6-combles") nil)(command "-layer" "n" "GEX_EDS_sdp_6-combles" "CO" "U" "82,0,165" "GEX_EDS_sdp_6-combles" ""))
)	
(defun 7-lt()
  (if (=  (tblsearch "layer" "GEX_EDS_sdp_7-lt") nil)(command "-layer" "n" "GEX_EDS_sdp_7-lt" "CO" "U" "0,127,255" "GEX_EDS_sdp_7-LT" ""))
)		

(defun 8-cave()
  (if (=  (tblsearch "layer" "GEX_EDS_sdp_8-cave") nil)(command "-layer" "n" "GEX_EDS_sdp_8-cave" "CO" "U" "255,191,127" "GEX_EDS_sdp_8-cave"  "")"")
)