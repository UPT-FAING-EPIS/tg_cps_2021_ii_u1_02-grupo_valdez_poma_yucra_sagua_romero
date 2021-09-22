USE bdAsistencia
GO

--tabla trabajador
CREATE PROCEDURE SP_Trabajador_Listar
AS
   SELECT * FROM dbo.Trabajador
GO

CREATE PROCEDURE SP_Trabajador_Insertar
   @pnombre varchar(20),
   @papellido varchar(20),
   @pdni varchar(20),
   @prol varchar(30),
   @pclave varchar (5)

AS
   INSERT INTO dbo.Trabajador VALUES (@pnombre,@papellido,@pdni,@prol,@pclave)
GO

CREATE PROC SP_Trabajador_Modificar
   @ptrabajador_id int,
   @pnombre varchar(20),
   @papellido varchar(20),
   @pdni varchar(20),
   @prol varchar(30),
   @pclave varchar (5)

AS
   UPDATE dbo.Trabajador SET
       nombre=@pnombre,
	   apellido=@papellido,
	   dni=@pdni,
	   rol=@prol,
	   clave=@pclave

	WHERE Trabajador_id=@ptrabajador_id
GO


CREATE PROCEDURE SP_Trabajador_Eliminar
   @ptrabajador_id int
AS
   DELETE FROM dbo.Trabajador
   WHERE Trabajador_id=@ptrabajador_id
GO

CREATE PROCEDURE SP_Trabajador_EncontrarID
   @pdni varchar(50),
   @pclave varchar(10)
AS
   SELECT * FROM dbo.Trabajador
   WHERE dni=@pdni and clave=@pclave
GO



--Tabla Hoja--

CREATE PROCEDURE SP_Hoja_Insertar
   @pAsistencia_id int,
   @pTrabajador_id int,
   @pestado varchar(10),
   @phora varchar(30)
AS
   INSERT INTO dbo.Hoja VALUES (@pAsistencia_id,@pTrabajador_id,@pestado,@phora)
GO

CREATE PROC SP_Hoja_Asistir
   @pAsistencia_id int,
   @pTrabajador_id int,
   @phora varchar(30)
AS
   UPDATE dbo.Hoja SET
       estado='Asistio',
	   hora=@phora
	WHERE Asistencia_id=@pAsistencia_id and Trabajador_id=@pTrabajador_id
GO

CREATE PROCEDURE SP_Hoja_Verificar
   @pId_Asistencia int,
   @pId_Trabajador int
AS
   SELECT estado FROM dbo.Hoja
   WHERE Asistencia_id=@pId_Asistencia and Trabajador_id=@pId_Trabajador
GO




--Tabla Asistencia

CREATE PROCEDURE SP_Asistencia_Insertar
   @pfecha varchar(15),
   @phora varchar(10)
   
AS
   INSERT INTO dbo.Asistencia VALUES (@pfecha,@phora)
GO



CREATE PROCEDURE SP_Asistencia_Verificar
   @pfecha varchar(15)
   
AS
   SELECT * FROM dbo.Asistencia
   WHERE fecha=@pfecha
GO




CREATE PROCEDURE SP_Asistencia_FechaActual
AS
SELECT max(Asistencia_id) as 'Fecha Actual'
FROM dbo.Asistencia
GO

CREATE PROCEDURE SP_Asistencia_EncontrarFecha
   @pid int
   
AS
   SELECT * FROM dbo.Asistencia
   WHERE Asistencia_id=@pid
GO


CREATE PROCEDURE SP_Asistencia_BuscarFechaAlterna
@pbusqueda varchar(30)
AS
   SELECT Trabajador.nombre , Hoja.estado,Hoja.hora
   FROM Asistencia, Trabajador, Hoja
   WHERE Asistencia.fecha=@pbusqueda and Hoja.Asistencia_id = Asistencia.Asistencia_id and Hoja.Trabajador_id=Trabajador.Trabajador_id
GO











