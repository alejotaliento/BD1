-- PEDIDO ALTA

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pedido_alta`(id int, concesionaria int, fecha datetime,out resultado int,out mensaje varchar(45))
BEGIN
declare nCantidad int;
select count(*) into nCantidad from pedido where idPedido=id;


IF (nCantidad > 0) then
select -1 INTO resultado;
select "Encontro" into mensaje;

ELSE
insert into pedido(idPedido,idConcesionaria,fecha,eliminado) values(id,concesionaria,fecha,0);
select 0 into resultado;
select " " into mensaje;
END IF;


END$$
DELIMITER ;

-- PEDIDO BAJA

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pedido_baja`(id int,out resultado int,out mensaje varchar(45))
BEGIN

declare nCantidad int;
select count(*) into nCantidad from pedido where idPedido=id;

IF (nCantidad > 0) then
select 0 INTO resultado;
select " " into mensaje;
update pedido set eliminado=1, fechaEliminado=now() where idPedido=id;
ELSE
select -1 into resultado;
select "No se encontro para eliminar" into mensaje;
END IF;



END$$
DELIMITER ;

-- PEDIDO MODIFICACION

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pedido_modificacion`(id int, concesionaria int, fecha datetime,out resultado int,out mensaje varchar(45))
BEGIN

declare nCantidad int;
select count(*) into nCantidad from pedido where idPedido=id;

IF (nCantidad > 0) then
select 0 INTO resultado;
select " " into mensaje;
update pedido set idConcesionaria=concesionaria, fecha=fecha where idPedido=id;
ELSE
select -1 into resultado;
select "No se encontro para modificar" into mensaje;
END IF;

END$$
DELIMITER ;

-- CONCESIONARIA ALTA

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `concesionaria_alta`(id int, nombre varchar(45), cuit int, ventas int, out resultado int,out mensaje varchar(45))
BEGIN

declare nCantidad int;
select count(*) into nCantidad from concesionaria where idConcesionaria=id;


IF (nCantidad > 0) then
select -1 INTO resultado;
select "Encontro" into mensaje;

ELSE
insert into concesionaria(idConcesionaria, nombre, cuit, ventas, eliminado) values(id,nombre,cuit,ventas,0);
select 0 into resultado;
select " " into mensaje;
END IF;

END$$
DELIMITER ;


-- CONCESIONARIA BAJA

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `concesionaria_baja`(id int, out resultado int,out mensaje varchar(45))
BEGIN

declare nCantidad int;
select count(*) into nCantidad from concesionaria where idConcesionaria=id;

IF (nCantidad > 0) then
select 0 INTO resultado;
select " " into mensaje;
update concesionaria set eliminado=1, fechaEliminado=now() where idConcesionaria=id;
ELSE
select -1 into resultado;
select "No se encontro para eliminar" into mensaje;
END IF;

END$$
DELIMITER ;


-- CONCESIONARIA MODIFICACION

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `concesionaria_modificacion`(id int, nombre varchar(45), cuit int, ventas int, out resultado int,out mensaje varchar(45))
BEGIN

declare nCantidad int;
select count(*) into nCantidad from concesionaria where idConcesionaria=id;

IF (nCantidad > 0) then
select 0 INTO resultado;
select " " into mensaje;
update concesionaria set nombre=nombre, cuit=cuit, ventas=ventas where idConcesionaria=id;
ELSE
select -1 into resultado;
select "No se encontro para modificar" into mensaje;
END IF;

END$$
DELIMITER ;


-- PROVEEDOR ALTA

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `proveedor_alta`(id int, nombre varchar(45),cuit int,out resultado int,out mensaje varchar(45))
BEGIN

declare nCantidad int;
select count(*) into nCantidad from proveedor where idProveedor=id;


IF (nCantidad > 0) then
select -1 INTO resultado;
select "Encontro" into mensaje;

ELSE
insert into proveedor(idProveedor,nombre,cuit,eliminado) values(id,nombre,cuit,0);
select 0 into resultado;
select " " into mensaje;
END IF;

END$$
DELIMITER ;


-- PROVEEDOR BAJA

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `proveedor_baja`(id int, out resultado int, out mensaje varchar(45))
BEGIN

declare nCantidad int;
select count(*) into nCantidad from proveedor where idProveedor=id;

IF (nCantidad > 0) then
select 0 INTO resultado;
select " " into mensaje;
update proveedor set eliminado=1, fechaEliminado=now() where idProveedor=id;
ELSE
select -1 into resultado;
select "No se encontro para eliminar" into mensaje;
END IF;

END$$
DELIMITER ;


-- PROVEEDOR MODIFICACION

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `proveedor_modificacion`(id int, nombre varchar(45),cuit int,out resultado int,out mensaje varchar(45))
BEGIN

declare nCantidad int;
select count(*) into nCantidad from proveedor where idProveedor=id;

IF (nCantidad > 0) then
select 0 INTO resultado;
select " " into mensaje;
update proveedor set nombre=nombre, cuit=cuit where idProveedor=id;
ELSE
select -1 into resultado;
select "No se encontro para modificar" into mensaje;
END IF;

END$$
DELIMITER ;


-- INSUMO ALTA

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insumo_alta`(id int, descripcion varchar(45),out resultado int,out mensaje varchar(45))
BEGIN

