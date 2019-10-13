delimiter $$
create procedure generarVehiculo(idPedidoParametro int)
BEGIN

DECLARE finished INTEGER DEFAULT 0;
DECLARE idModeloParametro INTEGER;
DECLARE nCantidadDetalle INT; 
DECLARE idVehiculoProcedure INT;

DECLARE finished2 INTEGER DEFAULT 0;
DECLARE idMontajeProcedure int;
DECLARE idEstacionContador int default 0;
 
DECLARE nInsertados INT;

DECLARE curDetallePedido
        CURSOR FOR
            SELECT idModelo, cantidad FROM detalle_pedido WHERE idPedido = idPedidoParametro;
            
DECLARE c2 CURSOR FOR SELECT idMontaje FROM estacion;          
            
  DECLARE CONTINUE HANDLER
        FOR NOT FOUND SET finished = 1;
        


        

        
        OPEN curDetallePedido;
        


-- Aca comienzo el loop recorriendo el cursor.
    getDetalle: LOOP
 
        FETCH curDetallePedido INTO idModeloParametro, nCantidadDetalle;
 
        IF finished = 1 THEN
            LEAVE getDetalle;
        END IF;
 
	SET nInsertados = 0;
 
	-- Aca loopeo para hacer N inserts.
	WHILE nInsertados < nCantidadDetalle DO
    
    SET idVehiculoProcedure = getRandom();
 
	INSERT INTO Vehiculo (idVehiculo,numeroChasis, eliminado, detalle_pedido_idPedido, detalle_pedido_idModelo)VALUES (idVehiculoProcedure,lpad(conv(floor(rand()*pow(36,6)), 10, 36), 6, 0),0,idPedidoParametro, idModeloParametro);
	
    OPEN c2;
    
    
     getEstacion: LOOP
        
        FETCH c2 INTO idMontajeProcedure;
        
        IF finished = 1 THEN
            LEAVE getEstacion;
        END IF;
        
        WHILE idEstacionContador < 5 DO
        
        IF idMontajeProcedure = idModeloParametro THEN
        
        INSERT INTO estacion_x_vehiculo (fecha_ingreso,idEstacion,idVehiculo,eliminado) values (now(),idMontajeProcedure,idVehiculoProcedure,0);
        LEAVE getEstacion;
		
        END IF;
        
		SET idEstacionContador = idEstacionContador + 1;
        
        END WHILE;
        
        END LOOP getEstacion;
        
        CLOSE c2;
    
    
 
SET nInsertados = nInsertados  +1;
 
	END WHILE;
 
    END LOOP getDetalle;
 
-- Elimino el cursor de memoria
 
    CLOSE curDetallePedido;

END $$