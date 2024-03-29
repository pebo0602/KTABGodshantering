-- MySQL Script generated by MySQL Workbench
-- Sun Aug 28 12:51:41 2016
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema KTABGoodsTest
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `KTABGoodsTest` ;

-- -----------------------------------------------------
-- Schema KTABGoodsTest
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `KTABGoodsTest` DEFAULT CHARACTER SET utf8 ;
USE `KTABGoodsTest` ;

-- -----------------------------------------------------
-- Table `KTABGoodsTest`.`invoicerecievers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `KTABGoodsTest`.`invoicerecievers` ;

CREATE TABLE IF NOT EXISTS `KTABGoodsTest`.`invoicerecievers` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `adress` VARCHAR(45) NOT NULL,
  `contact` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `KTABGoodsTest`.`goodscategories`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `KTABGoodsTest`.`goodscategories` ;

CREATE TABLE IF NOT EXISTS `KTABGoodsTest`.`goodscategories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `category` VARCHAR(45) NOT NULL,
  `unitprice` DECIMAL(20) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `KTABGoodsTest`.`accounts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `KTABGoodsTest`.`accounts` ;

CREATE TABLE IF NOT EXISTS `KTABGoodsTest`.`accounts` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `KTABGoodsTest`.`orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `KTABGoodsTest`.`orders` ;

CREATE TABLE IF NOT EXISTS `KTABGoodsTest`.`orders` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date` VARCHAR(45) NOT NULL,
  `invoicereciever_id` INT NOT NULL,
  `accounts_id` INT NOT NULL,
  `goodscategories_id` INT NOT NULL,
  `nounits` INT NOT NULL,
  `totalprice` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_orders_invoicereciever_idx` (`invoicereciever_id` ASC),
  INDEX `fk_orders_goodscategories1_idx` (`goodscategories_id` ASC),
  INDEX `fk_orders_accounts1_idx` (`accounts_id` ASC),
  CONSTRAINT `fk_orders_invoicereciever`
    FOREIGN KEY (`invoicereciever_id`)
    REFERENCES `KTABGoodsTest`.`invoicerecievers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_goodscategories1`
    FOREIGN KEY (`goodscategories_id`)
    REFERENCES `KTABGoodsTest`.`goodscategories` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_accounts1`
    FOREIGN KEY (`accounts_id`)
    REFERENCES `KTABGoodsTest`.`accounts` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
