-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema DB_Assignment
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema DB_Assignment
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `DB_Assignment` DEFAULT CHARACTER SET utf8 ;
USE `DB_Assignment` ;

-- -----------------------------------------------------
-- Table `DB_Assignment`.`TEST`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_Assignment`.`TEST` (
  `Test_id` INT NOT NULL,
  `Test_name` VARCHAR(45) NULL,
  `Description` VARCHAR(45) NULL,
  PRIMARY KEY (`Test_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB_Assignment`.`DEPARTMENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_Assignment`.`DEPARTMENT` (
  `Department_id` INT NOT NULL,
  `DepartmentName` VARCHAR(45) NULL,
  `Location` VARCHAR(45) NULL,
  PRIMARY KEY (`Department_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB_Assignment`.`DOCTOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_Assignment`.`DOCTOR` (
  `Employee_id` INT NOT NULL,
  `Degree` VARCHAR(45) NULL,
  `Experience` INT NULL,
  `Specialty` VARCHAR(45) NULL,
  `Certificate_no` INT NULL,
  `DEPARTMENT_Department_id` INT NOT NULL,
  PRIMARY KEY (`Employee_id`),
  INDEX `fk_DOCTOR_DEPARTMENT_idx` (`DEPARTMENT_Department_id` ASC) VISIBLE,
  CONSTRAINT `fk_DOCTOR_DEPARTMENT`
    FOREIGN KEY (`DEPARTMENT_Department_id`)
    REFERENCES `DB_Assignment`.`DEPARTMENT` (`Department_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB_Assignment`.`NURSE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_Assignment`.`NURSE` (
  `Employee_id` INT NOT NULL,
  `Certificate_no` INT NULL,
  `Experience` INT NULL,
  PRIMARY KEY (`Employee_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB_Assignment`.`TECHNICIAN`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_Assignment`.`TECHNICIAN` (
  `Employee_id` INT NOT NULL,
  `Specialty` VARCHAR(45) NULL,
  PRIMARY KEY (`Employee_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB_Assignment`.`RECEPTIONIST`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_Assignment`.`RECEPTIONIST` (
  `Employee_id` INT NOT NULL,
  `Shift` DATETIME NULL,
  PRIMARY KEY (`Employee_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB_Assignment`.`DRIVER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_Assignment`.`DRIVER` (
  `Employee_id` INT NOT NULL,
  `Driver_license` INT NULL,
  PRIMARY KEY (`Employee_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB_Assignment`.`PATIENT RECORD`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_Assignment`.`PATIENT RECORD` (
  `Record_id` INT NOT NULL,
  `Patient_id` INT NULL,
  `First_name` VARCHAR(45) NULL,
  `Last_name` VARCHAR(45) NULL,
  `Gender` TINYINT NULL,
  `Dob` DATETIME NULL,
  `Address` VARCHAR(45) NULL,
  `Diagnosis` VARCHAR(45) NULL,
  `Medical_background` VARCHAR(45) NULL,
  `Start_date` DATETIME NULL,
  `End_date` DATETIME NULL,
  `DOCTOR_Employee_id` INT NOT NULL,
  PRIMARY KEY (`Record_id`),
  INDEX `fk_PATIENT RECORD_DOCTOR1_idx` (`DOCTOR_Employee_id` ASC) VISIBLE,
  CONSTRAINT `fk_PATIENT RECORD_DOCTOR1`
    FOREIGN KEY (`DOCTOR_Employee_id`)
    REFERENCES `DB_Assignment`.`DOCTOR` (`Employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB_Assignment`.`APPOINTMENT RECORD`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_Assignment`.`APPOINTMENT RECORD` (
  `Record_id` INT NOT NULL,
  `Date` DATETIME NULL,
  `Time` DATETIME NULL,
  `PATIENT RECORD_Record_id` INT NOT NULL,
  `RECEPTIONIST_Employee_id` INT NOT NULL,
  PRIMARY KEY (`Record_id`),
  INDEX `fk_APPOINTMENT RECORD_PATIENT RECORD1_idx` (`PATIENT RECORD_Record_id` ASC) VISIBLE,
  INDEX `fk_APPOINTMENT RECORD_RECEPTIONIST1_idx` (`RECEPTIONIST_Employee_id` ASC) VISIBLE,
  CONSTRAINT `fk_APPOINTMENT RECORD_PATIENT RECORD1`
    FOREIGN KEY (`PATIENT RECORD_Record_id`)
    REFERENCES `DB_Assignment`.`PATIENT RECORD` (`Record_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_APPOINTMENT RECORD_RECEPTIONIST1`
    FOREIGN KEY (`RECEPTIONIST_Employee_id`)
    REFERENCES `DB_Assignment`.`RECEPTIONIST` (`Employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB_Assignment`.`ROOM`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_Assignment`.`ROOM` (
  `Room_id` INT NOT NULL,
  `No_of_beds` INT NULL,
  `Room_type` VARCHAR(45) NULL,
  `DEPARTMENT_Department_id` INT NOT NULL,
  PRIMARY KEY (`Room_id`),
  INDEX `fk_ROOM_DEPARTMENT1_idx` (`DEPARTMENT_Department_id` ASC) VISIBLE,
  CONSTRAINT `fk_ROOM_DEPARTMENT1`
    FOREIGN KEY (`DEPARTMENT_Department_id`)
    REFERENCES `DB_Assignment`.`DEPARTMENT` (`Department_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB_Assignment`.`MEDICAL EQUIPMENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_Assignment`.`MEDICAL EQUIPMENT` (
  `Equipment_id` INT NOT NULL,
  `Equipment_type` VARCHAR(45) NULL,
  `Bought_day` DATETIME NULL,
  `ROOM_Room_id` INT NOT NULL,
  `TECHNICIAN_Employee_id` INT NOT NULL,
  PRIMARY KEY (`Equipment_id`),
  INDEX `fk_MEDICAL EQUIPMENT_ROOM1_idx` (`ROOM_Room_id` ASC) VISIBLE,
  INDEX `fk_MEDICAL EQUIPMENT_TECHNICIAN1_idx` (`TECHNICIAN_Employee_id` ASC) VISIBLE,
  CONSTRAINT `fk_MEDICAL EQUIPMENT_ROOM1`
    FOREIGN KEY (`ROOM_Room_id`)
    REFERENCES `DB_Assignment`.`ROOM` (`Room_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_MEDICAL EQUIPMENT_TECHNICIAN1`
    FOREIGN KEY (`TECHNICIAN_Employee_id`)
    REFERENCES `DB_Assignment`.`TECHNICIAN` (`Employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB_Assignment`.`AMBULANCE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_Assignment`.`AMBULANCE` (
  `Car_number` INT NOT NULL,
  `Licence_plate` INT NULL,
  `DRIVER_Employee_id` INT NOT NULL,
  PRIMARY KEY (`Car_number`),
  INDEX `fk_AMBULANCE_DRIVER1_idx` (`DRIVER_Employee_id` ASC) VISIBLE,
  CONSTRAINT `fk_AMBULANCE_DRIVER1`
    FOREIGN KEY (`DRIVER_Employee_id`)
    REFERENCES `DB_Assignment`.`DRIVER` (`Employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB_Assignment`.`PRESCRIPTION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_Assignment`.`PRESCRIPTION` (
  `Prescription_id` INT NOT NULL,
  `Date` DATETIME NULL,
  `PATIENT RECORD_Record_id` INT NOT NULL,
  PRIMARY KEY (`Prescription_id`),
  INDEX `fk_PRESCRIPTION_PATIENT RECORD1_idx` (`PATIENT RECORD_Record_id` ASC) VISIBLE,
  CONSTRAINT `fk_PRESCRIPTION_PATIENT RECORD1`
    FOREIGN KEY (`PATIENT RECORD_Record_id`)
    REFERENCES `DB_Assignment`.`PATIENT RECORD` (`Record_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB_Assignment`.`MEDICINE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_Assignment`.`MEDICINE` (
  `Medicine_id` INT NOT NULL,
  `Brand_name` VARCHAR(45) NULL,
  `Generic_name` VARCHAR(45) NULL,
  `Description` VARCHAR(45) NULL,
  PRIMARY KEY (`Medicine_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB_Assignment`.`PAYMENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_Assignment`.`PAYMENT` (
  `Payment_id` INT NOT NULL,
  `Amount` FLOAT NULL,
  `Payment_method` VARCHAR(45) NULL,
  `Date` DATETIME NULL,
  `PATIENT RECORD_Record_id` INT NOT NULL,
  PRIMARY KEY (`Payment_id`),
  INDEX `fk_PAYMENT_PATIENT RECORD1_idx` (`PATIENT RECORD_Record_id` ASC) VISIBLE,
  CONSTRAINT `fk_PAYMENT_PATIENT RECORD1`
    FOREIGN KEY (`PATIENT RECORD_Record_id`)
    REFERENCES `DB_Assignment`.`PATIENT RECORD` (`Record_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB_Assignment`.`TREATMENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_Assignment`.`TREATMENT` (
  `Treatment_id` INT NOT NULL,
  `Treatment_name` VARCHAR(45) NULL,
  `Requirement` VARCHAR(45) NULL,
  `Description` VARCHAR(45) NULL,
  PRIMARY KEY (`Treatment_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB_Assignment`.`EMPLOYEE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_Assignment`.`EMPLOYEE` (
  `Employee_id` INT NOT NULL,
  `FirstName` VARCHAR(45) NULL,
  `LastName` VARCHAR(45) NULL,
  `Gender` TINYINT NULL,
  `DOB` DATETIME NULL,
  `Address` VARCHAR(45) NULL,
  `Salary` INT NULL,
  PRIMARY KEY (`Employee_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB_Assignment`.`EQUIPMENT_MAINTENANCE_DATE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_Assignment`.`EQUIPMENT_MAINTENANCE_DATE` (
  `Date` INT NOT NULL,
  `MEDICAL EQUIPMENT_Equipment_id` INT NOT NULL,
  PRIMARY KEY (`Date`, `MEDICAL EQUIPMENT_Equipment_id`),
  INDEX `fk_EQUIPMENT_MAINTENANCE_DATE_MEDICAL EQUIPMENT1_idx` (`MEDICAL EQUIPMENT_Equipment_id` ASC) VISIBLE,
  CONSTRAINT `fk_EQUIPMENT_MAINTENANCE_DATE_MEDICAL EQUIPMENT1`
    FOREIGN KEY (`MEDICAL EQUIPMENT_Equipment_id`)
    REFERENCES `DB_Assignment`.`MEDICAL EQUIPMENT` (`Equipment_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB_Assignment`.`STAY_IN`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_Assignment`.`STAY_IN` (
  `PATIENT RECORD_Record_id` INT NOT NULL,
  `ROOM_Room_id` INT NOT NULL,
  `Bed_number` INT NULL,
  `Day_in` DATETIME NULL,
  `Day_out` DATETIME NULL,
  PRIMARY KEY (`PATIENT RECORD_Record_id`, `ROOM_Room_id`),
  INDEX `fk_PATIENT RECORD_has_ROOM_ROOM1_idx` (`ROOM_Room_id` ASC) VISIBLE,
  INDEX `fk_PATIENT RECORD_has_ROOM_PATIENT RECORD1_idx` (`PATIENT RECORD_Record_id` ASC) VISIBLE,
  CONSTRAINT `fk_PATIENT RECORD_has_ROOM_PATIENT RECORD1`
    FOREIGN KEY (`PATIENT RECORD_Record_id`)
    REFERENCES `DB_Assignment`.`PATIENT RECORD` (`Record_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PATIENT RECORD_has_ROOM_ROOM1`
    FOREIGN KEY (`ROOM_Room_id`)
    REFERENCES `DB_Assignment`.`ROOM` (`Room_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB_Assignment`.`LIST`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_Assignment`.`LIST` (
  `PRESCRIPTION_Prescription_id` INT NOT NULL,
  `MEDICINE_Medicine_id` INT NOT NULL,
  `Dose` VARCHAR(45) NULL,
  PRIMARY KEY (`PRESCRIPTION_Prescription_id`, `MEDICINE_Medicine_id`),
  INDEX `fk_PRESCRIPTION_has_MEDICINE_MEDICINE1_idx` (`MEDICINE_Medicine_id` ASC) VISIBLE,
  INDEX `fk_PRESCRIPTION_has_MEDICINE_PRESCRIPTION1_idx` (`PRESCRIPTION_Prescription_id` ASC) VISIBLE,
  CONSTRAINT `fk_PRESCRIPTION_has_MEDICINE_PRESCRIPTION1`
    FOREIGN KEY (`PRESCRIPTION_Prescription_id`)
    REFERENCES `DB_Assignment`.`PRESCRIPTION` (`Prescription_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PRESCRIPTION_has_MEDICINE_MEDICINE1`
    FOREIGN KEY (`MEDICINE_Medicine_id`)
    REFERENCES `DB_Assignment`.`MEDICINE` (`Medicine_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB_Assignment`.`TAKE_TREATMENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_Assignment`.`TAKE_TREATMENT` (
  `PATIENT RECORD_Record_id` INT NOT NULL,
  `TREATMENT_Treatment_id` INT NOT NULL,
  `Date` DATETIME NULL,
  PRIMARY KEY (`PATIENT RECORD_Record_id`, `TREATMENT_Treatment_id`),
  INDEX `fk_PATIENT RECORD_has_TREATMENT_TREATMENT1_idx` (`TREATMENT_Treatment_id` ASC) VISIBLE,
  INDEX `fk_PATIENT RECORD_has_TREATMENT_PATIENT RECORD1_idx` (`PATIENT RECORD_Record_id` ASC) VISIBLE,
  CONSTRAINT `fk_PATIENT RECORD_has_TREATMENT_PATIENT RECORD1`
    FOREIGN KEY (`PATIENT RECORD_Record_id`)
    REFERENCES `DB_Assignment`.`PATIENT RECORD` (`Record_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PATIENT RECORD_has_TREATMENT_TREATMENT1`
    FOREIGN KEY (`TREATMENT_Treatment_id`)
    REFERENCES `DB_Assignment`.`TREATMENT` (`Treatment_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB_Assignment`.`PATIENT RECORD_has_PATIENT RECORD`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_Assignment`.`PATIENT RECORD_has_PATIENT RECORD` (
  `PATIENT RECORD_Record_id` INT NOT NULL,
  `PATIENT RECORD_Record_id1` INT NOT NULL,
  PRIMARY KEY (`PATIENT RECORD_Record_id`, `PATIENT RECORD_Record_id1`),
  INDEX `fk_PATIENT RECORD_has_PATIENT RECORD_PATIENT RECORD2_idx` (`PATIENT RECORD_Record_id1` ASC) VISIBLE,
  INDEX `fk_PATIENT RECORD_has_PATIENT RECORD_PATIENT RECORD1_idx` (`PATIENT RECORD_Record_id` ASC) VISIBLE,
  CONSTRAINT `fk_PATIENT RECORD_has_PATIENT RECORD_PATIENT RECORD1`
    FOREIGN KEY (`PATIENT RECORD_Record_id`)
    REFERENCES `DB_Assignment`.`PATIENT RECORD` (`Record_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PATIENT RECORD_has_PATIENT RECORD_PATIENT RECORD2`
    FOREIGN KEY (`PATIENT RECORD_Record_id1`)
    REFERENCES `DB_Assignment`.`PATIENT RECORD` (`Record_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB_Assignment`.`DO_TEST`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_Assignment`.`DO_TEST` (
  `PATIENT RECORD_Record_id` INT NOT NULL,
  `TEST_Test_id` INT NOT NULL,
  `Result` VARCHAR(45) NULL,
  `Date` DATETIME NULL,
  PRIMARY KEY (`PATIENT RECORD_Record_id`, `TEST_Test_id`),
  INDEX `fk_PATIENT RECORD_has_TEST_TEST1_idx` (`TEST_Test_id` ASC) VISIBLE,
  INDEX `fk_PATIENT RECORD_has_TEST_PATIENT RECORD1_idx` (`PATIENT RECORD_Record_id` ASC) VISIBLE,
  CONSTRAINT `fk_PATIENT RECORD_has_TEST_PATIENT RECORD1`
    FOREIGN KEY (`PATIENT RECORD_Record_id`)
    REFERENCES `DB_Assignment`.`PATIENT RECORD` (`Record_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PATIENT RECORD_has_TEST_TEST1`
    FOREIGN KEY (`TEST_Test_id`)
    REFERENCES `DB_Assignment`.`TEST` (`Test_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB_Assignment`.`CARE_FOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_Assignment`.`CARE_FOR` (
  `NURSE_Employee_id` INT NOT NULL,
  `PATIENT RECORD_Record_id` INT NOT NULL,
  `Start_date` DATETIME NULL,
  `End_date` DATETIME NULL,
  PRIMARY KEY (`NURSE_Employee_id`, `PATIENT RECORD_Record_id`),
  INDEX `fk_NURSE_has_PATIENT RECORD_PATIENT RECORD1_idx` (`PATIENT RECORD_Record_id` ASC) VISIBLE,
  INDEX `fk_NURSE_has_PATIENT RECORD_NURSE1_idx` (`NURSE_Employee_id` ASC) VISIBLE,
  CONSTRAINT `fk_NURSE_has_PATIENT RECORD_NURSE1`
    FOREIGN KEY (`NURSE_Employee_id`)
    REFERENCES `DB_Assignment`.`NURSE` (`Employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_NURSE_has_PATIENT RECORD_PATIENT RECORD1`
    FOREIGN KEY (`PATIENT RECORD_Record_id`)
    REFERENCES `DB_Assignment`.`PATIENT RECORD` (`Record_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
