-- INSERT MODELO

insert into modelo (idModelo,nombre,eliminado) values (1,"Renault Clio",0);
insert into modelo (idModelo,nombre,eliminado) values (2,"Renault Sandero",0);
insert into modelo (idModelo,nombre,eliminado) values (3,"Renault Megane 3",0);
insert into modelo (idModelo,nombre,eliminado) values (4,"Renault Logan",0);

-- INSERT CONCESIONARIA

insert into concesionaria (idConcesionaria,nombre,cuit,ventas,eliminado) values (1,"Strianese",3011111,0,0);
insert into concesionaria (idConcesionaria,nombre,cuit,ventas,eliminado) values (2,"Concesionaria Renault",3022222,0,0);
insert into concesionaria (idConcesionaria,nombre,cuit,ventas,eliminado) values (3,"Autofoco",3033333,0,0);

-- INSERT PEDIDOS

insert into pedido (idPedido,idConcesionaria,fecha,eliminado) values (1,1,'2019-10-03 10:00:00',0);
insert into detalle_pedido (idPedido,idModelo,cantidad,eliminado) values (1,1,5,0);
insert into detalle_pedido (idPedido,idModelo,cantidad,eliminado) values (1,2,4,0);

insert into pedido (idPedido,idConcesionaria,fecha,eliminado) values (2,3,'2019-10-4 14:00:00',0);
insert into detalle_pedido (idPedido,idModelo,cantidad,eliminado) values (2,3,6,0);
insert into detalle_pedido (idPedido,idModelo,cantidad,eliminado) values (2,4,3,0);

-- INSERT MONTAJE

insert into montaje (idMontaje, idModelo, eliminado) values (1,1,0); -- CLIO
insert into montaje (idMontaje, idModelo, eliminado) values (2,2,0); -- SANDERO
insert into montaje (idMontaje, idModelo, eliminado) values (3,3,0); -- MEGANE
insert into montaje (idMontaje, idModelo, eliminado) values (4,4,0); -- LOGAN

-- INSERT ESTACION
-- ESTACION NUMERO 0
insert into estacion (idEstacion, tarea, idMontaje, orden, eliminado) values (1,"ESTADO INICIAL",1,0,0);
insert into estacion (idEstacion, tarea, idMontaje, orden, eliminado) values (2,"ESTADO INICIAL",2,0,0);
insert into estacion (idEstacion, tarea, idMontaje, orden, eliminado) values (3,"ESTADO INICIAL",3,0,0);
insert into estacion (idEstacion, tarea, idMontaje, orden, eliminado) values (4,"ESTADO INICIAL",4,0,0);

-- ESTACION NUMERO 1

insert into estacion (idEstacion, tarea, idMontaje, orden, eliminado) values (5,"ENSAMBLADO",1,1,0);
insert into estacion (idEstacion, tarea, idMontaje, orden, eliminado) values (6,"ENSAMBLADO",2,1,0);
insert into estacion (idEstacion, tarea, idMontaje, orden, eliminado) values (7,"ENSAMBLADO",3,1,0);
insert into estacion (idEstacion, tarea, idMontaje, orden, eliminado) values (8,"ENSAMBLADO",4,1,0);

