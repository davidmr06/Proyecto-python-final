from Logic import Logic
from UserObj import UserObj

class UserLogic(Logic):
    def __init__(self):
        super().__init__()
        self.keys = ["id","user","password","role"]
    def getUserData(self ,user):
        database = self.get_databaseXObj()
        sql=f"SELECT id, usuario,password,idTipoUsuario FROM tutorias.usuarios where usuario = '{user}';"
        data = database.executeQuery(sql)
        data = self.tupleToDictionaryList(data, self.keys)
        
        if len(data)>0:
            data_d = data[0]
            userObj=UserObj(data_d["id"],data_d["user"],data_d["password"],data_d["role"])
            return userObj
        else:
            return None


    def InsertUser(self,carnet,usuario,nombre,apellido, password,correo,carrera,anio,tipouser):
        database= self.get_databaseXObj()
        sql = ("INSERT INTO tutorias.usuarios (id,carnet,usuario,Nombre,Apellido,password,Correo,Carrera,Anio,IdtipoUsuario) "
                + f"VALUES (0,{carnet},'{usuario}','{nombre}','{apellido}','{password}','{correo}', '{carrera}',{anio},{tipouser});")
        rows = database.executeNonQueryRows(sql)
        return rows
    def InsertProfesor(self, user,Nombre,Apellido, password,Correo,Carrera):
        database = self.get_databaseXObj()
        sql = ("INSERT INTO `tutorias`.`usuarios` (`id`,`usuario`,`Nombre`,`Apellido`,`password`,`Correo`,`Carrera`,`IdtipoUsuario`) "
                + f"VALUES (0,'{user}','{Nombre}','{Apellido}','{password}','{Correo}','{Carrera}',2);")
        database.executeNonQueryRows(sql)



    #Tabla Materias
    def getMaterias(self):
        database = self.get_databaseXObj()
        sql= "SELECT * FROM tutorias.materias;"
        data = database.executeQuery(sql)
        return data
    def InsertMateria(self,nombre,Carrera):
        database= self.get_databaseXObj()
        sql=f"INSERT INTO tutorias.materias (id,Materia, Carrera) VALUES(0,'{nombre}','{Carrera}');"
        rows = database.executeNonQueryRows(sql)
        return rows
    def Materiabyid(self,id):
        database= self.get_databaseXObj()
        sql = f"SELECT * FROM tutorias.materias where id = {id};"
        data = database.executeQuery(sql)
        return data
    def ActualizarMateria(self,id,materia, carrera):
        database = self.get_databaseXObj()
        sql = f"UPDATE tutorias.materias SET id = {id}, Materia = '{materia}' , Carrera = '{carrera}' WHERE id = {id};"
        data = database.executeNonQueryRows(sql)
        return data
    def BorrarMateriabyID(self,id):
        database = self.get_databaseXObj()
        sql = f"DELETE FROM tutorias.materias WHERE id = {id};"
        data = database.executeNonQueryRows(sql)
        return data
    #Tabla Tipo Usuarios
    def getTipoUsuarios(self):
        database = self.get_databaseXObj()
        sql= "SELECT * FROM tutorias.tipo_usuario;"
        data = database.executeQuery(sql)
        return data
    def InsertTipoUser(self,tipo):
        database= self.get_databaseXObj()
        sql=f"INSERT INTO tutorias.tipo_usuario (id,Tipo) VALUES(0,'{tipo}');"
        rows = database.executeNonQueryRows(sql)
        return rows
    def TipoUsuariobyid(self,id):
        database= self.get_databaseXObj()
        sql = f"SELECT * FROM tutorias.tipo_usuario where id = {id};"
        data = database.executeQuery(sql)
        return data
    def ActualizarTipoUser(self,id,tipouser):
        database = self.get_databaseXObj()
        sql = f"UPDATE tutorias.tipo_usuario SET id = {id}, Tipo = '{tipouser}' WHERE id = {id};"
        data = database.executeNonQueryRows(sql)
        return data
    def BorrarTipoUserbyID(self,id):
        database = self.get_databaseXObj()
        sql = f"DELETE FROM tutorias.tipo_usuario WHERE id = {id};"
        data = database.executeNonQueryRows(sql)
        return data
    #Tabla Usuarios
    def getUsuarios(self):
        database = self.get_databaseXObj()
        sql= "SELECT * FROM tutorias.usuarios;"
        data = database.executeQuery(sql)
        return data
    def Usuariobyid(self,id):
        database= self.get_databaseXObj()
        sql = f"SELECT * FROM tutorias.usuarios where id = {id};"
        data = database.executeQuery(sql)
        return data
    def ActualizarUser(self,id,carnet,usuario,Nombre,Apellido,password,Correo,Carrera,Anio,IdtipoUsuario):
        database = self.get_databaseXObj()
        sql = (f"UPDATE `tutorias`.`usuarios` SET `id` = {id},`carnet` = {carnet},`usuario` = '{usuario}',`Nombre` = '{Nombre}',`Apellido` = '{Apellido}', " 
        + f"`password` = '{password}',`Correo` = '{Correo}',`Carrera` = '{Carrera}',`Anio` = {Anio},`IdtipoUsuario` = {IdtipoUsuario} WHERE `id` = {id};")
        data = database.executeNonQueryRows(sql)
        return data
    def BorrarUserbyID(self,id):
        database = self.get_databaseXObj()
        sql = f"DELETE FROM tutorias.usuarios WHERE id = {id};"
        data = database.executeNonQueryRows(sql)
        return data
    def TutoresING(self):
        database = self.get_databaseXObj()
        sql = "SELECT id,Nombre,Apellido FROM tutorias.usuarios where Carrera = 'ING' and IdtipoUsuario = 2;"
        data= database.executeQuery(sql)
        return data
    def MateriasING(self):
        database = self.get_databaseXObj()
        sql = "SELECT * FROM tutorias.materias where Carrera='ING';"
        data= database.executeQuery(sql)
        return data
    def TutoresECO(self):
        database = self.get_databaseXObj()
        sql = "SELECT id,Nombre,Apellido FROM tutorias.usuarios where Carrera = 'ECO' and IdtipoUsuario = 2;"
        data= database.executeQuery(sql)
        return data
    def MateriasECO(self):
        database = self.get_databaseXObj()
        sql = "SELECT * FROM tutorias.materias where Carrera='ECO';"
        data= database.executeQuery(sql)
        return data
    def TutoresDER(self):
        database = self.get_databaseXObj()
        sql = "SELECT id,Nombre,Apellido FROM tutorias.usuarios where Carrera = 'DER' and IdtipoUsuario = 2;"
        data= database.executeQuery(sql)
        return data
    def MateriasDER(self):
        database = self.get_databaseXObj()
        sql = "SELECT * FROM tutorias.materias where Carrera='DER';"
        data= database.executeQuery(sql)
        return data
    def InsertSolicitud(self, idtutor,idalumno,materia,fecha,hora,precio):
        database = self.get_databaseXObj()
        sql = f"INSERT INTO `tutorias`.`solicitudes` (id,idtutor,idalumno,Materia,fecha,hora,Precio,`Estados`) VALUES(0,{idtutor},{idalumno},{materia},'{fecha}','{hora}',{precio},'Pendiente');"
        data = database.executeNonQueryRows(sql)
        return data
    #Funcion para alumnos
    def EstadoTutorias (self, id):
        database = self.get_databaseXObj()
        sql = ("select solicitudes.id, usuarios.nombre, usuarios.apellido, materias.Materia, solicitudes.fecha, solicitudes.hora, "
                + "solicitudes.precio, solicitudes.Estados "
                 + "from solicitudes inner join " 
                + "usuarios on solicitudes.idtutor = usuarios.id "
               + "inner join materias on solicitudes.Materia = materias.id "
               + f"where solicitudes.idalumno ={id}")
        data = database.executeQuery(sql)
        return data
    #Funcion para tutores
    def TutoriasSolicitadas (self, id):
        database = self.get_databaseXObj()
        sql = ("select solicitudes.id, usuarios.nombre, usuarios.apellido, materias.Materia, solicitudes.fecha, solicitudes.hora, "
                + "solicitudes.precio, solicitudes.Estados "
                 + "from solicitudes inner join " 
                + "usuarios on solicitudes.idalumno = usuarios.id "
               + "inner join materias on solicitudes.Materia = materias.id "
               + f"where solicitudes.idtutor ={id}")
        data = database.executeQuery(sql)
        return data
               
    def ActualizarEstadoTutoria(self,id,estado):
        database = self.get_databaseXObj()
        sql= f"UPDATE `tutorias`.`solicitudes` SET `Estados` = '{estado}' WHERE (`id` = '{id}');"
        data = database.executeNonQueryRows(sql)
        return data
    
    def VerTutoriasFinalizadas(self,id):
        database = self.get_databaseXObj()
        sql = ("SELECT tutorias_alumnos.id,usuarios.Nombre, usuarios.Apellido, materias.Materia, " +
                "tutorias_tutor.Fecha, " +
                "tutorias_tutor.Hora_tutoria,tutorias_tutor.Precio, " +
                "tutorias_alumnos.Valoracion " +
                "FROM tutorias.tutorias_alumnos " + 
                "inner join tutorias_tutor on tutorias_alumnos.idtutoriastutor = tutorias_tutor.id " +
                "inner join materias on tutorias_tutor.idmateria = materias.id " +
                "inner join usuarios on tutorias_tutor.idtutor = usuarios.id " +
                f"where tutorias_alumnos.IdAlumno= {id}") 
        data = database.executeQuery(sql)
        return data
    def EnviarValoracion(self, id, valoracion):
        database = self.get_databaseXObj()
        sql = f"UPDATE `tutorias`.`tutorias_alumnos` SET `Valoracion` = '{valoracion}' WHERE (`id` = '{id}');"
        data = database.executeNonQueryRows(sql)
        return data
    def TodasSolicitudes(self):
        database = self.get_databaseXObj()
        sql = ("select solicitudes.id, usuarios.nombre, usuarios.apellido, materias.Materia, solicitudes.fecha, solicitudes.hora, "
                + "solicitudes.precio, solicitudes.Estados "
                 + "from solicitudes inner join " 
                + "usuarios on solicitudes.idtutor = usuarios.id "
               + "inner join materias on solicitudes.Materia = materias.id ")
        data = database.executeQuery(sql)
        return data
    def VerCalificaciones (self,id):
        database = self.get_databaseXObj()
        sql = ("select tutorias_alumnos.id,usuarios.Nombre, usuarios.Apellido, materias.Materia, "
               + "tutorias_tutor.Fecha,tutorias_tutor.Hora_tutoria,tutorias_tutor.Precio, " +
                "tutorias_alumnos.Valoracion from usuarios join tutorias_alumnos on usuarios.id = tutorias_alumnos.IdAlumno " +
                "join tutorias_tutor on tutorias_alumnos.idtutoriastutor = tutorias_tutor.id " +
                "join materias on tutorias_tutor.idmateria = materias.id " +	
                f"where tutorias_tutor.idtutor = {id};")
        data = database.executeQuery(sql)
        return data
