DELIMITER $$

create procedure finalizarEstacion (patente int, out resultado int, out mensaje varchar(45))
BEGIN

DECLARE finished INT DEFAULT 0;
DECLARE fecha_egresoProcedure DATETIME;
DECLARE idEstacionAUX int;
DECLARE contador int default 0;

DECLARE c1 CURSOR FOR SELECT ev.fecha_egreso, ev.idEstacion FROM estacion_x_vehiculo ev inner join vehiculo v on ev.idVehiculo=v.idVehiculo
where v.detalle_pedido_idModelo=(SELECT detalle_pedido_idModelo from vehiculo where idVehiculo=patente);

DECLARE CONTINUE HANDLER
        FOR NOT FOUND SET finished = 1;

SET @idEstacionProcedure=(SELECT idEstacion FROM estacion_x_vehiculo where idVehiculo=patente and fecha_egreso IS NULL)+4;
SET @idVehiculoProcedure:=(SELECT idVehiculo from vehiculo where idVehiculo=patente);

OPEN c1;

getEstacionVehiculo: LOOP

FETCH c1 INTO fecha_egresoProcedure, idEstacionAUX;

 IF finished = 1 THEN
            LEAVE getEstacionVehiculo;
        END IF;
        
			
            IF idEstacionAUX = @idEstacionProcedure AND fecha_egresoProcedure IS NULL THEN
				SET contador=contador+1;
			END IF;
            

END LOOP getEstacionVehiculo;

 IF contador = 0 THEN
            update estacion_x_vehiculo set fecha_egreso=now() where idVehiculo=patente and fecha_egreso IS NULL;
			INSERT INTO estacion_x_vehiculo (fecha_ingreso,idEstacion,idVehiculo,eliminado) 
			values (now(),@idEstacionProcedure,@idVehiculoProcedure,0);
            
            ELSE 
            select -1 into resultado;
			select "NO SE PUEDE AVANZAR" into mensaje;
				END IF;

CLOSE c1;


END $$