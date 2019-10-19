delimiter $$

create procedure iniciarMontajeV2(patente int, out resultado int, out mensaje varchar(45))
BEGIN

-- MODELO DEL AUTO SEGUN SU PATENTE

SET @modeloProcedure:=(SELECT detalle_pedido_idModelo from vehiculo where idVehiculo=patente);

-- PATENTE DEL VEHICULO

SET @idVehiculoProcedure:=(SELECT idVehiculo from vehiculo where idVehiculo=patente);

-- PRIMERA ESTACION EN LA CUAL PONDREMOS EL VEHICULO A CONSTRUIR

SET @idEstacionProcedure:=(select e.idEstacion from estacion e inner join montaje m on e.idMontaje=m.idMontaje where m.idModelo=@modeloProcedure and orden=1);

-- BUSCA LA CANTIDAD DE VEHICULOS DEL MISMO MODELO QUE TODAVIA SIGAN EN LA PRIMER ESTACION

SET @cantidad:=(select count(*) from estacion_x_vehiculo ev inner join estacion e on ev.idEstacion=e.idEstacion 
inner join vehiculo v on ev.idVehiculo=v.idVehiculo where e.orden=1 and ev.fecha_egreso IS NULL 
and v.detalle_pedido_idModelo=(SELECT detalle_pedido_idModelo from vehiculo where idVehiculo=patente));

-- CONDICIONAL PARA VER SI SE PUEDE INGRESAR EL VEHICULO

IF @cantidad=0 THEN
update estacion_x_vehiculo set fecha_egreso=now() where idVehiculo=patente;
			INSERT INTO estacion_x_vehiculo (fecha_ingreso,idEstacion,idVehiculo,eliminado) 
			values (now(),@idEstacionProcedure,@idVehiculoProcedure,0);
            select 0 into resultado;
            select "-" into mensaje;
            select @resultado,@mensaje;
            
            ELSE 
            select -1 into resultado;
			select "NO SE PUEDE AVANZAR" into mensaje;
            select @resultado,@mensaje,@idVehiculoProcedure as Patente;
				END IF;


END $$