CREATE DATABASE bdAsistencia
GO

USE bdAsistencia
GO
--Tabla Asistencia

if(not exists(select 1 from sys.tables WHERE name = 'Asistencia'))
CREATE TABLE dbo.Asistencia(
Asistencia_id int identity(1,1) NOT NULL,
fecha varchar (15) NOT NULL,
hora varchar(10) NOT NULL,
PRIMARY KEY (Asistencia_id)
)
GO

--Tabla Trabajor

if(not exists(select 1 from sys.tables WHERE name = 'Trabajador'))
CREATE TABLE dbo.Trabajador(
Trabajador_id int identity(1,1) NOT NULL,
nombre varchar (20) NOT NULL,
apellido varchar (20) NOT NULL,
dni varchar (20) NOT NULL UNIQUE,
rol varchar (30) NOT NULL,
clave varchar (5) NOT NULL,

PRIMARY KEY (Trabajador_id)
)
GO


--Tabla Hoja
if(not exists(select 1 from sys.tables WHERE name = 'Hoja'))
CREATE TABLE dbo.Hoja(
Asistencia_id int NOT NULL,
Trabajador_id int NOT NULL,
estado Varchar(10) NOT NULL,
hora varchar(30) NOT NULL,

PRIMARY KEY (Asistencia_id,Trabajador_id),
FOREIGN KEY(Asistencia_id) REFERENCES Asistencia,
FOREIGN KEY(Trabajador_id) REFERENCES Trabajador
)
GO


