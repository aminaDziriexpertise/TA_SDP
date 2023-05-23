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


def SP():
    if ta_SP_existant<ta_SP_projet and ta_V_existant<ta_V_projet and ta_H_180_existant<ta_H_180_projet:
                    global TA_SP_cree
                    TA_SP_cree = (ta_SP_projet-ta_SP_existant)
                    TA_V_cree = (ta_V_projet-ta_V_existant)
                    TA_H_cree = (ta_H_180_projet-ta_H_180_existant)
                    TA_cree = TA_SP_cree-(TA_V_cree+TA_H_cree)
                    print("TA__cree", TA_cree)            
    elif  ta_SP_existant>ta_SP_projet and ta_V_existant>ta_V_projet and ta_H_180_existant>ta_H_180_projet :
                        
                    TA_SP_supp = (ta_SP_existant -ta_SP_projet)
                    TA_V_supp = (ta_V_existant -ta_V_projet)
                    TA_H_supp = (ta_H_180_existant -ta_H_180_projet)
                    TA_supp = TA_SP_supp-(TA_V_supp+TA_H_supp)
                    print("TA__supp", TA_supp)
    elif  ta_SP_existant>ta_SP_projet or ta_V_existant==ta_V_projet and ta_H_180_existant>ta_H_180_projet :
                        
                    TA_SP_supp = (ta_SP_existant -ta_SP_projet)
                    TA_V_supp = (ta_V_existant -ta_V_projet)
                    TA_H_supp = (ta_H_180_existant -ta_H_180_projet)
                    TA_supp = TA_SP_supp-(TA_V_supp+TA_H_supp)
                    print("TA__supp", TA_supp)
                    TA_SP_ = ta_SP_projet
                    print("ta_SP_projet", ta_SP_projet) 
    return TA_SP_

def Vide():
    TA_SP_ = SP()
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

    return TA_SP_V_cree, TA_SP_V_supp
Vide()