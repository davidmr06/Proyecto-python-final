from flask import Flask, render_template, request, redirect
from urllib.parse import urlparse
from userLogic import UserLogic
from UserObj import UserObj

#git push --set-upstream https://github.com/davidmr06/Proyecto-python-final master

app = Flask(__name__)

User = {"id":"", "User":""}

@app.route("/")
def index():
    return render_template("index.html")

@app.route("/loginform", methods=['GET','POST'])
def LoginForm():
    if request.method=='GET':
        return render_template("LoginForm.html")
    if request.method=='POST':
        user = request.form["user"]
        password= request.form["password"]
        logic = UserLogic()
        userdata=logic.getUserData(user)
        print(userdata)
        if userdata is not None:
            if userdata.password==password:
                if userdata.role==1:
                    User["id"] = userdata.id
                    User["User"] = userdata.user
                    print(User)
                    return render_template("MainSite_admin.html",userdata=userdata.user)
                if userdata.role==2:
                    User["id"] = userdata.id
                    User["User"] = userdata.user
                    print(User)
                    return render_template("MainSite_tutor.html",userdata=userdata.user)
                else:
                    User["id"] = userdata.id
                    User["User"] = userdata.user
                    print(User)
                    return render_template("MainSite.html",userdata=userdata.user)
            else:
                return render_template("LoginForm.html", message= "Usuario o contraseña incorrecto")
        else:
            return render_template("LoginForm.html", message= "Usuario o contraseña incorrecto")

@app.route("/loginform/createuser", methods=['GET','POST'])
def CreateUser():
    if request.method == 'GET':
        return render_template("CreateUserForm.html")
    else:
        user= request.form["user"]
        name = request.form["nombre"]
        apellido = request.form["apellido"]
        password = request.form["password"]
        correo = request.form["correo"]
        carnet = request.form["carnet"]
        carrera = request.form["carrera"]
        anio = request.form["anio"]
        tipo = request.form["rol"]
        logic = UserLogic()
        rows =  logic.InsertUser(carnet,user,name,apellido,password,correo,carrera,anio,tipo)
        print (f" {rows} affected")
        return redirect("/loginform/createuser")

@app.route("/MainSiteUser")
def MainSiteUser():
   user = User.get("User")
   return render_template("MainSite.html", userdata = user)

@app.route("/MainSiteTutor")
def MainSiteTutor():
   user = User.get("User")
   return render_template("MainSite_tutor.html", userdata = user)

@app.route("/MainSiteAdmin")
def MainSiteAdmin():
   user = User.get("User")
   return render_template("MainSite_admin.html", userdata = user)

@app.route("/MainSite/Ingenieria")
def ING():
    return render_template("Ingenieria.html")
  
@app.route("/MainSite/Ingenieria/tutoria",  methods=["GET","POST"])
def tutoriaING():
    database = UserLogic()
    if request.method == "GET":
        tutores = database.TutoresING()
        materiasING = database.MateriasING()
        return render_template("tutoria_ing.html", datatutores = tutores,  Materias = materiasING)
    else: 
        tutor = request.form["tutor"]
        alumno = User.get("id")
        materiat = request.form["materia"]
        fechat = request.form["fecha"]
        horat = request.form["hora"]
        Preciot = request.form["precio"]
        database.InsertSolicitud(tutor,alumno,materiat,fechat,horat,Preciot)
        return redirect("/MainSite/Ingenieria/tutoria")


@app.route("/MainSite/Economia")
def ECO():
    return render_template("Eco.html")

@app.route("/MainSite/Economia/tutoria",  methods=["GET","POST"])
def tutoriaECO():
    database = UserLogic()
    if request.method == "GET":
        tutores = database.TutoresECO()
        materiasECO = database.MateriasECO()
        return render_template("tutoria_eco.html", datatutores = tutores,  Materias = materiasECO)
    else: 
        tutor = request.form["tutor"]
        alumno = User.get("id")
        materiat = request.form["materia"]
        fechat = request.form["fecha"]
        horat = request.form["hora"]
        Preciot = request.form["precio"]
        database.InsertSolicitud(tutor,alumno,materiat,fechat,horat,Preciot)
        return redirect("/MainSite/Economia/tutoria")

@app.route("/MainSite/Derecho")
def DER():
    return render_template("Derecho.html")

@app.route("/MainSite/Derecho/tutoria",  methods=["GET","POST"])
def tutoriaDER():
    database = UserLogic()
    if request.method == "GET":
        tutores = database.TutoresDER()
        materiasDER = database.MateriasDER()
        return render_template("tutorias_der.html", datatutores = tutores,  Materias = materiasDER)
    else: 
        tutor = request.form["tutor"]
        alumno = User.get("id")
        materiat = request.form["materia"]
        fechat = request.form["fecha"]
        horat = request.form["hora"]
        Preciot = request.form["precio"]
        database.InsertSolicitud(tutor,alumno,materiat,fechat,horat,Preciot)
        return redirect("/MainSite/Derecho/tutoria")

#TablaMaterias
@app.route("/MainSiteAdmin/materias",methods=['GET','POST'])
def Materias():
    if request.method=="GET":
        database = UserLogic()
        data = database.getMaterias()
        return render_template("Materias_admin.html",Materias = data)
    if request.method=="POST":
        materia = request.form["materia"]
        carrera = request.form["carrera"]
        database=UserLogic()
        database.InsertMateria(materia,carrera)
        return redirect("/MainSiteAdmin/materias")

