-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema tpbd1
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `tpbd1` ;

-- -----------------------------------------------------
-- Schema tpbd1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `tpbd1` DEFAULT CHARACTER SET utf8 ;
USE `tpbd1` ;

-- -----------------------------------------------------
-- Table `tpbd1`.`concesionaria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tpbd1`.`concesionaria` ;

CREATE TABLE IF NOT EXISTS `tpbd1`.`concesionaria` (
  `idConcesionaria` INT(11) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `cuit` INT(11) NOT NULL,
  `ventas` INT(11) NOT NULL,
  PRIMARY KEY (`idConcesionaria`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tpbd1`.`montaje`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tpbd1`.`montaje` ;

CREATE TABLE IF NOT EXISTS `tpbd1`.`montaje` (
  `idMontaje` INT(11) NOT NULL,
  `idModelo` INT(11) NOT NULL,
  PRIMARY KEY (`idMontaje`),
  INDEX `fk_montaje_modelo1_idx` (`idModelo` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tpbd1`.`estacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tpbd1`.`estacion` ;

CREATE TABLE IF NOT EXISTS `tpbd1`.`estacion` (
  `idEstacion` INT(11) NOT NULL,
  `tarea` VARCHAR(45) NOT NULL,
  `idMontaje` INT(11) NOT NULL,
  `orden` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idEstacion`),
  INDEX `fk_estacion_montaje1_idx` (`idMontaje` ASC),
  CONSTRAINT `fk_estacion_montaje1`
    FOREIGN KEY (`idMontaje`)
    REFERENCES `tpbd1`.`montaje` (`idMontaje`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tpbd1`.`modelo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tpbd1`.`modelo` ;

CREATE TABLE IF NOT EXISTS `tpbd1`.`modelo` (
  `idModelo` INT(11) NOT NULL,
  `nombre` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idModelo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tpbd1`.`vehiculo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tpbd1`.`vehiculo` ;

CREATE TABLE IF NOT EXISTS `tpbd1`.`vehiculo` (
  `idVehiculo` INT(11) NOT NULL,
  `numeroChasis` VARCHAR(45) NULL DEFAULT NULL,
  `modelo_idModelo` INT(11) NOT NULL,
  PRIMARY KEY (`idVehiculo`),
  INDEX `fk_vehiculo_modelo1_idx` (`modelo_idModelo` ASC),
  CONSTRAINT `fk_vehiculo_modelo1`
    FOREIGN KEY (`modelo_idModelo`)
    REFERENCES `tpbd1`.`modelo` (`idModelo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tpbd1`.`estacion_x_vehiculo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tpbd1`.`estacion_x_vehiculo` ;

CREATE TABLE IF NOT EXISTS `tpbd1`.`estacion_x_vehiculo` (
  `fecha_ingreso` DATETIME NOT NULL,
  `fecha_egreso` DATETIME NOT NULL,
  `idEstacion` INT(11) NOT NULL,
  `idVehiculo` INT(11) NOT NULL,
  INDEX `fk_estacion_x_vehiculo_estacion1_idx` (`idEstacion` ASC),
  INDEX `fk_estacion_x_vehiculo_vehiculo1_idx` (`idVehiculo` ASC),
  CONSTRAINT `fk_estacion_x_vehiculo_estacion1`
    FOREIGN KEY (`idEstacion`)
    REFERENCES `tpbd1`.`estacion` (`idEstacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_estacion_x_vehiculo_vehiculo1`
    FOREIGN KEY (`idVehiculo`)
    REFERENCES `tpbd1`.`vehiculo` (`idVehiculo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tpbd1`.`insumo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tpbd1`.`insumo` ;

CREATE TABLE IF NOT EXISTS `tpbd1`.`insumo` (
  `idInsumo` INT(11) NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(45) NOT NULL,
  `codigo` INT(11) NOT NULL,
  PRIMARY KEY (`idInsumo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tpbd1`.`insumo_x_estacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tpbd1`.`insumo_x_estacion` ;

CREATE TABLE IF NOT EXISTS `tpbd1`.`insumo_x_estacion` (
  `idEstacion` INT(11) NOT NULL,
  `insumo_codigo` INT(11) NOT NULL,
  `cantidad` INT(11) NOT NULL,
  INDEX `fk_insumo_x_estacion_estacion1_idx` (`idEstacion` ASC),
  INDEX `fk_insumo_x_estacion_insumo1_idx` (`insumo_codigo` ASC),
  CONSTRAINT `fk_insumo_x_estacion_estacion1`
    FOREIGN KEY (`idEstacion`)
    REFERENCES `tpbd1`.`estacion` (`idEstacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_insumo_x_estacion_insumo1`
    FOREIGN KEY (`insumo_codigo`)
    REFERENCES `tpbd1`.`insumo` (`idInsumo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tpbd1`.`proveedor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tpbd1`.`proveedor` ;

CREATE TABLE IF NOT EXISTS `tpbd1`.`proveedor` (
  `idProveedor` INT(11) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `cuit` INT(11) NOT NULL,
  PRIMARY KEY (`idProveedor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tpbd1`.`insumo_x_proveedor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tpbd1`.`insumo_x_proveedor` ;

CREATE TABLE IF NOT EXISTS `tpbd1`.`insumo_x_proveedor` (
  `insumo_codigo` INT(11) NOT NULL,
  `proveedor_idproveedor` INT(11) NOT NULL,
  `precio_insumo` DOUBLE NULL DEFAULT NULL,
  INDEX `fk_insumo_x_proveedor_insumo1_idx` (`insumo_codigo` ASC),
  INDEX `fk_insumo_x_proveedor_proveedor1_idx` (`proveedor_idproveedor` ASC),
  CONSTRAINT `fk_insumo_x_proveedor_insumo1`
    FOREIGN KEY (`insumo_codigo`)
    REFERENCES `tpbd1`.`insumo` (`idInsumo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_insumo_x_proveedor_proveedor1`
    FOREIGN KEY (`proveedor_idproveedor`)
    REFERENCES `tpbd1`.`proveedor` (`idProveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tpbd1`.`pedido`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tpbd1`.`pedido` ;

CREATE TABLE IF NOT EXISTS `tpbd1`.`pedido` (
  `idPedido` INT(11) NOT NULL,
  `cantidad` VARCHAR(45) NULL DEFAULT NULL,
  `concesionaria_idConcesionaria` INT(11) NOT NULL,
  PRIMARY KEY (`idPedido`),
  INDEX `fk_pedido_concesionaria1_idx` (`concesionaria_idConcesionaria` ASC),
  CONSTRAINT `fk_pedido_concesionaria1`
    FOREIGN KEY (`concesionaria_idConcesionaria`)
    REFERENCES `tpbd1`.`concesionaria` (`idConcesionaria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tpbd1`.`pedido_has_modelo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tpbd1`.`pedido_has_modelo` ;

CREATE TABLE IF NOT EXISTS `tpbd1`.`pedido_has_modelo` (
  `pedido_idPedido` INT(11) NOT NULL,
  `modelo_idModelo` INT(11) NOT NULL,
  PRIMARY KEY (`pedido_idPedido`, `modelo_idModelo`),
  INDEX `fk_pedido_has_modelo_modelo1_idx` (`modelo_idModelo` ASC),
  INDEX `fk_pedido_has_modelo_pedido1_idx` (`pedido_idPedido` ASC),
  CONSTRAINT `fk_pedido_has_modelo_modelo1`
    FOREIGN KEY (`modelo_idModelo`)
    REFERENCES `tpbd1`.`modelo` (`idModelo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_has_modelo_pedido1`
    FOREIGN KEY (`pedido_idPedido`)
    REFERENCES `tpbd1`.`pedido` (`idPedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tpbd1`.`detalle_pedido`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tpbd1`.`detalle_pedido` ;

CREATE TABLE IF NOT EXISTS `tpbd1`.`detalle_pedido` (
idDetalle int primary key not null,
fecha datetime
)
ENGINE = InnoDB;

USE `tpbd1` ;

-- -----------------------------------------------------
-- procedure modelo_alta
-- -----------------------------------------------------

USE `tpbd1`;
DROP procedure IF EXISTS `tpbd1`.`modelo_alta`;

DELIMITER $$
USE `tpbd1`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `modelo_alta`(id int,nombre varchar(45))
insert into modelo values(id,nombre)$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure modelo_baja
-- -----------------------------------------------------

USE `tpbd1`;
DROP procedure IF EXISTS `tpbd1`.`modelo_baja`;

DELIMITER $$
USE `tpbd1`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `modelo_baja`(id int)
delete from modelo where idModelo=id$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure modelo_modificacion
-- -----------------------------------------------------

USE `tpbd1`;
DROP procedure IF EXISTS `tpbd1`.`modelo_modificacion`;

DELIMITER $$
USE `tpbd1`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `modelo_modificacion`(id int,nombre varchar(45))
update modelo set nombre=nombre where idModelo=id$$

DELIMITER ;

-- PROCEDURES CONCESIONARIA

create procedure concesionaria_alta(id int, nombre varchar(45), cuit int, ventas int)
insert into concesionaria values(id,nombre,cuit,ventas);

create procedure concesionaria_baja(id int)
delete from concesionaria where idConcesionaria=id;

create procedure concesionaria_modificacion(id int, nombre varchar(45), cuit int, ventas int)
update concesionaria set nombre=nombre, cuit=cuit, ventas=ventas where idConcesionaria=id;

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

-- PROCEDURES PEDIDO

create procedure pedido_alta(id int, cantidad int, concesionaria int)
insert into pedido values(id,cantidad,concesionaria);

create procedure pedido_baja(id int)
delete from pedido where idPedido=id;

create procedure pedido_modificacion(id int, cantidad int, concesionaria int)
update pedido set cantidad=cantidad,concesionaria=concesionaria where idPedido=id;

-- PROCEDURES PROVEEDOR_INSUMO

create procedure proveedorInsumo_alta(idInsumo int, idProveedor int,precio double)
insert into insumo_x_proveedor values(idInsumo,idProveedor,precio);

create procedure proveedorInsumo_baja(idInsumo int, idProveedor int)
delete from insumo_x_proveedor where insumo_codigo=idInsumo and proveedor_idproveedor=idProveedor;

create procedure proveedorInsumo_modificacion(idInsumo int, idProveedor int,precio double)
update insumo_x_proveedor set precio=precio where insumo_codigo=idInsumo and proveedor_idproveedor=idProveedor; 





SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
