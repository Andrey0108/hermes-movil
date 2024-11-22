DROP TABLE IF EXISTS permiso CASCADE;
CREATE TABLE permiso(
    idPermiso SERIAL NOT NULL,
    nombrePermiso VARCHAR(60) NOT NULL,
    estadoPermiso BOOLEAN NOT NULL,
    CONSTRAINT PK_idPermiso PRIMARY KEY (idPermiso),
    CONSTRAINT uc_nombrePermiso UNIQUE (nombrePermiso),
    CONSTRAINT CHK_nombrePermiso CHECK (nombrePermiso ~ '^[A-Z][a-zñ]{3,}[^\d\W_]*$')
);
SELECT * FROM permiso;

DROP TABLE IF EXISTS privilegio CASCADE;
CREATE TABLE privilegio(
    idPrivilegio SERIAL NOT NULL,
    nombrePrivilegio VARCHAR(60) NOT NULL,
    idPermiso INTEGER NOT NULL,

    CONSTRAINT PK_idPrivilegio PRIMARY KEY (idPrivilegio),
    CONSTRAINT FK_idPermiso FOREIGN KEY (idPermiso) REFERENCES permiso(idPermiso),
    CONSTRAINT uc_nombrePrivilegio UNIQUE (nombrePrivilegio),
    CONSTRAINT CHK_nombrePrivilegio CHECK (nombrePrivilegio ~ '^[A-Z][a-zñ]{3,}[^\d\W_]*$')
);
SELECT * FROM privilegio; 

  

DROP TABLE IF EXISTS rol CASCADE;
CREATE TABLE rol(
    idRol SERIAL NOT NULL,
    nombreRol VARCHAR(60) NOT NULL,
    estadoRol BOOLEAN NOT NULL,
	
    CONSTRAINT PK_idRol PRIMARY KEY (idRol),
    CONSTRAINT UC_nombreRol UNIQUE (nombreRol),
    CONSTRAINT CHK_nombreRol CHECK (nombreRol ~ '^[A-Z][a-zñ]{3,}[^\d\W_]*$')
);
SELECT * FROM rol;

DROP TABLE IF EXISTS rolPrivilegio CASCADE;
CREATE TABLE rolPrivilegio(
    idRolPrivilegio SERIAL NOT NULL,
    idRol INTEGER NOT NULL,
    idPrivilegio INTEGER NOT NULL,
    
    CONSTRAINT PK_idRolPrivilegio PRIMARY KEY (idRolPrivilegio),
    CONSTRAINT FK_idRol FOREIGN KEY (idRol) REFERENCES rol(idRol),
    CONSTRAINT FK_idPrivilegio FOREIGN KEY (idPrivilegio) REFERENCES privilegio(idPrivilegio)
);
SELECT * FROM rolPrivilegio;

DROP TABLE IF EXISTS usuario CASCADE;
CREATE TABLE usuario( 
    idUsuario SERIAL NOT NULL,
    idRol INTEGER NOT NULL,
    tipoDocumento VARCHAR(5) NOT NULL,
    identificacion VARCHAR(60) NOT NULL,
    nombre VARCHAR(255) NOT NULL,
    apellido VARCHAR(255) NOT NULL,
    correo VARCHAR(255) NOT NULL,
    contrasenha VARCHAR(255) NOT NULL,
    estadoUsuario BOOLEAN NOT NULL,

    CONSTRAINT PK_idUsuario PRIMARY KEY (idUsuario),
    CONSTRAINT FK_idRolUsuario FOREIGN KEY (idRol) REFERENCES rol(idRol),
    CONSTRAINT CHK_tipoDocumento CHECK (tipoDocumento ~ '^(CC|CE|PA|SC|CD|TE|PEP|AS|DU|CCEX|CEEX|PAEX|SCEX|CDEX|TEX|RNEX|PEPEX|ASEX)$'),
    CONSTRAINT CHK_identificacion CHECK (identificacion ~ '^[a-z0-9]{6,}$'),
    CONSTRAINT CHK_correo CHECK (correo ~ '^[a-z0-9.!#$%&*+/=?^_`{|}~-]+@[a-z0-9-]+\.[a-z0-9.]{2,}$')
);
SELECT * FROM usuario;