@app.route("/MainSiteAdmin/materias/actualizar/<int:id>", methods=["GET", "POST"])
def ActualizarMateria(id):
    database = UserLogic()
    if request.method=="GET":
        data=database.Materiabyid(id)
        return render_template("Actualizar_materia.html",data=data,id=id)
    else:
        materia = request.form["materia"]
        id = request.form["id"]
        carrer = request.form["carrera"]
        database.ActualizarMateria(id,materia,carrer)
        return redirect("/MainSiteAdmin/materias")

@app.route("/MainSiteAdmin/materias/borrar/<int:id>", methods=["GET"])
def BorrarMateria(id):
    database = UserLogic()
    if request.method=="GET":
        database.BorrarMateriabyID(id)
        return redirect("/MainSiteAdmin/materias")
#Tabla Tipo Usuarios
@app.route("/MainSiteAdmin/TiposUsuarios",methods=['GET','POST'])
def TipoUsuarios():
    if request.method=="GET":
        database = UserLogic()
        data = database.getTipoUsuarios()
        return render_template("TiposUsuarios_admin.html",TipoUsuarios = data)
    if request.method=="POST":
        TipoUsuario = request.form["tipouser"]
        database=UserLogic()
        database.InsertTipoUser(TipoUsuario)
        return redirect("/MainSiteAdmin/TiposUsuarios")

@app.route("/MainSiteAdmin/TiposUsuarios/actualizar/<int:id>", methods=["GET", "POST"])
def ActualizarTipoUsuario(id):
    database = UserLogic()
    if request.method=="GET":
        data=database.TipoUsuariobyid(id)
        return render_template("Actualizar_TipoUsuarios.html",data=data,id=id)
    else:
        NewUser = request.form["TipoUser"]
        id = request.form["id"]
        database.ActualizarTipoUser(id,NewUser)
        return redirect("/MainSiteAdmin/TiposUsuarios")

@app.route("/MainSiteAdmin/TiposUsuarios/borrar/<int:id>", methods=["GET"])
def BorrarTipoUser(id):
    database = UserLogic()
    if request.method=="GET":
        database.BorrarTipoUserbyID(id)
        return redirect("/MainSiteAdmin/TiposUsuarios")

@app.route("/MainSiteAdmin/CrearUsuarioProfesor", methods=["GET","POST"])
def CrearProfesor():
    database = UserLogic()
    if request.method=='GET':
        return render_template("User_profesor.html")
    else:
        usuario = request.form["user"]
        Nombre = request.form["nombre"]
        Apellido = request.form["apellido"]
        Password = request.form["password"]
        Correo = request.form["correo"]
        carrera = request.form["carrera"]
        database.InsertProfesor(usuario,Nombre,Apellido,Password,Correo,carrera)
        return redirect("/MainSiteAdmin/CrearUsuarioProfesor")
        

#Tabla Usuarios
@app.route("/MainSiteAdmin/Usuarios",methods=['GET','POST'])
def Usuarios():
    if request.method=="GET":
        database = UserLogic()
        data = database.getUsuarios()
        return render_template("Usuarios_admin.html",Usuarios = data)
    if request.method=='POST':
        database=UserLogic()
        user= request.form["user"]
        name = request.form["nombre"]
        apellido = request.form["apellido"]
        password = request.form["password"]
        correo = request.form["correo"]
        carnet = request.form["carnet"]
        carrera = request.form["carrera"]
        anio = request.form["anio"]
        tipo = request.form["rol"]
        rows =  database.InsertUser(carnet,user,name,apellido,password,correo,carrera,anio,tipo)       
        return redirect("/MainSiteAdmin/Usuarios")

@app.route("/MainSiteAdmin/Usuarios/actualizar/<int:id>", methods=["GET", "POST"])
def ActualizarUsuario(id):
    database = UserLogic()
    if request.method=="GET":
        data=database.Usuariobyid(id)
        return render_template("Actualizar_Usuarios.html",data=data,id=id)
    else:
        Newid = request.form["id"]
        NewUser = request.form["user"]
        NewNombre= request.form["nombre"]
        NewApellido= request.form["apellido"]
        Newpassword= request.form["password"]
        NewCorreo= request.form["correo"]
        NewCarnet = request.form["carnet"]
        NewCarrera= request.form["carrera"]
        NewAnio= request.form["anio"]
        NewTipo= request.form["rol"]
        database.ActualizarUser(id,NewCarnet,NewUser,NewNombre,NewApellido,Newpassword,NewCorreo,NewCarrera,NewAnio,NewTipo)
        return redirect("/MainSiteAdmin/Usuarios")

@app.route("/MainSiteAdmin/Usuarios/borrar/<int:id>", methods=["GET"])
def BorrarUser(id):
    database = UserLogic()
    if request.method=="GET":
        database.BorrarUserbyID(id)
        return redirect("/MainSiteAdmin/Usuarios")
#Sitio Alumnos
@app.route("/MainSite/Mistutorias")
def VerMisTutorias():
    database = UserLogic()
    id = User.get("id")
    data = database.EstadoTutorias(id)
    return render_template("Estado_tutorias.html",Informacion = data)
#Sitio tutores
@app.route("/MainSite/TutoriasSolicitadas",methods=['GET','POST'])
def VerMisSolicitudes():
    database = UserLogic()
    id = User.get("id")
    if request.method=='GET':
        data = database.TutoriasSolicitadas(id)
        return render_template("Solicitudes_tutorias.html",Informacion = data)
    else: 
        id = request.form["id"]
        Estado = request.form["Estado"]
        database.ActualizarEstadoTutoria(id,Estado)
        return redirect("/MainSite/TutoriasSolicitadas")

if __name__ == '__main__':
    app.run(debug=True)