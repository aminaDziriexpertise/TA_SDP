from flask import Flask,request, jsonify

app = Flask(__name__)


def convert_Str_Float(data_byte):
        data_decode = data_byte.decode()
        string = data_decode.replace(',', '.')
        result_float = float(string)
        return result_float



url = 'http://127.0.0.1:5000'
app = Flask(__name__)
app.config["DEBUG"] = True
@app.route('/ta_SP_projet', methods = ['GET','POST'])
def get_url():
    if request.method == 'POST':
        global SP_projet
        data = request.get_data()
        print(data)
        SP_projet = data.decode("utf-8")
        print("ok", (data.decode("utf-8")))
        return SP_projet
        
    else:
        #scrapper_url_odoo(test)
        return SP_projet
       
@app.route('/ta_vide_projet', methods = ['GET','POST'])
def get_url1():
    if request.method == 'POST':
        global vide_projet
        data = request.get_data()
        print(data)
        vide_projet = data.decode("utf-8")
        print("ok", (data.decode("utf-8")))
        
        return vide_projet
        
    else:
        #scrapper_url_odoo(test)
        return vide_projet


@app.route('/ta_h_180_projet', methods = ['GET','POST'])
def get_url2():
    if request.method == 'POST':
        global h_180_projet
        data = request.get_data()
        print(data)
        h_180_projet = data.decode("utf-8")
        print("ok", (data.decode("utf-8")))
        return h_180_projet
        
    else:
        #scrapper_url_odoo(test)
        return h_180_projet
          


@app.route('/ST_projet', methods = ['GET','POST'])
def get_url3():
    if request.method == 'POST':
        global ST_proj
        data = request.get_data()
        print(data)
        ST_proj = data.decode("utf-8")
        print("ok", (data.decode("utf-8")))
        return ST_proj
        
    else:
        #scrapper_url_odoo(test)
        return ST_proj
         

@app.route('/CO_projet', methods = ['GET','POST'])
def get_url4():
    if request.method == 'POST':
        global CO_proj
        data = request.get_data()
        print(data)
        CO_proj = data.decode("utf-8")
        print("ok", (data.decode("utf-8")))
        return CO_proj
        
    else:
        #scrapper_url_odoo(test)
        return CO_proj
         
@app.route('/LT_projet', methods = ['GET','POST'])
def get_url5():
    if request.method == 'POST':
        global LT_proj
        LT_projet = request.get_data()
        print(LT_projet)
        LT_proj = LT_projet.decode("utf-8")
        print("ok", (LT_projet.decode("utf-8")))
        return LT_proj
        
    else:
        #scrapper_url_odoo(test)
        return LT_proj
         
@app.route('/cave_projet', methods = ['GET','POST'])
def get_url6():
    if request.method == 'POST':
        global cave_proj
        cave_projet = request.get_data()
        print(cave_projet)
        cave_proj = cave_projet.decode("utf-8")
        print("ok", (cave_projet.decode("utf-8")))
        return cave_proj
        
    else:
        #scrapper_url_odoo(test)
        return cave_proj

@app.route('/Isolation_projet', methods = ['GET','POST'])
def get_url7():
    if request.method == 'POST':
        global Isolation_proj
        Isolation_projet = request.get_data()
        print(Isolation_projet)
        Isolation_proj = Isolation_projet.decode("utf-8")
        print("ok", (Isolation_projet.decode("utf-8")))
        return Isolation_proj
        
    else:
        #scrapper_url_odoo(test)
        return Isolation_proj


#existant_elements



@app.route('/ta_SP_existant', methods = ['GET','POST'])
def get_url8():
    if request.method == 'POST':
        global SP_existant
        ta_SP_existant_byte = request.get_data()
        SP_existant =  convert_Str_Float(ta_SP_existant_byte)
        print("SP_existant", SP_existant)
        print("ok", SP_existant)
        response = {'result': SP_existant}
        #return jsonify(response)
        return "SP_existant"


def affiche(SP_existant):
    print('ok for data', SP_existant)


@app.route('/ta_vide_existant', methods = ['GET','POST'])
def get_url9():
    if request.method == 'POST':
        global vide_existant1
        ta_vide_existant_byte = request.get_data()
        string = ta_vide_existant_byte.decode()
        string1 = string.replace(',', '.')
        vide_existant = float(string1)
        print(type(vide_existant))
        print("vide_existant", vide_existant)
        vide_existant1 = ta_vide_existant_byte.decode()
        
        print("ok", vide_existant1)
        return vide_existant1
        
    else:
        return vide_existant1

         
@app.route('/ta_h_180_existant', methods = ['GET','POST'])
def get_url10():
    if request.method == 'POST':
        global H_180_existant1
        ta_H_180_existant_byte = request.get_data()
        string = ta_H_180_existant_byte.decode()
        string1 = string.replace(',', '.')
        H_180_existant = float(string1)
        print(type(H_180_existant))
        print("H_180_existant", H_180_existant)
        H_180_existant1 = ta_H_180_existant_byte.decode()
        
        print("ok", H_180_existant1)
        return H_180_existant1
        
    else:
        return H_180_existant1



@app.route('/ST_existant', methods = ['GET','POST'])
def get_url11():
    if request.method == 'POST':
        global ST_exist
        ST_existant = request.get_data()
        print(ST_existant)
        ST_exist = ST_existant.decode("utf-8")
        print("ok", (ST_existant.decode("utf-8")))
        return ST_exist
        
    else:
        
        return ST_exist
         

@app.route('/CO_existant', methods = ['GET','POST'])
def get_url12():
    if request.method == 'POST':
        global CO_exist
        CO_existant = request.get_data()
        print(CO_existant)
        CO_exist = CO_existant.decode("utf-8")
        print("ok", (CO_existant.decode("utf-8")))
        return CO_exist
        
    else:
        return CO_exist
         
@app.route('/LT_existant', methods = ['GET','POST'])
def get_url13():
    if request.method == 'POST':
        global LT_exist
        LT_existant = request.get_data()
        print(LT_existant)
        LT_exist = LT_existant.decode("utf-8")
        print("ok", (LT_existant.decode("utf-8")))
        return LT_exist
        
    else:
        return LT_exist
         
@app.route('/cave_existant', methods = ['GET','POST'])
def get_url14():
    if request.method == 'POST':
        global cave_exist
        cave_existant = request.get_data()
        print(cave_existant)
        cave_exist = cave_existant.decode("utf-8")
        print("ok", (cave_existant.decode("utf-8")))
        return cave_exist
        
    else:
        
        return cave_exist

@app.route('/Isolation_existant', methods = ['GET','POST'])
def get_url15():
    if request.method == 'POST':
        global Isolation_exist
        Isolation_existant = request.get_data()
        print(Isolation_existant)
        Isolation_exist = Isolation_existant.decode("utf-8")
        print("Isolation_existant", (Isolation_existant.decode("utf-8")))
        return Isolation_exist
        
    else:
        
        return Isolation_exist
            
app.run(debug=True)
