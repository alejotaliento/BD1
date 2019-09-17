-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

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
  `eliminado` BIT NOT NULL,
  `fechaEliminado` DATETIME NULL,
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
  `eliminado` BIT NOT NULL,
  `fechaEliminado` DATETIME NULL,
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
  `eliminado` BIT NOT NULL,
  `fechaEliminado` DATETIME NULL,
  PRIMARY KEY (`idEstacion`),
  INDEX `fk_estacion_montaje1_idx` (`idMontaje` ASC),
  CONSTRAINT `fk_estacion_montaje1`
    FOREIGN KEY (`idMontaje`)
    REFERENCES `tpbd1`.`montaje` (`idMontaje`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tpbd1`.`modelo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tpbd1`.`modelo` ;

CREATE TABLE IF NOT EXISTS `tpbd1`.`modelo` (
  `idModelo` INT(11) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `eliminado` BIT NOT NULL,
  `fechaEliminado` DATETIME NULL,
  PRIMARY KEY (`idModelo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tpbd1`.`vehiculo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tpbd1`.`vehiculo` ;

CREATE TABLE IF NOT EXISTS `tpbd1`.`vehiculo` (
  `idVehiculo` INT(11) NOT NULL,
  `numeroChasis` VARCHAR(45) NOT NULL,
  `modelo_idModelo` INT(11) NOT NULL,
  `eliminado` BIT NOT NULL,
  `fechaEliminado` DATETIME NULL,
  PRIMARY KEY (`idVehiculo`),
  INDEX `fk_vehiculo_modelo1_idx` (`modelo_idModelo` ASC),
  CONSTRAINT `fk_vehiculo_modelo1`
    FOREIGN KEY (`modelo_idModelo`)
    REFERENCES `tpbd1`.`modelo` (`idModelo`))
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
  `eliminado` BIT NOT NULL,
  `fechaEliminado` DATETIME NULL,
  INDEX `fk_estacion_x_vehiculo_estacion1_idx` (`idEstacion` ASC),
  INDEX `fk_estacion_x_vehiculo_vehiculo1_idx` (`idVehiculo` ASC),
  CONSTRAINT `fk_estacion_x_vehiculo_estacion1`
    FOREIGN KEY (`idEstacion`)
    REFERENCES `tpbd1`.`estacion` (`idEstacion`),
  CONSTRAINT `fk_estacion_x_vehiculo_vehiculo1`
    FOREIGN KEY (`idVehiculo`)
    REFERENCES `tpbd1`.`vehiculo` (`idVehiculo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tpbd1`.`insumo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tpbd1`.`insumo` ;

CREATE TABLE IF NOT EXISTS `tpbd1`.`insumo` (
  `idInsumo` INT(11) NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(45) NOT NULL,
  `eliminado` BIT NOT NULL,
  `fechaEliminado` DATETIME NULL,
  PRIMARY KEY (`idInsumo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tpbd1`.`insumo_x_estacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tpbd1`.`insumo_x_estacion` ;

CREATE TABLE IF NOT EXISTS `tpbd1`.`insumo_x_estacion` (
  `idEstacion` INT(11) NOT NULL,
  `idInsumo` INT(11) NOT NULL,
  `cantidad` INT(11) NOT NULL,
  `eliminado` BIT NOT NULL,
  `fechaEliminado` DATETIME NULL,
  INDEX `fk_insumo_x_estacion_estacion1_idx` (`idEstacion` ASC),
  INDEX `fk_insumo_x_estacion_insumo1_idx` (`idInsumo` ASC),
  CONSTRAINT `fk_insumo_x_estacion_estacion1`
    FOREIGN KEY (`idEstacion`)
    REFERENCES `tpbd1`.`estacion` (`idEstacion`),
  CONSTRAINT `fk_insumo_x_estacion_insumo1`
    FOREIGN KEY (`idInsumo`)
    REFERENCES `tpbd1`.`insumo` (`idInsumo`))
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
  `eliminado` BIT NOT NULL,
  `fechaEliminado` DATETIME NULL,
  PRIMARY KEY (`idProveedor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tpbd1`.`insumo_x_proveedor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tpbd1`.`insumo_x_proveedor` ;

CREATE TABLE IF NOT EXISTS `tpbd1`.`insumo_x_proveedor` (
  `idInsumo` INT(11) NOT NULL,
  `idProveedor` INT(11) NOT NULL,
  `precio` DOUBLE NOT NULL,
  `eliminado` BIT NOT NULL,
  `fechaEliminado` DATETIME NULL,
  INDEX `fk_insumo_x_proveedor_insumo1_idx` (`idInsumo` ASC),
  INDEX `fk_insumo_x_proveedor_proveedor1_idx` (`idProveedor` ASC),
  CONSTRAINT `fk_insumo_x_proveedor_insumo1`
    FOREIGN KEY (`idInsumo`)
    REFERENCES `tpbd1`.`insumo` (`idInsumo`),
  CONSTRAINT `fk_insumo_x_proveedor_proveedor1`
    FOREIGN KEY (`idProveedor`)
    REFERENCES `tpbd1`.`proveedor` (`idProveedor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tpbd1`.`pedido`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tpbd1`.`pedido` ;

CREATE TABLE IF NOT EXISTS `tpbd1`.`pedido` (
  `idPedido` INT(11) NOT NULL,
  `idConcesionaria` INT(11) NOT NULL,
  `cantidad` VARCHAR(45) NOT NULL,
  `fecha` DATETIME NOT NULL,
  `eliminado` BIT NOT NULL,
  `fechaEliminado` DATETIME NULL,
  PRIMARY KEY (`idPedido`),
  INDEX `fk_pedido_concesionaria1_idx` (`idConcesionaria` ASC),
  CONSTRAINT `fk_pedido_concesionaria1`
    FOREIGN KEY (`idConcesionaria`)
    REFERENCES `tpbd1`.`concesionaria` (`idConcesionaria`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tpbd1`.`detalle_pedido`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tpbd1`.`detalle_pedido` ;

CREATE TABLE IF NOT EXISTS `tpbd1`.`detalle_pedido` (
  `idPedido` INT(11) NOT NULL,
  `idModelo` INT(11) NOT NULL,
  `eliminado` BIT NOT NULL,
  `fechaEliminado` DATETIME NULL,
  PRIMARY KEY (`idPedido`, `idModelo`),
  INDEX `fk_pedido_has_modelo_modelo1_idx` (`idModelo` ASC),
  INDEX `fk_pedido_has_modelo_pedido1_idx` (`idPedido` ASC),
  CONSTRAINT `fk_pedido_has_modelo_modelo1`
    FOREIGN KEY (`idModelo`)
    REFERENCES `tpbd1`.`modelo` (`idModelo`),
  CONSTRAINT `fk_pedido_has_modelo_pedido1`
    FOREIGN KEY (`idPedido`)
    REFERENCES `tpbd1`.`pedido` (`idPedido`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;




SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;