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

insert into estacion (idEstacion, tarea, idMontaje, orden, eliminado) values (5,"FUNDICION",1,1,0);
insert into estacion (idEstacion, tarea, idMontaje, orden, eliminado) values (6,"FUNDICION",2,1,0);
insert into estacion (idEstacion, tarea, idMontaje, orden, eliminado) values (7,"FUNDICION",3,1,0);
insert into estacion (idEstacion, tarea, idMontaje, orden, eliminado) values (8,"FUNDICION",4,1,0);

-- ESTACION NUMERO 2

insert into estacion (idEstacion, tarea, idMontaje, orden, eliminado) values (9,"PRENSAS",1,2,0);
insert into estacion (idEstacion, tarea, idMontaje, orden, eliminado) values (10,"PRENSAS",2,2,0);
insert into estacion (idEstacion, tarea, idMontaje, orden, eliminado) values (11,"PRENSAS",3,2,0);
insert into estacion (idEstacion, tarea, idMontaje, orden, eliminado) values (12,"PRENSAS",4,2,0);

-- ESTACION NUMERO 3

insert into estacion (idEstacion, tarea, idMontaje, orden, eliminado) values (13,"CARROCERIA",1,3,0);
insert into estacion (idEstacion, tarea, idMontaje, orden, eliminado) values (14,"CARROCERIA",2,3,0);
insert into estacion (idEstacion, tarea, idMontaje, orden, eliminado) values (15,"CARROCERIA",3,3,0);
insert into estacion (idEstacion, tarea, idMontaje, orden, eliminado) values (16,"CARROCERIA",4,3,0);

-- ESTACION NUMERO 4

insert into estacion (idEstacion, tarea, idMontaje, orden, eliminado) values (17,"PINTURA",1,4,0);
insert into estacion (idEstacion, tarea, idMontaje, orden, eliminado) values (18,"PINTURA",2,4,0);
insert into estacion (idEstacion, tarea, idMontaje, orden, eliminado) values (19,"PINTURA",3,4,0);
insert into estacion (idEstacion, tarea, idMontaje, orden, eliminado) values (20,"PINTURA",4,4,0);

-- ESTACION NUMERO 5

insert into estacion (idEstacion, tarea, idMontaje, orden, eliminado) values (21,"ENSAMBLE AUXILIAR",1,5,0);
insert into estacion (idEstacion, tarea, idMontaje, orden, eliminado) values (22,"ENSAMBLE AUXILIAR",2,5,0);
insert into estacion (idEstacion, tarea, idMontaje, orden, eliminado) values (23,"ENSAMBLE AUXILIAR",3,5,0);
insert into estacion (idEstacion, tarea, idMontaje, orden, eliminado) values (24,"ENSAMBLE AUXILIAR",4,5,0);

-- ESTACION NUMERO 6

insert into estacion (idEstacion, tarea, idMontaje, orden, eliminado) values (25,"MONTAJE",1,6,0);
insert into estacion (idEstacion, tarea, idMontaje, orden, eliminado) values (26,"MONTAJE",2,6,0);
insert into estacion (idEstacion, tarea, idMontaje, orden, eliminado) values (27,"MONTAJE",3,6,0);
insert into estacion (idEstacion, tarea, idMontaje, orden, eliminado) values (28,"MONTAJE",4,6,0);

-- ESTACION NUMERO 7

insert into estacion (idEstacion, tarea, idMontaje, orden, eliminado) values (29,"CONTROL CALIDAD",1,7,0);
insert into estacion (idEstacion, tarea, idMontaje, orden, eliminado) values (30,"CONTROL CALIDAD",2,7,0);
insert into estacion (idEstacion, tarea, idMontaje, orden, eliminado) values (31,"CONTROL CALIDAD",3,7,0);
insert into estacion (idEstacion, tarea, idMontaje, orden, eliminado) values (32,"CONTROL CALIDAD",4,7,0);