DROP TABLE IF EXISTS pais CASCADE;
CREATE TABLE pais(
    idPais SERIAL NOT NULL,
    codigoPais INTEGER NOT NULL,
    nombrePais VARCHAR(60) NOT NULL,

    CONSTRAINT PK_idPais PRIMARY KEY (idPais),
    CONSTRAINT CHK_codigoPais CHECK (CAST(codigoPais AS TEXT) ~ '^[0-9]{1,}$'),
    CONSTRAINT UC_codigoPais UNIQUE (codigoPais),
    CONSTRAINT CHK_nombrePais CHECK (nombrePais ~ '^[A-Z][a-zñ]{3,}[^\d\W_]*$'),
    CONSTRAINT UC_nombrePais UNIQUE (nombrePais)
);
SELECT * FROM pais;

DROP TABLE IF EXISTS departamento CASCADE;
CREATE TABLE departamento(
    idDepartamento SERIAL NOT NULL,
    codigoDepartamento INTEGER NOT NULL,
    nombreDepartamento VARCHAR(60) NOT NULL,
    idPais INTEGER NOT NULL,

    CONSTRAINT PK_idDepartamento PRIMARY KEY (idDepartamento),
    CONSTRAINT CHK_codigoDepartamento CHECK (CAST(codigoDepartamento AS TEXT) ~ '^[0-9]{1,}$'),
    CONSTRAINT UC_codigoDepartamento UNIQUE (codigoDepartamento),
    CONSTRAINT CHK_nombreDepartamento CHECK (nombreDepartamento ~ '^[A-Z][a-zñ]{3,}[^\d\W_]*$'),
    CONSTRAINT UC_nombreDepartamento UNIQUE (nombreDepartamento),
    CONSTRAINT FK_idPais FOREIGN KEY (idPais) REFERENCES pais(idPais)
);
SELECT * FROM departamento;

DROP TABLE IF EXISTS municipio CASCADE;
CREATE TABLE municipio(
    idMunicipio SERIAL NOT NULL,
    codigoMunicipio INTEGER NOT NULL,
    nombreMunicipio VARCHAR(60) NOT NULL,
    idDepartamento INTEGER NOT NULL,

    CONSTRAINT PK_idMunicipio PRIMARY KEY (idMunicipio),
    CONSTRAINT CHK_codigoMunicipio CHECK (CAST(codigoMunicipio AS TEXT) ~ '^[0-9]{1,}$'),
    CONSTRAINT UC_codigoMunicipio UNIQUE (codigoMunicipio),
    CONSTRAINT CHK_nombreMunicipio CHECK (nombreMunicipio ~ '^[A-Z][a-zñ]{3,}[^\d\W_]*$'),
    CONSTRAINT UC_nombreMunicipio UNIQUE (nombreMunicipio),
    CONSTRAINT FK_idDepartamento FOREIGN KEY (idDepartamento) REFERENCES departamento(idDepartamento)
);
SELECT * FROM municipio;

