  

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


def SP_existant():
 ta_SP_existant = requests.get(url_ta_SP_existant)
 test = convert_Str_Float(ta_SP_existant)
 return test

def SP_projet():
 ta_SP_projet = requests.get(url_ta_SP_projet)
 test = convert_Str_Float(ta_SP_projet)
 return test

def V_existant():
 ta_V_existant = requests.get(url_ta_vide_existant)
 test = convert_Str_Float(ta_V_existant)
 return test

def V_projet():
 ta_V_projet = requests.get(url_ta_vide_projet)
 test = convert_Str_Float(ta_V_projet)
 return test

def H_180_existant():
 ta_H_180_existant = requests.get(url_ta_h_180_existant)
 test = convert_Str_Float(ta_H_180_existant)
 return test

def H_180_projet():
 ta_H_180_projet = requests.get(url_ta_h_180_projet)
 test = convert_Str_Float(ta_H_180_projet)
 return test
 
def ST_existant():
 ST_existant = requests.get(url_ST_existant)
 test = convert_Str_Float(ST_existant)
 return test

def ST_projet():
 ST_projet = requests.get(url_ST_projet)
 test = convert_Str_Float(ST_projet)
 return test

def CO_existant():
 CO_existant = requests.get(url_CO_existant)
 test = convert_Str_Float(CO_existant)
 return test

def CO_projet():
 CO_projet = requests.get(url_CO_projet)
 test = convert_Str_Float(CO_projet)
 return test

def LT_existant():
 LT_existant = requests.get(url_LT_existant)
 test = convert_Str_Float(LT_existant)
 return test

def LT_projet():
 LT_projet = requests.get(url_LT_projet)
 test = convert_Str_Float(LT_projet)
 return test

def Cave_existant():
 Cave_existant = requests.get(url_cave_existant)
 test = convert_Str_Float(Cave_existant)
 return test

def Cave_projet():
 Cave_projet = requests.get(url_cave_projet)
 test = convert_Str_Float(Cave_projet)
 return test

def Iso_existant():
 Iso_existant = requests.get(url_Isolation_existant)
 test = convert_Str_Float(Iso_existant)
 return test

def Iso_projet():
 Iso_projet = requests.get(url_Isolation_projet)
 test = convert_Str_Float(Iso_projet)
 return test

def compare_v01():
       SP_existant1 = SP_existant()
       SP_projet1 = SP_projet()
       V_existant1 = V_existant()
       V_projet1 = V_projet()
       H_180_existant1 = H_180_existant()
       H_180_projet1 = H_180_projet()
       def sp_compare():
            global TA_SP_cree
            global TA_SP_supp
            
            if SP_existant1<SP_projet1:
                    TA_SP_cree = (SP_projet1-SP_existant1)
                    print("TA_SP_cree", type(TA_SP_cree))
                    return TA_SP_cree
            elif  SP_existant1>SP_projet1:
                    TA_SP_supp = (SP_existant1 -SP_projet1)
                    print("TA_SP_supp", type(TA_SP_supp))
                    return TA_SP_supp
            elif SP_existant1==SP_projet1:
                    return SP_projet1
       sp_compare()
       def V_compare():
            global TA_V_cree
            global TA_V_supp
            if  V_existant1<V_projet1:
                    TA_V_cree = (V_projet1-V_existant1)
                    print("TA_V_cree", TA_V_cree)
                    return TA_V_cree
            elif  V_existant1>V_projet1:
                    TA_V_supp = ( V_projet1-V_existant1)
                    print("TA_V_supp", TA_V_supp)
                    return TA_V_supp

            else:
                    return V_projet1
        
       V_compare()            

       def H_compare():
         if H_180_existant1<H_180_projet1:
            TA_H_180_cree = (H_180_projet1-H_180_existant1)
            print("TA_H_180_cree", TA_H_180_cree)
            return TA_H_180_cree
         elif H_180_existant1>H_180_projet1:
            TA_H_180_supp = (H_180_existant1-H_180_projet1)
            print("TA_H_180_supp", TA_H_180_supp)
            return TA_H_180_supp
         else:
            return H_180_projet1
       H_compare()
 
       print('ok2')     
       print('ok3')
       TA_cree = TA_SP_cree - TA_V_cree
       print(TA_cree)
       return TA_cree

