import requests
from openpyxl import load_workbook


url_ta_SP_existant = "http://127.0.0.1:5000/ta_SP_existant"
url_ta_vide_existant = "http://127.0.0.1:5000/ta_vide_existant"
url_ta_h_180_existant = "http://127.0.0.1:5000/ta_h_180_existant"
url_ST_existant = "http://127.0.0.1:5000/ST_existant"
url_CO_existant = "http://127.0.0.1:5000/CO_existant"
url_LT_existant = "http://127.0.0.1:5000/LT_existant"
url_cave_existant = "http://127.0.0.1:5000/cave_existant"
url_Isolation_existant = "http://127.0.0.1:5000/Isolation_existant"

url_ta_SP_projet = "http://127.0.0.1:5000/ta_SP_projet"
url_ta_vide_projet = "http://127.0.0.1:5000/ta_vide_projet"
url_ta_h_180_projet = "http://127.0.0.1:5000/ta_h_180_projet"
url_ST_projet = "http://127.0.0.1:5000/ST_projet"
url_CO_projet = "http://127.0.0.1:5000/CO_projet"
url_LT_projet = "http://127.0.0.1:5000/LT_projet"
url_cave_projet = "http://127.0.0.1:5000/cave_projet"
url_Isolation_projet = "http://127.0.0.1:5000/Isolation_projet"


def convert_Str_Float(data_byte):
        content = data_byte.content.decode('utf-8')
        string1 = content.replace(',', '.')
        result_float = float(string1)
        return result_float
#Calcul TA(CREE, SUPPRIMEE)
ta_SP_existant1 = requests.get(url_ta_SP_existant)
ta_SP_existant = convert_Str_Float(ta_SP_existant1)
print("ta_SP_existant", ta_SP_existant)
ta_SP_projet1 = requests.get(url_ta_SP_projet)
ta_SP_projet = convert_Str_Float(ta_SP_projet1)
print("ta_SP_projet", ta_SP_projet)
ta_V_existant1 = requests.get(url_ta_vide_existant)
ta_V_existant = convert_Str_Float(ta_V_existant1)
ta_V_projet1 = requests.get(url_ta_vide_projet)
ta_V_projet = convert_Str_Float(ta_V_projet1)
ta_H_180_existant1 = requests.get(url_ta_h_180_existant)
ta_H_180_existant= convert_Str_Float(ta_H_180_existant1)
ta_H_180_projet1 = requests.get(url_ta_h_180_projet)
ta_H_180_projet = convert_Str_Float(ta_H_180_projet1)


if   ta_SP_existant<ta_SP_projet:
                    global TA_SP_cree
                    TA_SP_ = (ta_SP_projet-ta_SP_existant)
                    #print("TA_SP_cree", TA_SP_)
                   
                   
elif  ta_SP_existant>ta_SP_projet:
                    global TA_SP_supp
                    TA_SP_ = (ta_SP_existant -ta_SP_projet)
                   # print("TA_SP_supp", TA_SP_)
else:
                    TA_SP_ = ta_SP_projet
                    print("ta_SP_projet", ta_SP_projet) 

if ta_V_existant<ta_V_projet:
                    global TA_V_cree
                    TA_V_cree = (ta_V_projet-ta_V_existant)
                    test_SP_v_ = TA_SP_-TA_V_cree
                    TA_SP_V_cree = test_SP_v_
                    #print("TA_V_cree", TA_V_cree)
                    print("test_SP_vide_cree ",test_SP_v_ )
                   
elif  ta_V_existant>ta_V_projet:
                    global TA_V_supp
                    TA_V_supp = (ta_V_existant -ta_V_projet)
                    test_SP_v_ = TA_SP_-TA_V_supp
                    TA_SP_V_supp = test_SP_v_

                    #print("TA_V_supp", TA_V_supp)
                    print("test_SP_vide_supp", test_SP_v_)
else:
                    test_SP_v_ = TA_SP_
                    print("ta_SP_v", test_SP_v_) 

