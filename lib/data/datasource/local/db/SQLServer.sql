--CREATE DATABASE hermes COLLATE SQL_Latin1_General_CP1_CI_AS;
USE hermes;

DROP TABLE IF EXISTS permiso;
CREATE TABLE permiso(
    idPermiso INT IDENTITY(1,1) NOT NULL,
    nombrePermiso VARCHAR(60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    estadoPermiso BIT NOT NULL DEFAULT 1,

    CONSTRAINT PK_idPermiso PRIMARY KEY (idPermiso),
    CONSTRAINT uc_nombrePermiso UNIQUE (nombrePermiso)
);

DROP TABLE IF EXISTS privilegio;
CREATE TABLE privilegio(
    idPrivilegio INT IDENTITY(1,1) NOT NULL,
    nombrePrivilegio VARCHAR(60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    idPermiso INT NOT NULL,

    CONSTRAINT PK_idPrivilegio PRIMARY KEY (idPrivilegio),
    CONSTRAINT FK_idPermiso FOREIGN KEY (idPermiso) REFERENCES permiso(idPermiso) ON DELETE CASCADE,
    CONSTRAINT uc_nombrePrivilegio UNIQUE (nombrePrivilegio)
);

DROP TABLE IF EXISTS rol  ;
CREATE TABLE rol(
    idRol INT IDENTITY(1,1) NOT NULL,
    nombreRol VARCHAR(60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    estadoRol BIT NOT NULL DEFAULT 1,
	
    CONSTRAINT PK_idRol PRIMARY KEY (idRol),
    CONSTRAINT UC_nombreRol UNIQUE (nombreRol)
);

DROP TABLE IF EXISTS rolPrivilegio  ;
CREATE TABLE rolPrivilegio(
    idRolPrivilegio INT IDENTITY(1,1) NOT NULL,
    idRol INT NOT NULL,
    idPrivilegio INT NOT NULL,
    
    CONSTRAINT PK_idRolPrivilegio PRIMARY KEY (idRolPrivilegio),
    CONSTRAINT FK_idRol FOREIGN KEY (idRol) REFERENCES rol(idRol) ON DELETE CASCADE,
    CONSTRAINT FK_idPrivilegio FOREIGN KEY (idPrivilegio) REFERENCES privilegio(idPrivilegio) ON DELETE CASCADE
);

DROP TABLE IF EXISTS usuario  ;
CREATE TABLE usuario( 
    idUsuario INT IDENTITY(1,1) NOT NULL,
    idRol INT NOT NULL,
    tipoDocumento VARCHAR(5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    identificacion VARCHAR(60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    nombre VARCHAR(255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    apellido VARCHAR(255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    correo VARCHAR(255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    contrasenha VARCHAR(255) NOT NULL,
    estadoUsuario BIT NOT NULL DEFAULT 1,

    CONSTRAINT PK_idUsuario PRIMARY KEY (idUsuario),
    CONSTRAINT FK_idRolUsuario FOREIGN KEY (idRol) REFERENCES rol(idRol) ON DELETE CASCADE,
    CONSTRAINT CHK_tipoDocumento CHECK (tipoDocumento IN ('CC', 'CE', 'PA', 'SC', 'CD', 'TE', 'PEP', 'AS', 'DU', 'CCEX', 'CEEX', 'PAEX', 'SCEX', 'CDEX', 'TEX', 'RNEX', 'PEPEX', 'ASEX'))
);

DROP TABLE IF EXISTS pais  ;
CREATE TABLE pais(
    idPais INT IDENTITY(1,1) NOT NULL,
    codigoPais INT NOT NULL,
    nombrePais VARCHAR(60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,

    CONSTRAINT PK_idPais PRIMARY KEY (idPais),
    CONSTRAINT CHK_codigoPais CHECK (codigoPais >= 0),
    CONSTRAINT UC_codigoPais UNIQUE (codigoPais),
    CONSTRAINT UC_nombrePais UNIQUE (nombrePais)
);

DROP TABLE IF EXISTS departamento  ;
CREATE TABLE departamento(
    idDepartamento INT IDENTITY(1,1) NOT NULL,
    codigoDepartamento INT NOT NULL,
    nombreDepartamento VARCHAR(60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    idPais INT NOT NULL,

    CONSTRAINT PK_idDepartamento PRIMARY KEY (idDepartamento),
    CONSTRAINT CHK_codigoDepartamento CHECK ( codigoDepartamento  >= 0),
    CONSTRAINT UC_codigoDepartamento UNIQUE (codigoDepartamento),
    CONSTRAINT UC_nombreDepartamento UNIQUE (nombreDepartamento),
    CONSTRAINT FK_idPais FOREIGN KEY (idPais) REFERENCES pais(idPais) ON DELETE CASCADE
);

DROP TABLE IF EXISTS municipio  ;
CREATE TABLE municipio(
    idMunicipio INT IDENTITY(1,1) NOT NULL,
    codigoMunicipio INT NOT NULL,
    nombreMunicipio VARCHAR(60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    idDepartamento INT NOT NULL,

    CONSTRAINT PK_idMunicipio PRIMARY KEY (idMunicipio),
    CONSTRAINT CHK_codigoMunicipio CHECK ( codigoMunicipio  >= 0),
    CONSTRAINT UC_codigoMunicipio UNIQUE (codigoMunicipio),
    CONSTRAINT UC_nombreMunicipio UNIQUE (nombreMunicipio),
    CONSTRAINT FK_idDepartamento FOREIGN KEY (idDepartamento) REFERENCES departamento(idDepartamento) ON DELETE CASCADE
);

DROP TABLE IF EXISTS cliente  ;
CREATE TABLE cliente(
    idCliente INT IDENTITY(1,1) NOT NULL,
    idUsuario INT NOT NULL,
    numeroContacto VARCHAR(15) NOT NULL,
    direccion VARCHAR(40) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    idMunicipio INT NOT NULL,
    sexo CHAR NOT NULL,
    tipoDeSangre VARCHAR(3) NOT NULL,
    eps VARCHAR(60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    estadoCliente BIT NOT NULL DEFAULT 1,
    
    CONSTRAINT PK_idCliente PRIMARY KEY (idCliente),
    CONSTRAINT FK_idUsuario FOREIGN KEY (idUsuario) REFERENCES usuario(idUsuario) ON DELETE CASCADE,
    CONSTRAINT FK_idMunicipio FOREIGN KEY (idMunicipio) REFERENCES municipio(idMunicipio) ON DELETE CASCADE,
    CONSTRAINT CHK_sexo CHECK (sexo IN ('H', 'M')),
    CONSTRAINT CHK_tipoDeSangre CHECK (tipoDeSangre IN ('A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-')),
);

DROP TABLE IF EXISTS actividad  ;
CREATE TABLE actividad(
    idActividad INT IDENTITY(1,1) NOT NULL,
    nombreActividad VARCHAR(60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,

    CONSTRAINT PK_idActividad PRIMARY KEY (idActividad),
    CONSTRAINT UC_nombreActividad UNIQUE (nombreActividad)
);

DROP TABLE IF EXISTS categoriaServicio  ;
CREATE TABLE categoriaServicio(
    idCategoriaServicio INT IDENTITY(1,1) NOT NULL,
    nombreCategoriaServicio VARCHAR(60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,

    CONSTRAINT PK_categoriaServicio PRIMARY KEY (idCategoriaServicio),
    CONSTRAINT UC_nombreCategoriaServicio UNIQUE (nombreCategoriaServicio)
);

DROP TABLE IF EXISTS servicio  ;
CREATE TABLE servicio(
    idServicio INT IDENTITY(1,1) NOT NULL,
    idCategoriaServicio INT NOT NULL,
    nombreServicio VARCHAR(60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    valorServicio DECIMAL(15,2) NOT NULL,
    estadoServicio BIT NOT NULL DEFAULT 1,
    
    CONSTRAINT PK_Service PRIMARY KEY (idServicio),
    CONSTRAINT UC_nombreServicio UNIQUE (nombreServicio),
    CONSTRAINT FK_categoryService FOREIGN KEY (idCategoriaServicio) REFERENCES categoriaServicio(idCategoriaServicio) ON DELETE CASCADE,
    CONSTRAINT CHK_valorServicio CHECK (valorServicio > 0)
);

DROP TABLE IF EXISTS paquete  ;
CREATE TABLE  paquete (
    idPaquete INT IDENTITY(1,1) NOT NULL,
    nombrePaquete  VARCHAR (60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
    idMunicipio INT NOT NULL,
    idActividad INT NOT NULL,
    nivelActividad DECIMAL(2,1) NOT NULL,
    inversionPaquete DECIMAL(15,2) NOT NULL,
    reservaPaquete DECIMAL(15,2) NOT NULL,
    
    CONSTRAINT PK_paquete PRIMARY KEY (idPaquete),
    CONSTRAINT FK_idMunicipioPaquete FOREIGN KEY (idMunicipio) REFERENCES municipio(idMunicipio) ON DELETE CASCADE,
    CONSTRAINT FK_idActividadPaquete FOREIGN KEY (idActividad) REFERENCES actividad(idActividad) ON DELETE CASCADE,
    CONSTRAINT CHK_nivelActividad CHECK  (nivelActividad >= 0),
    CONSTRAINT CHK_inversionPaquete CHECK  (inversionPaquete > 0),
    CONSTRAINT CHK_reservaPaquete CHECK  (reservaPaquete >= 0)
);

DROP TABLE IF EXISTS detallePaqueteServicio  ;
CREATE TABLE detallePaqueteServicio(
    idDetallePaqueteServicio INT IDENTITY(1,1) NOT NULL,
    idPaquete INT NOT NULL,
    idServicio INT NOT NULL,
    cantidadServicioPaquete INT NOT NULL,
    valorServicioPaquete DECIMAL(15,2),

    CONSTRAINT PK_idDetallePaqueteServicio PRIMARY KEY (idDetallePaqueteServicio),
    CONSTRAINT FK_idPackage FOREIGN KEY (idPaquete) REFERENCES paquete(idPaquete) ON DELETE CASCADE,
    CONSTRAINT FK_idService FOREIGN KEY (idServicio) REFERENCES servicio(idServicio) ON DELETE CASCADE,
    CONSTRAINT CHK_cantidadServicioPaquete CHECK (cantidadServicioPaquete > 0),
    CONSTRAINT CHK_valorServicioPaquete CHECK (valorServicioPaquete > 0)
);

DROP TABLE IF EXISTS programacion  ;
CREATE TABLE  programacion (
    idProgramacion  INT IDENTITY(1,1) NOT NULL,
    fechaInicioInscripcion DATE NOT NULL,
    fechaFinInscripcion  DATE NOT NULL,
    fechaEjecucion  DATE NOT NULL,
    fechaFinalizacion DATE NOT NULL,
    horaInicioRecogida TIME NOT NULL,
    horaFinRecogida TIME NOT NULL,
    idPaquete INT NOT NULL,

    CONSTRAINT PK_idProgramation PRIMARY KEY (idProgramacion),
    CONSTRAINT FK_idPaquete FOREIGN KEY (idPaquete) REFERENCES paquete(idPaquete) ON DELETE CASCADE
);

DROP TABLE IF EXISTS reserva  ;
CREATE TABLE reserva(
    idReserva INT IDENTITY(1,1) NOT NULL,
    idProgramacion INT NOT NULL,
    idCliente INT NOT NULL,
    fechaReserva DATE,
    valorReserva DECIMAL(15,2) NOT NULL,
    estadoReserva CHAR NOT NULL,
    
    CONSTRAINT PK_idReserva PRIMARY KEY (idReserva),
    CONSTRAINT FK_idProgramacion FOREIGN KEY (idProgramacion) REFERENCES programacion(idProgramacion) ON DELETE CASCADE,
    CONSTRAINT FK_idCliente FOREIGN KEY (idCliente) REFERENCES cliente(idCliente),
    CONSTRAINT CHK_valorReserva CHECK ( valorReserva > 0),
	--ESTADO DE RESERVA: Pendiente(no pago), Confirmada(pago 50%), Pagada(pago completo), Modificada, Cancelada(retiro cliente), Anulada (dates), En curso y Finalizada
    CONSTRAINT CHK_estadoReservaReservation CHECK (estadoReserva IN ('N', 'C', 'P', 'M', 'R', 'A', 'E', 'F'))
);

DROP TABLE IF EXISTS detalleReservaViajero  ;
CREATE TABLE detalleReservaViajero(
    idDetalleReservaViajero INT IDENTITY(1,1) NOT NULL,
    idReserva INT NOT NULL,
    idCliente INT NOT NULL,

    CONSTRAINT PK_idDetalleReservaViajero PRIMARY KEY (idDetalleReservaViajero),
    CONSTRAINT FK_idReserva FOREIGN KEY (idReserva) REFERENCES reserva(idReserva) ON DELETE CASCADE,
    CONSTRAINT FK_idClienteReservaViajero FOREIGN KEY (idCliente) REFERENCES cliente(idCliente)
);

DROP TABLE IF EXISTS pago  ;
CREATE TABLE pago ( 
    idPago INT IDENTITY(1,1) NOT NULL,
    idReserva INT NOT NULL,
    fechaPago DATE,
    valorPago DECIMAL(15,2) NOT NULL,
    comprobante VARCHAR(255) NOT NULL,
    estadoPago CHAR NOT NULL,

    CONSTRAINT PK_pago PRIMARY KEY (idPago), 
    CONSTRAINT FK_reservation FOREIGN KEY (idReserva) REFERENCES reserva(idReserva) ON DELETE CASCADE, 
    CONSTRAINT CHK_valorPago CHECK ( valorPago > 0),
	-- ESTADOS DE PAGO: REVISAR, PAGO, NO PAGO, ANULADO
	CONSTRAINT CHK_estadoPago CHECK (estadoPago IN ('R', 'P', 'N', 'A'))
);