compare_v01()
def compare():
    SP_existant1 = SP_existant()
    SP_projet1 = SP_projet()
    if SP_existant1<SP_projet1:
            TA_SP_cree = (SP_projet1-SP_existant1)
            print("TA_SP_cree", type(TA_SP_cree))
            return TA_SP_cree
test = compare()
print("test", test)
def SP_Supp():
         global TA_SP_supp
         SP_existant1 = SP_existant()
         SP_projet1 = SP_projet()
         if SP_existant1>SP_projet1:
            TA_SP_supp = (SP_existant1-SP_projet1)
            print("TA_SP_supp", TA_SP_supp)
            return TA_SP_supp
         #return TA_SP_supp
def SP_Cree():
       global TA_SP_cree
       SP_existant1 = SP_existant()
       SP_projet1 = SP_projet()
       if SP_existant1<SP_projet1:
            TA_SP_cree = (SP_projet1-SP_existant1)
            print("TA_SP_cree", TA_SP_cree)
            return TA_SP_cree
      # return TA_SP_cree
       
   
def compare_Vide():
    global TA_V_supp
    global TA_V_cree
    V_existant1 = V_existant()
    V_projet1 = V_projet()
def V_supp():
        global TA_V_supp
        V_existant1 = V_existant()
        V_projet1 = V_projet()
        if V_existant1>V_projet1:
            TA_V_supp = (V_existant1-V_projet1)
            print("TA_V_supp", TA_V_supp)
            return TA_V_supp
        #return TA_V_supp
def V_cree():
        global TA_V_cree
        V_existant1 = V_existant()
        V_projet1 = V_projet()
        if V_existant1<V_projet1:
            TA_V_cree = (V_projet1-V_existant1)
            print("TA_V_cree", TA_V_cree)
            return TA_V_cree
        #return TA_V_cree
   # return {'TA_V_supp': TA_V_supp, 'TA_V_cree': TA_V_cree}
 
    
              
def compare_H_180():
    global TA_H_180_supp
    global TA_H_180_cree
   
def H_180_supp():
       global TA_H_180_supp
       H_180_existant1 = H_180_existant()
       H_180_projet1 = H_180_projet()
       if H_180_existant1>H_180_projet1:
            TA_H_180_supp = (H_180_existant1-H_180_projet1)
            print("TA_H_180_supp", TA_H_180_supp)
            return TA_H_180_supp
       #return TA_H_180_supp
def H_180_cree():
        global TA_H_180_cree
        H_180_existant1 = H_180_existant()
        H_180_projet1 = H_180_projet()
        if H_180_existant1<H_180_projet1:
            TA_H_180_cree = (H_180_projet1-H_180_existant1)
            print("TA_H_180_cree", TA_H_180_cree)
            return TA_H_180_cree
        #return TA_H_180_cree
 
    #return {'TA_H_180_supp': TA_H_180_supp, 'TA_H_180_cree': TA_H_180_cree}
TA_SP_cree1 = SP_Cree()
TA_V_cree1 = V_cree()
TA_H_180_cree1 = H_180_cree()
def calcul_TA_cree():
    SP_Cree()
    print(type(TA_SP_cree1))
    print(TA_SP_cree1)
   # TA_cree = (TA_SP_cree1-(TA_V_cree1+TA_H_180_cree1))
   # print(TA_cree)
   # return TA_cree
  
#calcul_TA_cree()    

def calcul_TA_supp():
    TA_SP_supp = SP_Supp()
    TA_V_supp = V_supp()
    TA_H_180_supp = H_180_supp()
    TA_supp = (TA_SP_supp-(TA_V_supp+TA_H_180_supp))
    print(TA_supp)
    return TA_supp           


#SP_Cree()
#SP_Supp()
#V_cree()
#V_supp()
#H_180_supp()
#H_180_cree()
#calcul_TA_cree()
#calcul_TA_supp()


   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
  