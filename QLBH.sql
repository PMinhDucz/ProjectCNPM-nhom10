-- MySQL Script generated by MySQL Workbench
-- Fri Dec 22 16:21:53 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema SupercenterManagement
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `SupercenterManagement` ;

-- -----------------------------------------------------
-- Schema SupercenterManagement
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `SupercenterManagement` DEFAULT CHARACTER SET utf8 ;
USE `SupercenterManagement` ;

-- -----------------------------------------------------
-- Table `SupercenterManagement`.`category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SupercenterManagement`.`category` ;

CREATE TABLE IF NOT EXISTS `SupercenterManagement`.`category` (
  `category_id` INT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`category_id`));


-- -----------------------------------------------------
-- Table `SupercenterManagement`.`feedback`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SupercenterManagement`.`feedback` ;


    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SupercenterManagement`.`order`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SupercenterManagement`.`order` ;

CREATE TABLE IF NOT EXISTS `SupercenterManagement`.`order` (
  `order_idbill` INT NOT NULL,
  `product_idproduct` INT NOT NULL,
  `product` VARCHAR(45) NOT NULL,
  `price` DECIMAL(15,0) NOT NULL,
  PRIMARY KEY (`order_idbill`, `product_idproduct`),
  INDEX `fk_order_details_order1_idx` (`order_idbill` ASC) VISIBLE,
  INDEX `fk_order_product1_idx` (`product_idproduct` ASC) VISIBLE,
  CONSTRAINT `fk_order_details_order1`
    FOREIGN KEY (`order_idbill`)
    REFERENCES `SupercenterManagement`.`order_details` (`idbill`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_product1`
    FOREIGN KEY (`product_idproduct`)
    REFERENCES `SupercenterManagement`.`product` (`idproduct`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SupercenterManagement`.`order_details`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SupercenterManagement`.`order_details` ;

CREATE TABLE IF NOT EXISTS `SupercenterManagement`.`order_details` (
  `idbill` INT NOT NULL,
  `user_id` INT NOT NULL,
  `customer` VARCHAR(45) NOT NULL,
  `date` DATETIME NOT NULL,
  `totalprice` DECIMAL(15,0) NOT NULL,
  PRIMARY KEY (`idbill`, `user_id`),
  INDEX `fk_order_details_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_order_details_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `SupercenterManagement`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SupercenterManagement`.`product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SupercenterManagement`.`product` ;

CREATE TABLE IF NOT EXISTS `SupercenterManagement`.`product` (
  `idproduct` INT NOT NULL,
  `product` VARCHAR(45) NOT NULL,
  `category_category_id` INT NOT NULL,
  `category` VARCHAR(45) NOT NULL,
  `remain` INT NOT NULL,
  `price` DECIMAL(15,0) NOT NULL,
  `unit` VARCHAR(50) NULL,
  `img_link` VARCHAR(50) NOT NULL,
  `context` TEXT NULL,
  PRIMARY KEY (`idproduct`, `category_category_id`),
  INDEX `fk_product_category1_idx` (`category_category_id` ASC) VISIBLE,
  CONSTRAINT `fk_product_category1`
    FOREIGN KEY (`category_category_id`)
    REFERENCES `SupercenterManagement`.`category` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SupercenterManagement`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SupercenterManagement`.`user` ;

CREATE TABLE IF NOT EXISTS `SupercenterManagement`.`user` (
  `id` INT NOT NULL,
  `username` VARCHAR(16) NOT NULL,
  `email` VARCHAR(255) NULL,
  `password` VARCHAR(32) NOT NULL,
  `full_name` VARCHAR(45) NOT NULL,
  `address` VARCHAR(105) NOT NULL,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`));


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;