DROP TABLE IF EXISTS cliente CASCADE;
CREATE TABLE cliente(
    idCliente SERIAL NOT NULL,
    idUsuario INTEGER NOT NULL,
    numeroContacto VARCHAR(15) NOT NULL,
    direccion VARCHAR(40) NOT NULL,
    idMunicipio INTEGER NOT NULL,
    sexo CHAR NOT NULL,
    tipoDeSangre VARCHAR(3) NOT NULL,
    eps VARCHAR(60) NOT NULL,
    estadoCliente BOOLEAN NOT NULL,
    
    CONSTRAINT PK_idCliente PRIMARY KEY (idCliente),
    CONSTRAINT FK_idUsuario FOREIGN KEY (idUsuario) REFERENCES usuario(idUsuario),
    CONSTRAINT CHK_numeroContacto CHECK (numeroContacto ~ '^\+?[0-9]{1,3}[0-9]{7,}$'),
    CONSTRAINT CHK_direccion CHECK (direccion ~ '^[A-Z][a-zñ]{3,}[^\d\W_]*$'),
    CONSTRAINT FK_idMunicipio FOREIGN KEY (idMunicipio) REFERENCES municipio(idMunicipio),
    CONSTRAINT CHK_sexo CHECK (sexo ~ '^(H|M)$'),
    CONSTRAINT CHK_tipoDeSangre CHECK (tipoDeSangre ~ '^(A|B|AB|O)+[+|-]$'),
    CONSTRAINT CHK_eps CHECK (eps ~ '^[A-Z][a-zñ]{3,}[^\d\W_]*$')
);
SELECT * FROM cliente;

DROP TABLE IF EXISTS actividad CASCADE;
CREATE TABLE actividad(
    idActividad SERIAL NOT NULL,
    nombreActividad VARCHAR(60) NOT NULL,

    CONSTRAINT PK_idActividad PRIMARY KEY (idActividad),
    CONSTRAINT CHK_nombreActividad CHECK (nombreActividad ~ '^[A-Z][a-zñ]{3,}[^\d\W_]*$'),
    CONSTRAINT UC_nombreActividad UNIQUE (nombreActividad)
);
SELECT * FROM actividad;

DROP TABLE IF EXISTS categoriaServicio CASCADE;
CREATE TABLE categoriaServicio(
    idCategoriaServicio SERIAL NOT NULL,
    nombreCategoriaServicio VARCHAR(60) NOT NULL,

    CONSTRAINT PK_categoriaServicio PRIMARY KEY (idCategoriaServicio),
    CONSTRAINT CHK_nombreCategoriaServicio CHECK (nombreCategoriaServicio ~ '^[A-Z][a-zñ]{3,}[^\d\W_]*$'),
    CONSTRAINT UC_nombreCategoriaServicio UNIQUE (nombreCategoriaServicio)
);
SELECT * FROM categoriaServicio;

DROP TABLE IF EXISTS servicio CASCADE;
CREATE TABLE servicio(
    idServicio SERIAL NOT NULL,
    idCategoriaServicio INTEGER NOT NULL,
    nombreServicio VARCHAR(60) NOT NULL,
    valorServicio DECIMAL(15,2) NOT NULL,
    estadoServicio BOOLEAN NOT NULL,
    
    CONSTRAINT PK_Service PRIMARY KEY (idServicio),
    CONSTRAINT UC_nombreServicio UNIQUE (nombreServicio),
    CONSTRAINT FK_categoryService FOREIGN KEY (idCategoriaServicio) REFERENCES categoriaServicio(idCategoriaServicio),
    CONSTRAINT CHK_nombreServicio CHECK (nombreServicio ~ '^[A-Z][a-zñ]{3,}[^\d\W_]*$'),
    CONSTRAINT CHK_valorServicio CHECK (CAST(valorServicio AS TEXT) ~ '^[1-9][0-9]*(\.[0-9]{1,2})?$')
);
SELECT * FROM servicio;

