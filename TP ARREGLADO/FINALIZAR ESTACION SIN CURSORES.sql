delimiter $$

create procedure finalizarEstacionV2(patente int, out resultado int, out mensaje varchar(45))
BEGIN

-- MODELO DEL AUTO SEGUN SU PATENTE

SET @modeloProcedure:=(SELECT detalle_pedido_idModelo from vehiculo where idVehiculo=patente);

-- EL ORDEN ACTUAL DE LA ESTACION DEL AUTO

SET @ordenProcedure:=(select e.orden from estacion_x_vehiculo ev inner join estacion e
 on ev.idEstacion=e.idEstacion inner join montaje m on e.idMontaje=m.idMontaje
 where m.idModelo=@modeloProcedure and idVehiculo=patente and ev.fecha_ingreso IS NOT NULL AND ev.fecha_egreso IS NULL);

-- ID DE LA PROXIMA ESTACION EN LA CUAL TENDRIA QUE INGRESAR

SET @idEstacionProcedure:=(select e.idEstacion from estacion e inner join montaje m on e.idMontaje=m.idMontaje
 where m.idModelo=@modeloProcedure and orden=@ordenProcedure+1);

-- PATENTE DEL VEHICULO

SET @idVehiculoProcedure:=(SELECT idVehiculo from vehiculo where idVehiculo=patente);

-- BUSCA LA CANTIDAD DE VEHICULOS QUE SE ENCUENTRAN EN LA PROXIMA ESTACION

SET @cantidad:=(select count(*) from estacion_x_vehiculo ev inner join estacion e on ev.idEstacion=e.idEstacion 
inner join vehiculo v on ev.idVehiculo=v.idVehiculo where e.orden=@ordenProcedure+1 and ev.fecha_egreso IS NULL 
and v.detalle_pedido_idModelo=(SELECT detalle_pedido_idModelo from vehiculo where idVehiculo=patente));

-- CONDICIONAL PARA VER SI INGRESA EL VEHICULO

IF @cantidad=0 and @idEstacionProcedure IS NOT NULL THEN
update estacion_x_vehiculo ev inner join estacion e on ev.idEstacion=e.idEstacion set fecha_egreso=now() where idVehiculo=patente and e.orden=@ordenProcedure;
			INSERT INTO estacion_x_vehiculo (fecha_ingreso,idEstacion,idVehiculo,eliminado) 
			values (now(),@idEstacionProcedure,@idVehiculoProcedure,0);
            select 0 into resultado;
            select "-" into mensaje;
            select @resultado,@mensaje,@idVehiculoProcedure as Patente;
            
            ELSE IF @idEstacionProcedure IS NULL THEN
            update estacion_x_vehiculo ev inner join estacion e on ev.idEstacion=e.idEstacion set fecha_egreso=now() where idVehiculo=patente and e.orden=@ordenProcedure;
            update vehiculo set fechaFinalizacion=now() where idVehiculo=patente;
            
            select "AUTOMOVIL FINALIZADO" into mensaje;
            select @mensaje;
            ELSE
            select -1 into resultado;
			select "NO SE PUEDE AVANZAR" into mensaje;
            select @resultado,@mensaje,@idVehiculoProcedure as Patente;
				END IF;
                END IF;
                



END $$