-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema userinfo
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema userinfo
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `userinfo` DEFAULT CHARACTER SET utf8 ;
USE `userinfo` ;

-- -----------------------------------------------------
-- Table `userinfo`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `userinfo`.`user` (
  `iduser` INT(11) NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(200) NULL DEFAULT NULL,
  `first` VARCHAR(200) NULL DEFAULT NULL,
  `last` VARCHAR(200) NULL DEFAULT NULL,
  `gender` VARCHAR(200) NULL DEFAULT NULL,
  `street_number` VARCHAR(200) NULL DEFAULT NULL,
  `street_name` VARCHAR(200) NULL DEFAULT NULL,
  `city` VARCHAR(200) NULL DEFAULT NULL,
  `state` VARCHAR(200) NULL DEFAULT NULL,
  `country` VARCHAR(200) NULL DEFAULT NULL,
  `postcode` VARCHAR(200) NULL DEFAULT NULL,
  `coordinates_latitud` VARCHAR(200) NULL DEFAULT NULL,
  `coordinates_longitud` VARCHAR(200) NULL DEFAULT NULL,
  `timezone_offset` VARCHAR(200) NULL DEFAULT NULL,
  `timezone_description` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`iduser`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
