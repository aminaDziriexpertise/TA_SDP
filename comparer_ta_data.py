

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
        data_decode = data_byte.decode()
        string = data_decode.replace(',', '.')
        result_float = float(string)
        return result_float



ta_SP_existant = requests.get(url_ta_SP_existant)
content = ta_SP_existant.content.decode('utf-8')
string1 = content.replace(',', '.')
SP_existant = float(string1)
print(SP_existant)

vide_existant = requests.get(url_ta_vide_existant)
print(vide_existant.text)
h_180_existant = requests.get(url_ta_h_180_existant)
print(h_180_existant.text)
ST_exi = requests.get(url_ST_existant)
print(ST_exi.text)
CO_exi = requests.get(url_CO_existant)
print(CO_exi.text)
LT_exi = requests.get(url_LT_existant)
print(LT_exi.text)
CAVE_exi = requests.get(url_cave_existant)
print(CAVE_exi.text)
ISO_exi = requests.get(url_Isolation_existant)
print(ISO_exi.text)




ta_SP_projet = requests.get(url_ta_SP_projet)
ta_SP_projet = ta_SP_projet.text

print(ta_SP_projet)
vide_projet = requests.get(url_ta_vide_projet)
print(vide_projet.text)
h_180_projet = requests.get(url_ta_h_180_projet)
print(h_180_projet.text)
ST_projet = requests.get(url_ST_projet)
print(ST_projet.text)
CO_projet = requests.get(url_CO_projet)
print(CO_projet.text)
LT_projet = requests.get(url_LT_projet)
print(LT_projet.text)
CAVE_projet = requests.get(url_cave_projet)
print(CAVE_projet.text)
ISO_projet = requests.get(url_Isolation_projet)
print(ISO_projet.text)

#================TA_SP======================
if ta_SP_existant>ta_SP_projet:
  TA_SP_supp = (ta_SP_existant-ta_SP_projet)
  print(TA_SP_supp)
else:
  TA_SP_cree = (ta_SP_projet-ta_SP_existant)
  print(TA_SP_cree)

#================TA_Vide======================

if vide_existant>vide_projet:
        TA_vide_supp = (vide_existant-vide_projet)
else:
        TA_vide_cree = (vide_projet-vide_existant)
    
#================TA_H_180======================
if h_180_existant>h_180_projet:
        TA_h_180_supp = (h_180_existant-h_180_projet)
else:
        TA_h_180_cree = (h_180_projet-h_180_existant)
    
#================Calcul_TA_Cree======================

TA_vide_h_180_cree = TA_vide_cree + TA_h_180_cree
TA_cree = TA_SP_cree -TA_vide_h_180_cree
print(TA_cree)

#================Calcul_TA_Supp======================
TA_vide_h_180_supp = TA_vide_supp + TA_h_180_supp
TA_supp = TA_SP_supp -TA_vide_h_180_supp
print(TA_supp)



#====================================================
#================Calcul_SDP==========================
#====================================================


#================Calcul_SDP_ST=======================
if ST_exi>ST_projet:
        ST_supp = (ST_exi-ST_projet)
else:
        ST_cree = (ST_projet-ST_exi)

#================Calcul_SDP_CO=======================
if CO_exi>CO_projet:
        CO_supp = (CO_exi-CO_projet)
else:
        CO_cree = (CO_projet-CO_exi)

#================Calcul_SDP_LT=======================
if LT_exi>LT_projet:
        LT_supp = (LT_exi-LT_projet)
else:
        LT_cree = (LT_projet-LT_exi)

#================Calcul_SDP_cave============================
if CAVE_exi>CAVE_projet:
        CAVE_supp = (CAVE_exi-CAVE_projet)
else:
        CAVE_cree = (CAVE_projet-CAVE_exi)
#================Calcul_SDP_Isolation=======================
if ISO_exi>ISO_projet:
        ISO_supp = (ISO_exi-ISO_projet)
else:
        ISO_cree = (ISO_projet-ISO_exi)

#================Calcul_SDP_Cree==========================
SDP_Cree = TA_cree-(ST_cree+CO_cree+LT_cree+CAVE_cree+ISO_cree)
print('SDP_Cree', SDP_Cree)

#================Calcul_SDP_Supprimee======================
SDP_supp = TA_supp-(ST_supp+CO_supp+LT_supp+CAVE_supp+ISO_supp)
print('SDP_SUPP',SDP_supp)