DROP TABLE IF EXISTS paquete CASCADE;
CREATE TABLE  paquete (
    idPaquete SERIAL NOT NULL,
    nombrePaquete  VARCHAR (60) NOT NULL,
    idMunicipio INTEGER NOT NULL,
    idActividad INTEGER NOT NULL,
    nivelActividad DECIMAL(2,1) NOT NULL,
    inversionPaquete DECIMAL(15,2) NOT NULL,
    reservaPaquete DECIMAL(15,2) NOT NULL,
    
    CONSTRAINT PK_paquete PRIMARY KEY (idPaquete),
    CONSTRAINT CHK_nombrePaquetePackage  CHECK (nombrePaquete ~ '^[A-Z][a-zñ]{3,}[^\d\W_]*$'),
    CONSTRAINT FK_idMunicipio FOREIGN KEY (idMunicipio) REFERENCES municipio(idMunicipio),
    CONSTRAINT FK_idActividad FOREIGN KEY (idActividad) REFERENCES actividad(idActividad),
    CONSTRAINT CHK_nivelActividad CHECK  (CAST(nivelActividad AS TEXT) ~ '^[1-9][0-9]*(\.[0-9]{1,})?$'),
    CONSTRAINT CHK_inversionPaquete CHECK  (CAST(inversionPaquete AS TEXT) ~ '^[1-9][0-9]*(\.[0-9]{1,2})?$'),
    CONSTRAINT CHK_reservaPaquete CHECK  (CAST(reservaPaquete AS TEXT) ~ '^[1-9][0-9]*(\.[0-9]{1,2})?$')
);
SELECT * FROM paquete;

DROP TABLE IF EXISTS detallePaqueteServicio CASCADE;
CREATE TABLE detallePaqueteServicio(
    idDetallePaqueteServicio SERIAL NOT NULL,
    idPaquete INTEGER NOT NULL,
    idServicio INTEGER NOT NULL,
    cantidadServicioPaquete INTEGER NOT NULL,
    valorServicioPaquete DECIMAL(15,2),

    CONSTRAINT PK_idDetallePaqueteServicio PRIMARY KEY (idDetallePaqueteServicio),
    CONSTRAINT FK_idPackage FOREIGN KEY (idPaquete) REFERENCES paquete(idPaquete),
    CONSTRAINT FK_idService FOREIGN KEY (idServicio) REFERENCES servicio(idServicio),
    CONSTRAINT CHK_cantidadServicioPaquete CHECK (CAST(cantidadServicioPaquete AS TEXT) ~ '^[0-9]{2,}$'),
    CONSTRAINT CHK_valorServicioPaquete CHECK (CAST(valorServicioPaquete AS TEXT) ~ '^[1-9][0-9]*(\.[0-9]{1,2})?$')
);
SELECT * FROM detallePaqueteServicio;

DROP TABLE IF EXISTS programacion CASCADE;
CREATE TABLE  programacion (
    idProgramacion  SERIAL NOT NULL,
    fechaInicioInscripcion DATE NOT NULL,
    fechaFinInscripcion  DATE NOT NULL,
    fechaEjecucion  DATE NOT NULL,
    fechaFinalizacion DATE NOT NULL,
    horaInicioRecogida TIME NOT NULL,
    horaFinRecogida TIME NOT NULL,
    idPaquete INTEGER NOT NULL,

    CONSTRAINT PK_idProgramation PRIMARY KEY (idProgramacion),
    CONSTRAINT CHK_dateStart CHECK (fechaInicioInscripcion >= current_date),
    CONSTRAINT CHK_dateEnd CHECK (fechaFinInscripcion >= current_date + interval '7 days'),
    CONSTRAINT CHK_dateExecution CHECK (fechaEjecucion >= fechaFinInscripcion + interval '5 days'),
    CONSTRAINT CHK_dateEnding CHECK (fechaFinalizacion >= fechaEjecucion),
    CONSTRAINT CHK_hourStart CHECK (horaInicioRecogida >= '06:00:00' AND horaInicioRecogida <= '08:00:00'),
    CONSTRAINT FK_idPaquete FOREIGN KEY (idPaquete) REFERENCES paquete(idPaquete)
);
SELECT * FROM programacion;

