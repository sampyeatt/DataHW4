-- MySQL Script generated by MySQL Workbench
-- Sun Mar  8 14:10:15 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`OwnerRecord`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`OwnerRecord` ;

CREATE TABLE IF NOT EXISTS `mydb`.`OwnerRecord` (
  `ownerID` INT NOT NULL,
  `ownerName` VARCHAR(45) NOT NULL,
  `ownerNumber` INT NOT NULL,
  `ownerSign` BINARY(2) NOT NULL,
  `signDate` DATE NOT NULL,
  PRIMARY KEY (`ownerID`),
  UNIQUE INDEX `ownerID_UNIQUE` (`ownerID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Animal Record`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`animalRecord` ;

CREATE TABLE IF NOT EXISTS `mydb`.`animalRecord` (
  `petID` INT NOT NULL,
  `ownerID` INT NOT NULL,
  `petName` VARCHAR(45) NOT NULL,
  `breed` VARCHAR(45) NOT NULL,
  `color` VARCHAR(45) NOT NULL,
  `birthday` DATE NOT NULL,
  `neuteredORspayed` BINARY(2) NOT NULL,
  `timePercentageOutside` DECIMAL NOT NULL,
  `diet` VARCHAR(45) NOT NULL,
  `animalType` VARCHAR(20),
  `gender` VARCHAR(6),
  PRIMARY KEY (`petID`),
  UNIQUE INDEX `petID_UNIQUE` (`petID` ASC) VISIBLE,
  UNIQUE INDEX `ownerID_UNIQUE` (`ownerID` ASC) VISIBLE,
  CONSTRAINT `ownerID`
    FOREIGN KEY (`ownerID`)
    REFERENCES `mydb`.`OwnerRecord` (`ownerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`VisitHistory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`VisitHistory` ;

CREATE TABLE IF NOT EXISTS `mydb`.`VisitHistory` (
  `visitID` INT NOT NULL,
  `petID` INT NOT NULL,
  `visitDate` DATE NOT NULL,
  `weight` INT NOT NULL,
  `temp` INT NOT NULL,
  `bloodPressure` FLOAT NOT NULL,
  `pulse` INT NOT NULL,
  `respiration` INT NOT NULL,
  `pain` INT NOT NULL,
  `vetInitals` VARCHAR(2) NOT NULL,
  `Animal Record_petID` INT NOT NULL,
  PRIMARY KEY (`visitID`, `petID`, `Animal Record_petID`),
  UNIQUE INDEX `petID_UNIQUE` (`petID` ASC) VISIBLE,
  UNIQUE INDEX `visitID_UNIQUE` (`visitID` ASC) VISIBLE,
  INDEX `fk_VisitHistory_Animal Record1_idx` (`Animal Record_petID` ASC) VISIBLE,
  CONSTRAINT `fk_VisitHistory_Animal Record1`
    FOREIGN KEY (`Animal Record_petID`)
    REFERENCES `mydb`.`Animal Record` (`petID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ImmunizationHistory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`ImmunizationHistory` ;

CREATE TABLE IF NOT EXISTS `mydb`.`ImmunizationHistory` (
  `immuID` INT NOT NULL,
  `petID` INT NOT NULL,
  `immuDate` DATE NOT NULL,
  `immuType` VARCHAR(45) NOT NULL,
  `immuNextDue` DATE NOT NULL,
  `immuDetail` VARCHAR(45) NULL,
  `Animal Record_petID` INT NOT NULL,
  PRIMARY KEY (`immuID`, `petID`, `Animal Record_petID`),
  UNIQUE INDEX `petID_UNIQUE` (`petID` ASC) VISIBLE,
  UNIQUE INDEX `immuID_UNIQUE` (`immuID` ASC) VISIBLE,
  INDEX `fk_ImmunizationHistory_Animal Record1_idx` (`Animal Record_petID` ASC) VISIBLE,
  CONSTRAINT `fk_ImmunizationHistory_Animal Record1`
    FOREIGN KEY (`Animal Record_petID`)
    REFERENCES `mydb`.`Animal Record` (`petID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`KnownConditions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`KnownConditions` ;

CREATE TABLE IF NOT EXISTS `mydb`.`KnownConditions` (
  `condID` INT NOT NULL,
  `petID` INT NOT NULL,
  `nameCondition` VARCHAR(45) NOT NULL,
  `conditionNotes` VARCHAR(45) NOT NULL,
  `Animal Record_petID` INT NOT NULL,
  PRIMARY KEY (`condID`, `petID`),
  UNIQUE INDEX `condID_UNIQUE` (`condID` ASC) VISIBLE,
  UNIQUE INDEX `petID_UNIQUE` (`petID` ASC) VISIBLE,
  INDEX `fk_KnownConditions_Animal Record1_idx` (`Animal Record_petID` ASC) VISIBLE,
  CONSTRAINT `fk_KnownConditions_Animal Record1`
    FOREIGN KEY (`Animal Record_petID`)
    REFERENCES `mydb`.`Animal Record` (`petID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`SurgicalHistoy`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`SurgicalHistoy` ;

CREATE TABLE IF NOT EXISTS `mydb`.`SurgicalHistoy` (
  `surgicalID` INT NOT NULL,
  `petID` INT NOT NULL,
  `surgicalDate` DATE NOT NULL,
  `surgicalProcedure` VARCHAR(45) NOT NULL,
  `Animal Record_petID` INT NOT NULL,
  PRIMARY KEY (`surgicalID`, `petID`),
  UNIQUE INDEX `petID_UNIQUE` (`petID` ASC) VISIBLE,
  UNIQUE INDEX `surgicalID_UNIQUE` (`surgicalID` ASC) VISIBLE,
  INDEX `fk_SurgicalHistoy_Animal Record1_idx` (`Animal Record_petID` ASC) VISIBLE,
  CONSTRAINT `fk_SurgicalHistoy_Animal Record1`
    FOREIGN KEY (`Animal Record_petID`)
    REFERENCES `mydb`.`Animal Record` (`petID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`MedicalHistory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`MedicalHistory` ;

CREATE TABLE IF NOT EXISTS `mydb`.`MedicalHistory` (
  `medID` INT NOT NULL,
  `petID` INT NOT NULL,
  `medDate` DATE NOT NULL,
  `medType` VARCHAR(45) NOT NULL,
  `porOrNeg` BINARY(2) NOT NULL,
  `medNotes` VARCHAR(100) NULL,
  `Animal Record_petID` INT NOT NULL,
  PRIMARY KEY (`medID`, `petID`),
  UNIQUE INDEX `medID_UNIQUE` (`medID` ASC) VISIBLE,
  UNIQUE INDEX `petID_UNIQUE` (`petID` ASC) VISIBLE,
  INDEX `fk_MedicalHistory_Animal Record1_idx` (`Animal Record_petID` ASC) VISIBLE,
  CONSTRAINT `fk_MedicalHistory_Animal Record1`
    FOREIGN KEY (`Animal Record_petID`)
    REFERENCES `mydb`.`Animal Record` (`petID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Training`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Training` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Training` (
  `sessionID` INT NOT NULL,
  `animalRecord_petID` INT NOT NULL,
  `Signed` BINARY(2) NOT NULL,
  INDEX `fk_Training_Animal Record1_idx` (`animalRecord_petID` ASC) VISIBLE,
  PRIMARY KEY (`sessionID`),
  CONSTRAINT `fk_Training_animalRecord1`
    FOREIGN KEY (`animalRecord_petID`)
    REFERENCES `mydb`.`animalRecord` (`petID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`trainType`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`trainType` ;

CREATE TABLE IF NOT EXISTS `mydb`.`trainType` (
  `trainType` INT NOT NULL,
  `type` VARCHAR(45) NULL,
  `maxCap` INT NULL,
  PRIMARY KEY (`trainType`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`session`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`session` ;

CREATE TABLE IF NOT EXISTS `mydb`.`session` (
  `sessionID` INT NOT NULL,
  `trainCapacity` INT NULL,
  `trainer` VARCHAR(20) NULL,
  `date` DATE NULL,
  `time` TIME NULL,
  `Training_sessionID` INT NOT NULL,
  `trainType_trainType` INT NOT NULL,
  PRIMARY KEY (`sessionID`, `Training_sessionID`, `trainType_trainType`),
  INDEX `fk_Session_Training1_idx` (`Training_sessionID` ASC) VISIBLE,
  INDEX `fk_session_trainType1_idx` (`trainType_trainType` ASC) VISIBLE,
  CONSTRAINT `fk_Session_Training1`
    FOREIGN KEY (`Training_sessionID`)
    REFERENCES `mydb`.`Training` (`sessionID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_session_trainType1`
    FOREIGN KEY (`trainType_trainType`)
    REFERENCES `mydb`.`trainType` (`trainType`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
