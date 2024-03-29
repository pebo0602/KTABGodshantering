-- MySQL Script generated by MySQL Workbench
-- Thu Sep 29 15:50:21 2016
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
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
-- Table `KTABGoodsTest`.`accounts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `KTABGoodsTest`.`accounts` ;

CREATE TABLE IF NOT EXISTS `KTABGoodsTest`.`accounts` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `account` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `KTABGoodsTest`.`goodscategories`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `KTABGoodsTest`.`goodscategories` ;

CREATE TABLE IF NOT EXISTS `KTABGoodsTest`.`goodscategories` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `category` VARCHAR(45) NOT NULL,
  `unitprice` DOUBLE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 21
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `KTABGoodsTest`.`invoicerecievers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `KTABGoodsTest`.`invoicerecievers` ;

CREATE TABLE IF NOT EXISTS `KTABGoodsTest`.`invoicerecievers` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `company` VARCHAR(45) NOT NULL,
  `adress` VARCHAR(45) NULL DEFAULT 'N/A',
  `contact` VARCHAR(45) NULL DEFAULT 'N/A',
  `phone` VARCHAR(45) NULL DEFAULT 'N/A',
  `email` VARCHAR(45) NULL DEFAULT 'N/A',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 47
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `KTABGoodsTest`.`orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `KTABGoodsTest`.`orders` ;

CREATE TABLE IF NOT EXISTS `KTABGoodsTest`.`orders` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `date` VARCHAR(45) NOT NULL,
  `invoicereciever_id` INT(11) NOT NULL,
  `accounts_id` INT(11) NOT NULL,
  `goodscategories_id` INT(11) NOT NULL,
  `nounits` INT(11) NOT NULL,
  `totalprice` INT(11) NOT NULL,
  `comment` VARCHAR(45) NULL DEFAULT 'N/A',
  `mailed_date` VARCHAR(45) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  INDEX `fk_orders_invoicereciever_idx` (`invoicereciever_id` ASC),
  INDEX `fk_orders_goodscategories1_idx` (`goodscategories_id` ASC),
  INDEX `fk_orders_accounts1_idx` (`accounts_id` ASC),
  CONSTRAINT `fk_orders_accounts1`
    FOREIGN KEY (`accounts_id`)
    REFERENCES `KTABGoodsTest`.`accounts` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_goodscategories1`
    FOREIGN KEY (`goodscategories_id`)
    REFERENCES `KTABGoodsTest`.`goodscategories` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_invoicereciever`
    FOREIGN KEY (`invoicereciever_id`)
    REFERENCES `KTABGoodsTest`.`invoicerecievers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 77
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
