-- **************************** ABM'S *******************************************

-- PROCEDURES PEDIDO
create procedure `pedido_alta` (id int, cantidad int, concesionaria int,out resultado int,out mensaje varchar(45))
BEGIN

declare nCantidad;
select count(*) into nCantidad from pedido where idPedido=id;

select nCantidad;

IF (nCantidad > 0) then
select -1 INTO resultado;
select "Encontro" into mensaje;

ELSE
insert into pedido values(id,cantidad,concesionaria,0);
select 0 into resultado;
select "Insertado correctamente" into mensaje;
END IF;

END;

call pedido_alta(1,3,)

create procedure pedido_baja(id int)
update pedido set eliminado=1, fechaEliminado=now() where idPedido=id;

create procedure pedido_modificacion(id int, cantidad int, concesionaria int)
update pedido set cantidad=cantidad,concesionaria=concesionaria where idPedido=id;


-- PROCEDURES CONCESIONARIA
create procedure concesionaria_alta(id int, nombre varchar(45), cuit int, ventas int)
insert into concesionaria values(id,nombre,cuit,ventas,0);

create procedure concesionaria_baja(id int)
update concesionaria set eliminado=1, fechaEliminado=now() where idConcesionaria=id;

create procedure concesionaria_modificacion(id int, nombre varchar(45), cuit int, ventas int)
update concesionaria set nombre=nombre, cuit=cuit, ventas=ventas where idConcesionaria=id;

-- PROCEDURES DETALLE_PEDIDO
create procedure detallePedido_alta(idModelo int, idPedido int)
insert into detalle_pedido values(idModelo,idPedido,0);

create procedure detallePedido_baja(idp int,idm int)
update detalle_pedido set eliminado=1, fechaEliminado=now() where idPedido=idp and idModelo=idm;

create procedure detallePedido_modificacion(idModelo int, idPedido int)
update detalle_pedido set idModelo=idModelo, idPedido=idPedido where idPedido=idPedido;

-- PROCEDURES PROVEEDOR
create procedure proveedor_alta(id int, nombre varchar(45),cuit int)
insert into proveedor values(id,nombre,cuit,0);

create procedure proveedor_baja(id int)
update proveedor set eliminado=1, fechaEliminado=now() where idProveedor=id;

create procedure proveedor_modificacion(id int, nombre varchar(45),cuit int)
update proveedor set nombre=nombre,cuit=cuit where idProveedor=id;


-- PROCEDURES INSUMOS
create procedure insumo_alta(id int, descripcion varchar(45))
insert into insumo values(id,descripcion,0);

create procedure insumo_baja(id int)
update insumo set eliminado=1, fechaEliminado=now() where idInsumo=id;

create procedure insumo_modificacion(id int, descripcion varchar(45))
update insumo set descripcion=descripcion where idInsumo=id;


-- PROCEDURES PROVEEDOR_INSUMO
create procedure proveedorInsumo_alta(idInsumo int, idProveedor int,precio double)
insert into insumo_x_proveedor values(idInsumo,idProveedor,precio,0);

create procedure proveedorInsumo_baja(idInsumo int, idProveedor int)
update insumo_x_proveedor set eliminado=1, fechaEliminado=now() where insumo_codigo=idInsumo and proveedor_idproveedor=idProveedor;

create procedure proveedorInsumo_modificacion(idInsumo int, idProveedor int,precio double)
update insumo_x_proveedor set precio=precio where insumo_codigo=idInsumo and proveedor_idproveedor=idProveedor; 



create procedure prueba(out nResultado int,out cMensaje varchar(45)) begin
declare nCantidad int;
select ncantidad=count(*);

-- @ es de salida


