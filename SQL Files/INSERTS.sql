use tpbd1;


call insumo_alta(1,"Pintura",333);
call insumo_alta(2,"Paragolpe",125);
call insumo_alta(3,"Cubierta",274);

select * from insumo;

call concesionaria_alta(1,"Renault",30442334,23);
call concesionaria_alta(2,"Peugeot",30999999,6);
call concesionaria_alta(3,"Citroen",30292837,15);

select * from concesionaria;

call pedido_alta(1,2,5);
call pedido_alta(2,1,6);
call pedido_alta(3,3,7);

select * from pedido;


call proveedor_alta(1,"Firestone",3055555);
call proveedor_alta(2,"Giannoni",3069696);
call proveedor_alta(3,"Repuestos TuVieja",3044444);

select * from proveedor;

call proveedorInsumo_alta(1,2,5000);
call proveedorInsumo_alta(2,3,15000);
call proveedorInsumo_alta(3,1,3500);

select * from insumo_x_proveedor;


