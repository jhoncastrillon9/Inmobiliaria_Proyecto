/*Crear Base de datos*/

create database inmoBD_pruebas
GO
USe inmoBD_pruebas

/*Modulo de Propietarios*/
GO
create table propietarios(
Id int identity (1,1)  primary key NOT NULL,
Nombre varchar(200) not null,
Documento varchar(50),
Telefono varchar (30),
Celular varchar(30) not null,
Email varchar(80),
Direccion varchar (200),
Observacion varchar(500)
)
GO

Create Table CategoriaInmuebles(
Id int identity (1,1)  primary key NOT NULL,
Nombre varchar(200) not null
)
GO

GO
Create Table Municipios(
Id int Identity(1,1) primary key NOT NULL,
Nombre varchar(100) not null
)
GO

GO
Create Table ZonasMunicipios(
Id int identity (1,1)  primary key NOT NULL,
Nombre varchar(200) not null,
IdMunicipio int not null references Municipios(Id)
)
GO



Create Table Inmuebles(
Id Int Identity (1,1) primary key Not null,
Codigo Int,
Titulo varchar(100) not null,
Descripcion varchar(500),
Direccion varchar (200) not null,
Estado varchar (100) not null,
Llaves varchar (100) not null,
PrecioPropietario decimal(18,2) not null,
Porcentaje decimal(18,2) not null,
Honorarios decimal(18,2), 
FechaCaptacion date,
Iva decimal(18,2),
PrecioFinal decimal(18,2) not null,
Habitaciones Int,
Banos int,
Porteria bit,
Piscina bit,
Area Decimal(18,2),
IdMunicipio int not null references Municipios(Id),
IdZonaMunicipio int not null references ZonasMunicipios(Id),
IdPropietario Int Not null references propietarios(Id),
Observacion varchar(500),
IdCategoria Int Not null references CategoriaInmuebles(Id)
)
GO
Create Table Imagenes(
Id Int Identity (1,1) Primary Key Not null,
Nombre varchar(50),
Ruta varchar(150) not null,
IdInmueble Int not null References Inmuebles(Id)
)

/*Modulo de Arredadores*/
GO
Create Table Arrendatarios(
Id int identity (1,1)  primary key NOT NULL,
Nombre varchar(200) not null,
Documento varchar(50),
Telefono varchar (30),
Celular varchar(30) not null,
Email varchar(80),
Direccion varchar (200),
Observacion varchar(500)
)

/*Modulo de contrqtos de arrendamiento*/
GO
Create Table Contratos(
Id int identity(1,1) primary key not null ,
FechaContrato Date not null,
FechaInicio Date Not Null,
CantidadMeses Int Not Null,
ValorMensual decimal(18,2) not null,
Observacion varchar(300),
IdInmueble Int references Inmuebles(Id),
IdArrendatario int references Arrendatarios(id) not null,
IdCoArrendatario int references Arrendatarios(id),
IdFiador1 int references Arrendatarios(id),
IdFiador2 int references Arrendatarios(id)
)
GO
Create Table EstadosCuentas(
Id Int Identity(1,1) Primary Key Not Null,
Nombre Varchar (50)
)
GO
Create Table CuentasxPagarContratos(
Id Int Identity(1,1) primary key not null,
Numerocuota Int not null,
Valor Decimal(18,2) not null,
FechaVencimiento Date not null,
Estado int References EstadosCuentas(Id),
IdContrato Int References Contratos(Id) not null
)
GO
Create Table CuentasxCobrarContratos(
Id Int Identity(1,1) primary key not null,
Numerocuota Int not null,
Valor Decimal(18,2) not null,
FechaVencimiento Date not null,
Estado int References EstadosCuentas(Id),
IdContrato Int References Contratos(Id) not null
)
GO
/*Modulo de Pagos*/
Create Table CajaBanco(
Id Int Identity (1,1) Primary Key Not null,
Nombre Varchar(50) Not null,
)
GO
/*Tipos de pagos*/
Create Table TipoPago(
Id Int Identity (1,1) Primary Key Not null,
Nombre varchar(50) Not Null,
)
GO
Create Table RegistroIngresos(
Id Int Identity (1,1) Primary Key Not null,
Fecha Date Not null,
Tipo Int References TipoPago(Id) Not null,
Valor Decimal(18,2) Not Null,
Mora Decimal(18,2) Not Null,
Descuento Decimal(18,2) Not Null,
Iva Decimal(18,2) Not Null,
Total Decimal(18,2) Not Null,
IdCajaBanco Int References CajaBanco(Id) Not null,
IdCuentasxPagarContratos Int References CuentasxPagarContratos(Id),
IdCuentasxCobrarContratos Int References CuentasxCobrarContratos(Id) 
)
GO
Create Table RegistroEgresos(
Id Int Identity (1,1) Primary Key Not null,
Fecha Date Not null,
Tipo Int References TipoPago(Id) Not null,
Valor Decimal(18,2) Not Null,
Mora Decimal(18,2) Not Null,
Descuento Decimal(18,2) Not Null,
Iva Decimal(18,2) Not Null,
Total Decimal(18,2) Not Null,
IdCajaBanco Int References CajaBanco(Id) Not null,
IdCuentasxPagarContratos Int References CuentasxPagarContratos(Id),
IdCuentasxCobrarContratos Int References CuentasxCobrarContratos(Id) 
)
GO

/*Modulo de Usuarios*/
GO
Create Table RolesUsuarios(
Id Int Identity (1,1) Primary Key Not null,
Nombre Varchar(50)
)
GO
Create Table Usuarios(
Id Int Identity (1,1) Primary Key Not null,
Nombre Varchar(50),
Email Varchar(200) Not null,
Pass Varchar(50) Not null,
Rol Int References RolesUsuarios(Id) Not Null,
FechaAdd Date 
)