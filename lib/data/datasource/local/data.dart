const List<Map<String, dynamic>> permiso = [
  {
    "idPermiso": 1,
    "nombrePermiso": "Gestión Roles",
    "estadoPermiso": true,
  },
  {
    "idPermiso": 2,
    "nombrePermiso": "Gestión Usuarios",
    "estadoPermiso": true,
  },
  {
    "idPermiso": 6,
    "nombrePermiso": "Gestión Clientes",
    "estadoPermiso": true,
  },
];

const List<Map<String, dynamic>> privilegio = [
  {
    "idPrivilegio": 1,
    "nombrePrivilegio": "Crear",
    "idPermiso": 1,
  },
];

const List<Map<String, dynamic>> rol = [
  {
    "idRol": 1,
    "nombreRol": "Administrador",
    "estadoRol": true,
  },
];

const List<Map<String, dynamic>> rolPrivilegio = [
  {
    "idRolPrivilegio": 1,
    "idRol": 1,
    "idPrivilegio": 1,
  },
];

const List<Map<String, dynamic>> usuario = [
  {
    "idUsuario": 1,
    "idRol": 1,
    "tipoDocumento": "CC",
    "identificacion": "899898",
    "nombre": "Juan",
    "apellido": "Quintero",
    "correo": "jq@gmail.com",
    "contrasenha": "123",
    "estadoUsuario": true,
  },
];

const List<Map<String, dynamic>> pais = [
  {
    "idPais": 1,
    "codigoPais": "57",
    "nombrePais": "Colombia",
  },
];

const List<Map<String, dynamic>> departamento = [
  {
    "idDepartamento": 1,
    "codigoDepartamento": "05",
    "nombreDepartamento": "Antioquia",
    "idPais": 1,
  },
];

const List<Map<String, dynamic>> municipio = [
  {
    "idMunicipio": 1,
    "codigoMunicipio": "05001",
    "nombreMunicipio": "Medellin",
    "idDepartamento": 1,
  },
];

// crear una mapa para el cliente con los datos de la tabla cliente
const List<Map<String, dynamic>> cliente = [
  {
    "idCliente": 1,
    "idUsuario": 1,
    "numeroContacto": "666",
    "direccion": "Calle 1",
    "idMunicipio": 1,
    "sexo": "H",
    "tipoDeSangre": "O+",
    "eps": "Sura",
    "estadoCliente": true,
  },
];
