-- MySQL Script generated by MySQL Workbench
-- Tuesday 27 August 2019 07:36:59 PM IST
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema paytm
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `paytm` ;

-- -----------------------------------------------------
-- Schema paytm
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `paytm` DEFAULT CHARACTER SET utf8 ;
USE `paytm` ;

-- -----------------------------------------------------
-- Table `paytm`.`Branches`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `paytm`.`Branches` ;

CREATE TABLE IF NOT EXISTS `paytm`.`Branches` (
  `branch_id` INT NOT NULL,
  `branch_name` VARCHAR(45) NULL,
  `branch_addr` VARCHAR(45) NULL,
  PRIMARY KEY (`branch_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `paytm`.`Accounts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `paytm`.`Accounts` ;

CREATE TABLE IF NOT EXISTS `paytm`.`Accounts` (
  `account_no` INT NOT NULL,
  `Branches_branch_id` INT NOT NULL,
  `balance` FLOAT NULL,
  `debit` FLOAT NULL,
  `credit` FLOAT NULL,
  PRIMARY KEY (`account_no`, `Branches_branch_id`),
  INDEX `fk_Accounts_Branches_idx` (`Branches_branch_id` ASC),
  CONSTRAINT `fk_Accounts_Branches`
    FOREIGN KEY (`Branches_branch_id`)
    REFERENCES `paytm`.`Branches` (`branch_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `paytm`.`Customers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `paytm`.`Customers` ;

CREATE TABLE IF NOT EXISTS `paytm`.`Customers` (
  `customer_id` INT NOT NULL,
  `customer_name` VARCHAR(45) NULL,
  `customer_mob.` VARCHAR(45) NULL,
  `Accounts_account_no` INT NOT NULL,
  `Accounts_Branches_branch_id` INT NOT NULL,
  PRIMARY KEY (`customer_id`, `Accounts_account_no`, `Accounts_Branches_branch_id`),
  INDEX `fk_Customers_Accounts1_idx` (`Accounts_account_no` ASC, `Accounts_Branches_branch_id` ASC),
  CONSTRAINT `fk_Customers_Accounts1`
    FOREIGN KEY (`Accounts_account_no` , `Accounts_Branches_branch_id`)
    REFERENCES `paytm`.`Accounts` (`account_no` , `Branches_branch_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