declare nCantidad int;
select count(*) into nCantidad from insumo where idInsumo=id;


IF (nCantidad > 0) then
select -1 INTO resultado;
select "Encontro" into mensaje;

ELSE
insert into insumo(idInsumo,descripcion,eliminado) values(id,descripcion,0);
select 0 into resultado;
select " " into mensaje;
END IF;

END$$
DELIMITER ;


-- INSUMO BAJA

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insumo_baja`(id int,out resultado int,out mensaje varchar(45))
BEGIN

declare nCantidad int;
select count(*) into nCantidad from insumo where idInsumo=id;

IF (nCantidad > 0) then
select 0 INTO resultado;
select " " into mensaje;
update insumo set eliminado=1, fechaEliminado=now() where idInsumo=id;
ELSE
select -1 into resultado;
select "No se encontro para eliminar" into mensaje;
END IF;

END$$
DELIMITER ;


-- INSUMO MODIFICACION

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insumo_modificacion`(id int, descripcion varchar(45),out resultado int,out mensaje varchar(45))
BEGIN

declare nCantidad int;
select count(*) into nCantidad from insumo where idInsumo=id;

IF (nCantidad > 0) then
select 0 INTO resultado;
select " " into mensaje;
update insumo set descripcion=descripcion where idInsumo=id;
ELSE
select -1 into resultado;
select "No se encontro para modificar" into mensaje;
END IF;

END$$
DELIMITER ;


-- DETALLE PEDIDO ALTA

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `detalle_pedido_alta`(idP int, idM int, cantidad int, out resultado int,out mensaje varchar(45))
BEGIN

declare nCantidad int;
select count(*) into nCantidad from detalle_pedido where idPedido=idP and idModelo=idM;


IF (nCantidad > 0) then
select -1 INTO resultado;
select "Encontro" into mensaje;

ELSE
insert into detalle_pedido(idPedido,idModelo,cantidad,eliminado) values(idP,idM,cantidad,0);
select 0 into resultado;
select " " into mensaje;
END IF;

END$$
DELIMITER ;



-- DETALLE PEDIDO BAJA

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `detalle_pedido_baja`(idP int, idM int, out resultado int,out mensaje varchar(45))
BEGIN

declare nCantidad int;
select count(*) into nCantidad from detalle_pedido where idPedido=idP and idModelo=idM;

IF (nCantidad > 0) then
select 0 INTO resultado;
select " " into mensaje;
update detalle_pedido set eliminado=1, fechaEliminado=now() where idPedido=id and idModelo=idM;
ELSE
select -1 into resultado;
select "No se encontro para eliminar" into mensaje;
END IF;

END$$
DELIMITER ;



-- DETALLE PEDIDO MODIFICACION

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `detalle_pedido_modificacion`(idP int, idM int, cantidad int, out resultado int,out mensaje varchar(45))
BEGIN

declare nCantidad int;
select count(*) into nCantidad from detalle_pedido where idPedido=idP;

IF (nCantidad > 0) then
select 0 INTO resultado;
select " " into mensaje;
update detalle_pedido set idModelo=idM, cantidad=cantidad where idPedido=idP;
ELSE
select -1 into resultado;
select "No se encontro para modificar" into mensaje;
END IF;

END$$
DELIMITER ;



-- INSUMO PROVEEDOR ALTA

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insumo_proveedor_alta`(idI int,idP int,precio double,out resultado int,out mensaje varchar(45))
BEGIN

declare nCantidad int;
select count(*) into nCantidad from insumo_x_proveedor where idInsumo=idI and idProveedor=idP;


IF (nCantidad > 0) then
select -1 INTO resultado;
select "Encontro" into mensaje;

ELSE
insert into insumo_x_proveedor(idInsumo,idProveedor,precio,eliminado) values(idI,idP,precio,0);
select 0 into resultado;
select " " into mensaje;
END IF;

END$$
DELIMITER ;



-- INSUMO PROVEEDOR BAJA

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insumo_proveedor_baja`(idI int, idP int, out resultado int, out mensaje varchar(45))
BEGIN

declare nCantidad int;
select count(*) into nCantidad from insumo_x_proveedor where idProveedor=id and idInsumo=idI;

IF (nCantidad > 0) then
select 0 INTO resultado;
select " " into mensaje;
update insumo_x_proveedor set eliminado=1, fechaEliminado=now() where idProveedor=idP and idInsumo=idI;
ELSE
select -1 into resultado;
select "No se encontro para eliminar" into mensaje;
END IF;

END$$
DELIMITER ;



-- INSUMO PROVEEDOR MODIFICACION

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insumo_proveedor_modificacion`(idI int,idP int,precio double,out resultado int,out mensaje varchar(45))
BEGIN

declare nCantidad int;
select count(*) into nCantidad from insumo_x_proveedor where idInsumo=idI and idProveedor=idP;

IF (nCantidad > 0) then
select 0 INTO resultado;
select " " into mensaje;
update insumo_x_proveedor set precio=precio where idInsumo=idI and idProveedor=idP;
ELSE
select -1 into resultado;
select "No se encontro para modificar" into mensaje;
END IF;

END$$
DELIMITER ;