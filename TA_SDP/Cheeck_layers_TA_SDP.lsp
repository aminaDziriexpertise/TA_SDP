;selon document: https://gexsystems.sharepoint.com/:w:/r/sites/Innovation/_layouts/15/Doc.aspx?sourcedoc=%7BF6E25D56-EE80-43FA-BCC5-643F17AB7933%7D&file=22062020_Formation_v2.2.docx&action=default&mobileredirect=true

(defun c:cheeck_layer_TA_SDP()

    (if (=  (tblsearch "layer" "GEX_EDS_sdp_1-SDP") nil)(command "-layer" "n" "GEX_EDS_sdp_1-SDP" "CO" "U" "255,0,0" "GEX_EDS_sdp_1-SDP" "TL" "axes" "GEX_EDS_sdp_1-SDP" "EP" "0.30" "GEX_EDS_sdp_1-SDP" "S" "Calques initiés par le gabarit de présentation des SDP" "GEX_EDS_sdp_1-SDP" ""))
    (if (=  (tblsearch "layer" "GEX_EDS_sdp_2-tremie") nil)(command "-layer" "n" "GEX_EDS_sdp_2-tremie" "CO" "U" "255,255,127" "GEX_EDS_sdp_2-tremie" "TL" "continuous" "GEX_EDS_sdp_2-tremie" "EP" "0.18" "GEX_EDS_sdp_2-tremie" "S" "Calques initiés par le gabarit de présentation des SDP" "GEX_EDS_sdp_2-tremie" ""))
    (if (=  (tblsearch "layer" "GEX_EDS_sdp_3-h-180") nil)(command "-layer" "n" "GEX_EDS_sdp_3-h-180" "CO" "U" "204,102,102" "GEX_EDS_sdp_3-h-180" "TL" "continuous" "GEX_EDS_sdp_3-h-180" "EP" "0.18" "GEX_EDS_sdp_3-h-180" "S" "Calques initiés par le gabarit de présentation des SDP" "GEX_EDS_sdp_3-h-180" ""))
    (if (=  (tblsearch "layer" "GEX_EDS_sdp_5-PK") nil)(command "-layer" "n" "GEX_EDS_sdp_5-PK" "CO" "U" "113,116,118" "GEX_EDS_sdp_5-PK" "TL" "continuous" "GEX_EDS_sdp_5-PK" "EP" "0.15" "GEX_EDS_sdp_5-PK" "S" "Calques initiés par le gabarit de présentation des SDP" "GEX_EDS_sdp_5-PK" ""))
    (if (=  (tblsearch "layer" "GEX_EDS_sdp_6-combles") nil)(command "-layer" "n" "GEX_EDS_sdp_6-combles" "CO" "U" "102,0,204" "GEX_EDS_sdp_6-combles" "TL" "continuous" "GEX_EDS_sdp_6-combles" "EP" "" "GEX_EDS_sdp_6-combles" "S" "Calques initiés par le gabarit de présentation des SDP" "GEX_EDS_sdp_6-combles" ""))
    (if (=  (tblsearch "layer" "GEX_EDS_sdp_7-LT") nil)(command "-layer" "n" "GEX_EDS_sdp_7-LT" "CO" "U" "0,127,255" "GEX_EDS_sdp_7-LT" "TL" "continuous" "GEX_EDS_sdp_7-LT" "EP" "" "GEX_EDS_sdp_7-LT" "S" "Calques initiés par le gabarit de présentation des SDP" "GEX_EDS_sdp_7-LT" ""))
    (if (=  (tblsearch "layer" "GEX_EDS_sdp_8-cave") nil)(command "-layer" "n" "GEX_EDS_sdp_8-cave" "CO" "U" "255,255,0" "GEX_EDS_sdp_8-cave" "TL" "continuous" "GEX_EDS_sdp_8-cave" "EP" "" "GEX_EDS_sdp_8-cave" "S" "Calques initiés par le gabarit de présentation des SDP" "GEX_EDS_sdp_8-cave" ""))

)