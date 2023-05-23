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
@app.route('/TA_EXISTANT', methods = ['GET','POST'])
def get_url01():
    if request.method == 'POST':
        global TA_EXISTANT
        str = request.get_data()
        TA_EXISTANT = str.decode()
        return TA_EXISTANT
        
    else:
        
        return TA_EXISTANT

@app.route('/SDP_EXISTANT', methods = ['GET','POST'])
def get_url02():
    if request.method == 'POST':
        global SDP_EXISTANT
        str = request.get_data()
        SDP_EXISTANT = str.decode()
        return SDP_EXISTANT
        
    else:
        
        return SDP_EXISTANT
@app.route('/TA_PROJET', methods = ['GET','POST'])
def get_url03():
    if request.method == 'POST':
        global TA_PROJET1
        str = request.get_data()
        TA_PROJET1 = str.decode()
        return TA_PROJET1
        
    else:
        
        return TA_PROJET1
@app.route('/SDP_PROJET', methods = ['GET','POST'])
def get_url04():
    if request.method == 'POST':
        global SDP_PROJET
        str = request.get_data()
        SDP_PROJET = str.decode()
        return SDP_PROJET
    else:
        return SDP_PROJET
   
 
@app.route('/ta_SP_projet', methods = ['GET','POST'])
def get_url():
    if request.method == 'POST':
        global SP_projet
        data = request.get_data()
        SP_projet = data.decode()
        
       
        return SP_projet
        
    else:
        #scrapper_url_odoo(test)
        return SP_projet
       
@app.route('/ta_vide_projet', methods = ['GET','POST'])
def get_url1():
    if request.method == 'POST':
        global vide_projet
      
        str = request.get_data()
        vide_projet = str.decode()
        return vide_projet
        
    else:
        #scrapper_url_odoo(test)
        return vide_projet


@app.route('/ta_h_180_projet', methods = ['GET','POST'])
def get_url2():
    if request.method == 'POST':
        global h_180_projet
        data = request.get_data()
        h_180_projet = data.decode()
        return h_180_projet
        
    else:
        #scrapper_url_odoo(test)
        return h_180_projet
          


@app.route('/ST_projet', methods = ['GET','POST'])
def get_url3():
    if request.method == 'POST':
        global ST_proj
        data = request.get_data()
        ST_proj = data.decode()
        return ST_proj
        
    else:
        #scrapper_url_odoo(test)
        return ST_proj
         

@app.route('/CO_projet', methods = ['GET','POST'])
def get_url4():
    if request.method == 'POST':
        global CO_proj
        data = request.get_data()
        CO_proj = data.decode()
       
        return CO_proj
        
    else:
        #scrapper_url_odoo(test)
        return CO_proj
         
@app.route('/LT_projet', methods = ['GET','POST'])
def get_url5():
    if request.method == 'POST':
        global LT_proj
        LT_projet = request.get_data()
       
        LT_proj = LT_projet.decode()
       
        
        return LT_proj
        
    else:
        #scrapper_url_odoo(test)
        return LT_proj
         
@app.route('/cave_projet', methods = ['GET','POST'])
def get_url6():
    if request.method == 'POST':
        global cave_proj
        cave_projet = request.get_data()
        cave_proj = cave_projet.decode()
  
        return cave_proj
        
    else:
        #scrapper_url_odoo(test)
        return cave_proj

@app.route('/Isolation_projet', methods = ['GET','POST'])
def get_url7():
    if request.method == 'POST':
        global Isolation_proj
        Isolation_projet = request.get_data()
       
        Isolation_proj = Isolation_projet.decode()
        print(Isolation_proj)
        return Isolation_proj
        
    else:
        return Isolation_proj


#existant_elements



@app.route('/ta_SP_existant', methods = ['GET','POST'])
def get_url8():
    if request.method == 'POST':
        global SP_existant
        str = request.get_data()
        SP_existant = str.decode()
        #SP_existant =  convert_Str_Float(ta_SP_existant_byte)
        #print("SP_existant", SP_existant)
        #test = comparer_SP_(SP_existant, SP_projet)
        #print("k")
        #print(test)
        #response = {'result': SP_existant}
        #return jsonify(response)
        return SP_existant
    else:
        return SP_existant


def comparer_SP_(SP_existant, SP_projet):
    print('ok for data')
    if SP_existant>SP_projet:
        TA_SP_supp = (SP_existant-SP_projet)
        print(TA_SP_supp)
    else:
        TA_SP_cree = (SP_projet-SP_existant)
        print(TA_SP_cree)
    


@app.route('/ta_vide_existant', methods = ['GET','POST'])
def get_url9():
    if request.method == 'POST':
        global V_existant
        str = request.get_data()
        V_existant = str.decode()
        return V_existant
    else:
        return V_existant

         
@app.route('/ta_h_180_existant', methods = ['GET','POST'])
def get_url10():
    if request.method == 'POST':
        global H_180_existant1
        str = request.get_data()
        H_180_existant1 = str.decode()
        return H_180_existant1
        
    else:
        return H_180_existant1



@app.route('/ST_existant', methods = ['GET','POST'])
def get_url11():
    if request.method == 'POST':
        global ST_exist
        str = request.get_data()
        ST_exist = str.decode()
        return ST_exist
        
    else:
        
        return ST_exist
         

@app.route('/CO_existant', methods = ['GET','POST'])
def get_url12():
    if request.method == 'POST':
        global CO_exist
        str = request.get_data()
        CO_exist = str.decode()
        return CO_exist
        
    else:
        return CO_exist
         
@app.route('/LT_existant', methods = ['GET','POST'])
def get_url13():
    if request.method == 'POST':
        global LT_exist
        str = request.get_data()
        LT_exist = str.decode()
       
        return LT_exist
        
    else:
        return LT_exist
         
@app.route('/cave_existant', methods = ['GET','POST'])
def get_url14():
    if request.method == 'POST':
        global cave_exist
        cave_existant = request.get_data()
        cave_exist = cave_existant.decode()
        return cave_exist
        
    else:
        
        return cave_exist

@app.route('/Isolation_existant', methods = ['GET','POST'])
def get_url15():
    if request.method == 'POST':
        global Isolation_exist
        Isolation_existant = request.get_data()
        Isolation_exist = Isolation_existant.decode()
        return Isolation_exist
        
    else:
        
        return Isolation_exist
            
app.run(debug=True)