if ta_H_180_existant<ta_H_180_projet:
                    global TA_H_180_cree
                    TA_H_180_cree = (ta_H_180_projet-ta_H_180_existant)
                   # print("TA_H_180_cree", TA_H_180_cree)
                    test_SP_H_cree = test_SP_v_ - TA_H_180_cree
                    print("test_H_180_SP_cree", test_SP_H_cree)             
elif  ta_H_180_existant>ta_H_180_projet:
                    global TA_H_180_supp
                    TA_H_180_supp = (ta_H_180_existant -ta_H_180_projet)
                    test_SP_H_supp = test_SP_v_ - TA_H_180_supp
                    #print("TA_H_180_supp", TA_H_180_supp)
                    print("test_H_180_SP_supp", test_SP_H_supp)
#else: 
                   # test_SP_H_ = test_SP_v_ 
                   # print("test_SP_H_supp", test_SP_H_)
                    #print("ta_H_180_projet",ta_H_180_projet)

            
#calcul SDP(Cree, Supprimee)
ST_existant1 = requests.get(url_ST_existant)
ST_existant = convert_Str_Float(ST_existant1)
ST_projet1 = requests.get(url_ST_projet)
ST_projet = convert_Str_Float(ST_projet1)
CO_existant1 = requests.get(url_CO_existant)
CO_existant = convert_Str_Float(CO_existant1)
CO_projet1 = requests.get(url_CO_projet)
CO_projet = convert_Str_Float(CO_projet1)
LT_existant1 = requests.get(url_LT_existant)
LT_existant = convert_Str_Float(LT_existant1)
LT_projet1 = requests.get(url_LT_projet)
LT_projet = convert_Str_Float(LT_projet1)
Cave_existant1 = requests.get(url_cave_existant)
Cave_existant = convert_Str_Float(Cave_existant1)
Cave_projet1 = requests.get(url_cave_projet)
Cave_projet = convert_Str_Float(Cave_projet1)
Iso_existant1 = requests.get(url_Isolation_existant)
Iso_existant = convert_Str_Float(Iso_existant1)
Iso_projet1 = requests.get(url_Isolation_projet)
Iso_projet = convert_Str_Float(Iso_projet1)


#================Calcul_SDP_STationnement =======================
if ST_existant>ST_projet:
     ST_supp = (ST_existant-ST_projet)
     print("ST_supp", ST_supp)
elif ST_existant<ST_projet:
     ST_cree = (ST_projet-ST_existant)
     print("ST_cree", ST_cree)
else:
     ST_ = ST_existant
     print("ST_", ST_)

#================Calcul_SDP_CO=======================
if CO_existant>CO_projet:
        CO_supp = (CO_existant-CO_projet)
        print("CO_supp", CO_supp)
elif CO_existant<CO_projet:
        CO_cree = (CO_projet-CO_existant)
        print("CO_cree", CO_cree)
else:
     CO_ = CO_existant 
     print("CO_", CO_) 

#================Calcul_SDP_LT=======================
if LT_existant>LT_projet:
        LT_supp = (LT_existant-LT_projet)
        print("LT_supp", LT_supp)
elif LT_existant>LT_projet:
        LT_cree = (LT_projet-LT_existant)
        print("LT_cree", LT_cree)
else:
    LT_ = LT_existant
    print("LT_", LT_)

#================Calcul_SDP_cave============================
if Cave_existant>Cave_projet:
        CAVE_supp = (Cave_existant-Cave_projet)
        print("CAVE_supp", CAVE_supp)
elif Cave_existant<Cave_projet:
        CAVE_cree = (Cave_projet-Cave_existant)
        print("CAVE_cree", CAVE_cree)
else:
    CAVE_ = Cave_existant
    print("CAVE_", CAVE_)
#================Calcul_SDP_Isolation=======================
if Iso_existant>Iso_projet:
        ISO_supp = (Iso_existant-Iso_projet)
        print("ISO_supp", ISO_supp)
elif Iso_existant<Iso_projet:
        ISO_cree = (Iso_projet-Iso_existant)
        print("ISO_cree", ISO_cree)
else:
    ISO_ = Iso_existant
    print("ISO_", ISO_)

#SDP_cree = 




 







