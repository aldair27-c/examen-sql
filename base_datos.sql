-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema sql_examen
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema sql_examen
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sql_examen` DEFAULT CHARACTER SET utf8 ;
USE `sql_examen` ;

-- -----------------------------------------------------
-- Table `sql_examen`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sql_examen`.`categoria` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sql_examen`.`producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sql_examen`.`producto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(80) NOT NULL,
  `precio` DOUBLE NOT NULL,
  `categoria_fk` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_categoria_1_idx` (`categoria_fk` ASC) VISIBLE,
  CONSTRAINT `fk_categoria_1`
    FOREIGN KEY (`categoria_fk`)
    REFERENCES `sql_examen`.`categoria` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sql_examen`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sql_examen`.`cliente` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sql_examen`.`empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sql_examen`.`empleado` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sql_examen`.`venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sql_examen`.`venta` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cliente_fk` INT NOT NULL,
  `empleado_fk` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `total` DOUBLE NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_venta_1_idx` (`cliente_fk` ASC) VISIBLE,
  INDEX `fk_venta_2_idx` (`empleado_fk` ASC) VISIBLE,
  CONSTRAINT `fk_venta_1`
    FOREIGN KEY (`cliente_fk`)
    REFERENCES `sql_examen`.`cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_venta_2`
    FOREIGN KEY (`empleado_fk`)
    REFERENCES `sql_examen`.`empleado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sql_examen`.`detalle_venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sql_examen`.`detalle_venta` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `venta_fk` INT NOT NULL,
  `producto_fk` INT NOT NULL,
  `cantidad` INT NOT NULL,
  `subtotal` DOUBLE NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_detalle_venta_1_idx` (`venta_fk` ASC) VISIBLE,
  INDEX `fk_detalle_venta_2_idx` (`producto_fk` ASC) VISIBLE,
  CONSTRAINT `fk_detalle_venta_1`
    FOREIGN KEY (`venta_fk`)
    REFERENCES `sql_examen`.`venta` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_venta_2`
    FOREIGN KEY (`producto_fk`)
    REFERENCES `sql_examen`.`producto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


USE `sql_examen`;

-- -----------------------------------------------------
-- Datos `sql_examen`.`categoria`
-- -----------------------------------------------------
INSERT INTO `sql_examen`.`categoria` (`nombre`) VALUES
('Electrónica'),
('Hogar'),
('Ropa'),
('Alimentos'),
('Deportes');

USE `sql_examen`;

-- -----------------------------------------------------
-- Datos `sql_examen`.`cliente`
-- -----------------------------------------------------
INSERT INTO `sql_examen`.`cliente` (`nombre`, `apellido`, `telefono`) VALUES
('Carlos', 'Ramírez', '3101234567'),
('Laura', 'Gómez', '3209876543'),
('Andrés', 'Pérez', '3157654321'),
('María', 'Torres', '3021239876'),
('Juliana', 'Suárez', '3184567890');

USE `sql_examen`;

-- -----------------------------------------------------
-- Datos `sql_examen`.`empleado`
-- -----------------------------------------------------
INSERT INTO `sql_examen`.`empleado` (`nombre`, `apellido`) VALUES
('Diego', 'Martínez'),
('Camila', 'Rojas'),
('Felipe', 'Vargas'),
('Natalia', 'Castro');

USE `sql_examen`;

-- -----------------------------------------------------
-- Datos `sql_examen`.`producto`
-- -----------------------------------------------------
INSERT INTO `sql_examen`.`producto` (`nombre`, `precio`, `categoria_fk`) VALUES
('Audífonos Bluetooth', 89900, 1),
('Cargador USB-C 20W', 45900, 1),
('Mouse Inalámbrico', 39900, 1),
('Juego de Sábanas Queen', 129900, 2),
('Set de Ollas Antiadherentes', 189900, 2),
('Lámpara de Escritorio LED', 59900, 2),
('Camiseta Deportiva', 34900, 3),
('Pantalón Jean Clásico', 79900, 3),
('Chaqueta Impermeable', 149900, 3),
('Café Molido 500g', 18900, 4),
('Pasta Integral 500g', 6900, 4),
('Aceite de Oliva 1L', 32900, 4),
('Balón de Fútbol', 69900, 5),
('Mancuernas 5kg (par)', 89900, 5),
('Colchoneta de Yoga', 49900, 5);

USE `sql_examen`;

-- -----------------------------------------------------
-- Datos `sql_examen`.`venta`
-- -----------------------------------------------------
INSERT INTO `sql_examen`.`venta` (`cliente_fk`, `empleado_fk`, `fecha`, `total`) VALUES
(1, 1, '2026-01-15', 169700),
(2, 2, '2026-01-20', 189800),
(3, 1, '2026-02-05', 149700),
(4, 3, '2026-02-10', 103400),
(5, 4, '2026-02-18', 209700),
(1, 2, '2026-03-01', 241700),
(2, 3, '2026-03-10', 189900),
(3, 4, '2026-03-15', 164700),
(4, 1, '2026-04-02', 103600),
(5, 2, '2026-04-10', 309700);

USE `sql_examen`;

-- -----------------------------------------------------
-- Datos `sql_examen`.`venta` (totales corregidos)
-- -----------------------------------------------------
UPDATE `sql_examen`.`venta` SET `total` = 103600 WHERE `id` = 4;
UPDATE `sql_examen`.`venta` SET `total` = 209800 WHERE `id` = 5;
UPDATE `sql_examen`.`venta` SET `total` = 229800 WHERE `id` = 6;
UPDATE `sql_examen`.`venta` SET `total` = 189900 WHERE `id` = 7;
UPDATE `sql_examen`.`venta` SET `total` = 172700 WHERE `id` = 8;
UPDATE `sql_examen`.`venta` SET `total` = 105800 WHERE `id` = 9;
UPDATE `sql_examen`.`venta` SET `total` = 279800 WHERE `id` = 10;

USE `sql_examen`;

-- -----------------------------------------------------
-- Datos `sql_examen`.`detalle_venta`
-- -----------------------------------------------------
INSERT INTO `sql_examen`.`detalle_venta` (`venta_fk`, `producto_fk`, `cantidad`, `subtotal`) VALUES
(1, 1, 1, 89900),
(1, 3, 2, 79800),
(2, 9, 1, 149900),
(2, 3, 1, 39900),
(3, 7, 2, 69800),
(3, 8, 1, 79900),
(4, 10, 2, 37800),
(4, 12, 2, 65800),
(5, 9, 1, 149900),
(5, 6, 1, 59900),
(6, 5, 1, 189900),
(6, 3, 1, 39900),
(7, 5, 1, 189900),
(8, 8, 1, 79900),
(8, 6, 1, 59900),
(8, 12, 1, 32900),
(9, 2, 1, 45900),
(9, 6, 1, 59900),
(10, 5, 1, 189900),
(10, 1, 1, 89900);


