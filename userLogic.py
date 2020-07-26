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
            print(userObj)
        else:
            return None


    def InsertUser(self,carnet,usuario,nombre,apellido, password,correo,carrera,anio,tipouser):
        database= self.get_databaseXObj()
        sql = ("INSERT INTO tutorias.usuarios (id,carnet,usuario,Nombre,Apellido,password,Correo,Carrera,Anio,IdtipoUsuario) "
                + f"VALUES (0,{carnet},'{usuario}','{nombre}','{apellido}','{password}','{correo}', '{carrera}',{anio},{tipouser});")
        rows = database.executeNonQueryRows(sql)
        return rows
    #Tabla Materias
    def getMaterias(self):
        database = self.get_databaseXObj()
        sql= "SELECT * FROM tutorias.materias;"
        data = database.executeQuery(sql)
        return data
    def InsertMateria(self,nombre):
        database= self.get_databaseXObj()
        sql=f"INSERT INTO tutorias.materias (id,Materia) VALUES(0,'{nombre}');"
        rows = database.executeNonQueryRows(sql)
        return rows
    def Materiabyid(self,id):
        database= self.get_databaseXObj()
        sql = f"SELECT * FROM tutorias.materias where id = {id};"
        data = database.executeQuery(sql)
        return data
    def ActualizarMateria(self,id,materia):
        database = self.get_databaseXObj()
        sql = f"UPDATE tutorias.materias SET id = {id}, Materia = '{materia}' WHERE id = {id};"
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