DROP TABLE IF EXISTS reserva CASCADE;
CREATE TABLE reserva(
    idReserva SERIAL NOT NULL,
    idProgramacion INTEGER NOT NULL,
    idCliente INTEGER NOT NULL,
    fechaReserva DATE DEFAULT CURRENT_DATE,
    valorReserva DECIMAL(15,2) NOT NULL,
    estadoReserva CHAR NOT NULL,
    
    CONSTRAINT PK_idReserva PRIMARY KEY (idReserva),
    CONSTRAINT FK_idProgramacion FOREIGN KEY (idProgramacion) REFERENCES programacion(idProgramacion),
    CONSTRAINT FK_idCliente FOREIGN KEY (idCliente) REFERENCES cliente(idCliente),
    CONSTRAINT CHK_valorReserva CHECK (CAST(valorReserva AS TEXT) ~ '^[1-9][0-9]*(\.[0-9]{1,2})?$'),
	--ESTADO DE RESERVA: Pendiente(no pago), Confirmada(pago 50%), Pagada(pago completo), Modificada, Cancelada(retiro cliente), Anulada (dates), En curso y Finalizada
    CONSTRAINT CHK_estadoReservaReservation CHECK (estadoReserva ~ '^(N|C|P|M|R|A|E|F)$')
);
SELECT * FROM reserva;

DROP TABLE IF EXISTS detalleReservaViajero CASCADE;
CREATE TABLE detalleReservaViajero(
    idDetalleReservaViajero SERIAL NOT NULL,
    idReserva INTEGER NOT NULL,
    idCliente INTEGER NOT NULL,

    CONSTRAINT PK_idDetalleReservaViajero PRIMARY KEY (idDetalleReservaViajero),
    CONSTRAINT FK_idReserva FOREIGN KEY (idReserva) REFERENCES reserva(idReserva),
    CONSTRAINT FK_idCliente FOREIGN KEY (idCliente) REFERENCES cliente(idCliente)
);
SELECT * FROM detalleReservaViajero;

DROP TABLE IF EXISTS pago CASCADE;
CREATE TABLE pago ( 
    idPago SERIAL NOT NULL,
    idReserva INTEGER NOT NULL,
    fechaPago DATE DEFAULT CURRENT_DATE,
    valorPago DECIMAL(15,2) NOT NULL,
    comprobante VARCHAR(255) NOT NULL,
    estadoPago CHAR NOT NULL,

    CONSTRAINT PK_pago PRIMARY KEY (idPago), 
    CONSTRAINT FK_reservation FOREIGN KEY (idReserva) REFERENCES reserva(idReserva), 
    CONSTRAINT CHK_valorPago CHECK (CAST(valorPago AS TEXT) ~ '^[1-9][0-9]*(\.[0-9]{1,2})?$'),
	-- ESTADOS DE PAGO: REVISAR, PAGO, NO PAGO, ANULADO
	CONSTRAINT CHK_estadoPago CHECK (estadoPago ~ '^(R|P|N|A|)$')
);
SELECT * FROM pago;

-- DICTIONARY OF DATA
SELECT
    t1.TABLE_NAME AS tabla_nombre,
    t1.COLUMN_NAME AS columna_nombre,
    t1.COLUMN_DEFAULT AS columna_defecto,
    t1.IS_NULLABLE AS columna_nulo,
    t1.DATA_TYPE AS columna_tipo_dato,
    COALESCE(t1.NUMERIC_PRECISION,
    t1.CHARACTER_MAXIMUM_LENGTH) AS columna_longitud,
    PG_CATALOG.COL_DESCRIPTION(t2.OID,
    t1.DTD_IDENTIFIER::int) AS columna_descripcion,
    t1.DOMAIN_NAME AS columna_dominio
FROM 
    INFORMATION_SCHEMA.COLUMNS t1
    INNER JOIN PG_CLASS t2 ON (t2.RELNAME = t1.TABLE_NAME)
WHERE 
    t1.TABLE_SCHEMA = 'public'
ORDER BY
    t1.TABLE_NAME;