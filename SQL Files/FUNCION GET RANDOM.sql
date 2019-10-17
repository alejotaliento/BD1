delimiter $$

create function getRandom() returns int
BEGIN

declare numero int default FLOOR(RAND()*(999-0+1)+0);
declare finished integer default 0;
declare idVehiculoParametro int;

declare c1 cursor for select idVehiculo from vehiculo;

DECLARE CONTINUE HANDLER
        FOR NOT FOUND SET finished = 1;
        
        OPEN c1;
        
        getNumero: LOOP
 
        FETCH c1 INTO idVehiculoParametro;
 
        IF finished = 1 THEN
            LEAVE getNumero;
        END IF;
        
        IF numero = idVehiculoParametro THEN
			set numero = FLOOR(RAND()*(999-0+1)+0);
            ELSE
            LEAVE getNumero;
            END IF;
            
            END LOOP getNumero;
            
            CLOSE c1;
            
            return numero;

END $$