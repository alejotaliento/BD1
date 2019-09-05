-- **************************** ABM'S *******************************************

-- PROCEDURES PEDIDO
create procedure pedido_alta(id int, cantidad int, concesionaria int)
insert into pedido values(id,cantidad,concesionaria);

create procedure pedido_baja(id int)
delete from pedido where idPedido=id;

create procedure pedido_modificacion(id int, cantidad int, concesionaria int)
update pedido set cantidad=cantidad,concesionaria=concesionaria where idPedido=id;


-- PROCEDURES CONCESIONARIA
create procedure concesionaria_alta(id int, nombre varchar(45), cuit int, ventas int)
insert into concesionaria values(id,nombre,cuit,ventas);

create procedure concesionaria_baja(id int)
delete from concesionaria where idConcesionaria=id;

create procedure concesionaria_modificacion(id int, nombre varchar(45), cuit int, ventas int)
update concesionaria set nombre=nombre, cuit=cuit, ventas=ventas where idConcesionaria=id;

-- PROCEDURES DETALLE_PEDIDO
create procedure detallePedido_alta(idModelo int, idPedido int)
insert into detalle_pedido values(idModelo,idPedido);

create procedure detallePedido_baja(idPedido int)
delete from detalle_pedido where idPedido=idPedido;

create procedure detallePedido_modificacion(idModelo int, idPedido int)
update detalle_pedido set idModelo=idModelo, idPedido=idPedido where idPedido=idPedido;

-- PROCEDURES PROVEEDOR
create procedure proveedor_alta(id int, nombre varchar(45),cuit int)
insert into proveedor values(id,nombre,cuit);

create procedure proveedor_baja(id int)
delete from proveedor where idProveedor=id;

create procedure proveedor_modificacion(id int, nombre varchar(45),cuit int)
update proveedor set nombre=nombre,cuit=cuit where idProveedor=id;


-- PROCEDURES INSUMOS
create procedure insumo_alta(id int, descripcion varchar(45),codigo int)
insert into insumo values(id,descripcion,codigo);

create procedure insumo_baja(id int)
delete from insumo where idInsumo=id;

create procedure insumo_modificacion(id int, descripcion varchar(45),codigo int)
update insumo set descripcion=descripcion,codigo=codigo where idInsumo=id;


-- PROCEDURES PROVEEDOR_INSUMO
create procedure proveedorInsumo_alta(idInsumo int, idProveedor int,precio double)
insert into insumo_x_proveedor values(idInsumo,idProveedor,precio);

create procedure proveedorInsumo_baja(idInsumo int, idProveedor int)
delete from insumo_x_proveedor where insumo_codigo=idInsumo and proveedor_idproveedor=idProveedor;

create procedure proveedorInsumo_modificacion(idInsumo int, idProveedor int,precio double)
update insumo_x_proveedor set precio=precio where insumo_codigo=idInsumo and proveedor_idproveedor=idProveedor; 
