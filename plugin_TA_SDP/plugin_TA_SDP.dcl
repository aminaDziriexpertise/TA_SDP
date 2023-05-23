TA_SDP : dialog
              { label =  "Plugin Zwcad TA_SDP V0.1";
             
                spacer;
           
                
                : boxed_column {
                                 : boxed_column {
                    label = "Charger les elements du Plugin TA_SDP";
                    spacer;
                    
                     :row{
                             : boxed_column {  
                          label = "&Destinations";
                          width = 7;     
                          : toggle {key = "1-artisanat"  ; label = "GEX_EDS_sdp_1-artisanat.";}  
                          : toggle {key = "1-bureau"  ; label = "GEX_EDS_sdp_1-bureau.";}    
                          : toggle {key = "1-commerce" ; label = "GEX_EDS_sdp_1-commerce.";}   
                          : toggle {key = "1-entrepot" ; label = "GEX_EDS_sdp_1-entrepot.";}        
                          : toggle {key = "1-exploitation"  ; label = "GEX_EDS_sdp_1-exploitation.";}          
                          : toggle {key = "1-habitation"  ; label = "GEX_EDS_sdp_1-habitation.";}       
                          : toggle {key = "1-hotelier"  ; label = "GEX_EDS_sdp_1-hotelier.";}
                          : toggle {key = "1-industrie"  ; label = "GEX_EDS_sdp_1-industrie.";}
                          : toggle {key = "1-spic"  ; label = "GEX_EDS_sdp_1-spic.";}  
                         

                            }
                                   : boxed_column {  
                          label = "&Etages";
                          width = 7;     
                          : radio_button {key = "Toitures Terrasses"  ; label = "Toitures Terrasses";}  
                          : radio_button {key = "7emeEtage"  ; label = "7eme Etage";}    
                          : radio_button {key = "6emeEtage" ; label = "6eme Etage";}   
                          : radio_button {key = "5emeEtage" ; label = "5eme Etage";}  
                          : radio_button {key = "4emeEtage" ; label = "4eme Etage";} 
                          : radio_button {key = "3emeEtage" ; label = "3eme Etage";} 
                          : radio_button {key = "2emeEtage" ; label = "2eme Etage";} 
                          : radio_button {key = "1emeEtage" ; label = "1eme Etage";} 
                          : radio_button {key = "1erEtage" ; label = "1er Etage";}       
                          : radio_button {key = "RezdeChaussee"  ; label = "Rez de Chaussee.";}          
                          : radio_button {key = "1er-Sous/Sol"  ; label = "1er Sous/Sol";}       
                            }
                          : boxed_column {  
                          label = "&Preparation des Calques";
                          width = 7;     
                          : toggle {key = "2-tremie"  ; label = "GEX_EDS_sdp_2-tremie.";}  
                          : toggle {key = "3-h-180"  ; label = "GEX_EDS_sdp_3-h-180.";}    
                          : toggle {key = "5-pk" ; label = "GEX_EDS_sdp_5-pk.";}   
                          : toggle {key = "6-combles" ; label = "GEX_EDS_sdp_6-combles.";}        
                          : toggle {key = "7-lt"  ; label = "GEX_EDS_sdp_7-lt.";}          
                          : toggle {key = "8-cave"  ; label = "GEX_EDS_sdp_8-cave.";}       
                          : toggle {key = "cree"  ; label = "GEX_EDS_sdp_cree.";}
                          : toggle {key = "cree_supp_chg_dest"  ; label = "GEX_EDS_sdp_cree_supp_chg_dest.";}
                          : toggle {key = "demolie_reconstruite"  ; label = "GEX_EDS_sdp_demolie_reconstruite.";}  
                          : toggle {key = "supprimee"  ; label = "GEX_EDS_sdp_supprimee.";}  
                          : toggle {key = "TA_cree" ; label = "GEX_EDS_ta_cree.";}  
                          : toggle {key = "TA_cree_station" ; label = "GEX_EDS_ta_cree_stationnement.";}  
                          : toggle {key = "TA_supp" ; label = "GEX_EDS_ta_supprimee.";}          
                          : toggle {key = "TA_demolie_reconstruite"  ; label = "GEX_EDS_ta_demolie_reconstruite.";}           
                          
                            }
          
                          : row {
                              label = "&Preparation des plans";
                                : column {
                                      : column {
                                      label = "&Nettoyer les plans de projet et celui de l'existant " ;   
                                       : row {
                                       : radio_button {		key = "Purger" ;		label = "Purger" ;}		       
                                      }
                                    }  

                                   : column {
                                      label = "&Mettre les plans dans le meme repere " ;   
                                       : row {
                                       : radio_button {		key = "SCU general" ;		label = "SCU general" ;}		       
                              	
                                   }
                                } 
                                : column {
                                   label = "&Fermer tout les polylignes" ;	key = "plck"; 
                                   : row {
                                       : radio_button {		key = "PLCHEECK" ;		label = "PLCHEECK" ;}		       
                                       	
                                   }
                                }   
                                 : column {
                                   label = "&mettre l'axe Z a zero" ;	key = "zzero"; 
                                   : row {
                                       : radio_button {		key = "zzeroo" ;		label = "Z a zero" ;}		       
                                       	
                                   }
                                }  
                               }
                              }
                             
                          	 
                          }
                           spacer;
                           spacer;
                           spacer;
                          : row {
                              : column{
                              label = "&Actions";
                              width = 17;
                              height = 17;
                              : row {
                                    : column {
                                   : button {label = "Charger le plan de l'existant" ; key = "projet_existant";fixed_width=true;is_cancel=true;width=10;}
                                }
                                 spacer;
                                 spacer;
                                : column {
                                   : button { label = "Charger le plan  du  projet";key = "projet_plan";fixed_width=true;is_cancel=true;width=10;}
                                }
                                 spacer;
                                 spacer;
                                  : column {
                                     : button {label = "Comparer" ; key = "coparer";fixed_width=true;is_cancel=true;width=10;}
                                   
                                }
                                  spacer;
                                 spacer;
                                  : column {
                                  : button { label = "Export Excel";key = "export ";fixed_width=true;is_cancel=true;width=10;}
                                }
                               
                              }
                               

                               : column {
                                   label = "&Calcul de surface pour le plan existant" ; 
                                   : row {
                                   : column {
                                   label = "&TA_SDP existant" ;	key = ""; 
                                   : row {
                                        : button { label = "Calcul TA_existant";key = "calcul_TA_existant";fixed_width=true;is_cancel=true;width=18;}
                                        : button { label = "Calcul SDP_existant";key = "Calcul SDP_existant";fixed_width=true;is_cancel=true;width=18;}	          	
                                   }} 
                                    spacer;
                                     spacer;
                                      spacer;
                                       spacer;
                                    : column {
                                   label = "&TA_SDP projet" ;	key = ""; 
                                   : row {
                                        : button { label = "Calcul TA_projet";key = "calcul_TA_projet";fixed_width=true;is_cancel=true;width=18;}
                                        : button { label = "Calcul SDP_projet";key = "Calcul SDP_projet";fixed_width=true;is_cancel=true;width=18;}	          	
                                   }}
                                   
                                   
                                   }
                                     
                                }    

                                }    
                          }

                          
                   
   
                    
              
             :row {
                        ok_button;fixed_width=true;is_cancel=true;
                        cancel_button;fixed_width=true;is_cancel=true;
                }
              
                

                  }
              
                }
                 
                
                }
              

