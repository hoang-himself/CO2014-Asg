-- -----------------------------------------------------
-- Table "TEST"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "TEST" (
  "Test_id" INT NOT NULL,
  "Test_name" VARCHAR(45) NULL,
  "Description" VARCHAR(45) NULL,
  PRIMARY KEY ("Test_id")
);

-- -----------------------------------------------------
-- Table "DEPARTMENT"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "DEPARTMENT" (
  "Department_id" INT NOT NULL,
  "DepartmentName" VARCHAR(45) NULL,
  "Location" VARCHAR(45) NULL,
  PRIMARY KEY ("Department_id")
);

-- -----------------------------------------------------
-- Table "DOCTOR"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "DOCTOR" (
  "Employee_id" INT NOT NULL,
  "Degree" VARCHAR(45) NULL,
  "Experience" INT NULL,
  "Specialty" VARCHAR(45) NULL,
  "Certificate_no" INT NULL,
  "DEPARTMENT_Department_id" INT NOT NULL,
  PRIMARY KEY ("Employee_id"),
  CONSTRAINT "fk_DOCTOR_DEPARTMENT" FOREIGN KEY ("DEPARTMENT_Department_id") REFERENCES "DEPARTMENT" ("Department_id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE INDEX "fk_DOCTOR_DEPARTMENT_idx" ON "DOCTOR" ("DEPARTMENT_Department_id" ASC);

-- -----------------------------------------------------
-- Table "NURSE"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "NURSE" (
  "Employee_id" INT NOT NULL,
  "Certificate_no" INT NULL,
  "Experience" INT NULL,
  PRIMARY KEY ("Employee_id")
);

-- -----------------------------------------------------
-- Table "TECHNICIAN"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "TECHNICIAN" (
  "Employee_id" INT NOT NULL,
  "Specialty" VARCHAR(45) NULL,
  PRIMARY KEY ("Employee_id")
);

-- -----------------------------------------------------
-- Table "RECEPTIONIST"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "RECEPTIONIST" (
  "Employee_id" INT NOT NULL,
  "Shift" TIMESTAMP NULL,
  PRIMARY KEY ("Employee_id")
);

-- -----------------------------------------------------
-- Table "DRIVER"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "DRIVER" (
  "Employee_id" INT NOT NULL,
  "Driver_license" INT NULL,
  PRIMARY KEY ("Employee_id")
);

-- -----------------------------------------------------
-- Table "PATIENT RECORD"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "PATIENT RECORD" (
  "Record_id" INT NOT NULL,
  "Patient_id" INT NULL,
  "First_name" VARCHAR(45) NULL,
  "Last_name" VARCHAR(45) NULL,
  "Gender" SMALLINT NULL,
  "Dob" TIMESTAMP NULL,
  "Address" VARCHAR(45) NULL,
  "Diagnosis" VARCHAR(45) NULL,
  "Medical_background" VARCHAR(45) NULL,
  "Start_date" TIMESTAMP NULL,
  "End_date" TIMESTAMP NULL,
  "DOCTOR_Employee_id" INT NOT NULL,
  PRIMARY KEY ("Record_id"),
  CONSTRAINT "fk_PATIENT RECORD_DOCTOR1" FOREIGN KEY ("DOCTOR_Employee_id") REFERENCES "DOCTOR" ("Employee_id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE INDEX "fk_PATIENT RECORD_DOCTOR1_idx" ON "PATIENT RECORD" ("DOCTOR_Employee_id" ASC);

-- -----------------------------------------------------
-- Table "APPOINTMENT RECORD"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "APPOINTMENT RECORD" (
  "Record_id" INT NOT NULL,
  "Date" TIMESTAMP NULL,
  "Time" TIMESTAMP NULL,
  "PATIENT RECORD_Record_id" INT NOT NULL,
  "RECEPTIONIST_Employee_id" INT NOT NULL,
  PRIMARY KEY ("Record_id"),
  CONSTRAINT "fk_APPOINTMENT RECORD_PATIENT RECORD1" FOREIGN KEY ("PATIENT RECORD_Record_id") REFERENCES "PATIENT RECORD" ("Record_id") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "fk_APPOINTMENT RECORD_RECEPTIONIST1" FOREIGN KEY ("RECEPTIONIST_Employee_id") REFERENCES "RECEPTIONIST" ("Employee_id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE INDEX "fk_APPOINTMENT RECORD_RECEPTIONIST1_idx" ON "APPOINTMENT RECORD" ("RECEPTIONIST_Employee_id" ASC);

CREATE INDEX "fk_APPOINTMENT RECORD_PATIENT RECORD1_idx" ON "APPOINTMENT RECORD" ("PATIENT RECORD_Record_id" ASC);

-- -----------------------------------------------------
-- Table "ROOM"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "ROOM" (
  "Room_id" INT NOT NULL,
  "No_of_beds" INT NULL,
  "Room_type" VARCHAR(45) NULL,
  "DEPARTMENT_Department_id" INT NOT NULL,
  PRIMARY KEY ("Room_id"),
  CONSTRAINT "fk_ROOM_DEPARTMENT1" FOREIGN KEY ("DEPARTMENT_Department_id") REFERENCES "DEPARTMENT" ("Department_id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE INDEX "fk_ROOM_DEPARTMENT1_idx" ON "ROOM" ("DEPARTMENT_Department_id" ASC);

-- -----------------------------------------------------
-- Table "MEDICAL EQUIPMENT"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "MEDICAL EQUIPMENT" (
  "Equipment_id" INT NOT NULL,
  "Equipment_type" VARCHAR(45) NULL,
  "Bought_day" TIMESTAMP NULL,
  "ROOM_Room_id" INT NOT NULL,
  "TECHNICIAN_Employee_id" INT NOT NULL,
  PRIMARY KEY ("Equipment_id"),
  CONSTRAINT "fk_MEDICAL EQUIPMENT_ROOM1" FOREIGN KEY ("ROOM_Room_id") REFERENCES "ROOM" ("Room_id") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "fk_MEDICAL EQUIPMENT_TECHNICIAN1" FOREIGN KEY ("TECHNICIAN_Employee_id") REFERENCES "TECHNICIAN" ("Employee_id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE INDEX "fk_MEDICAL EQUIPMENT_TECHNICIAN1_idx" ON "MEDICAL EQUIPMENT" ("TECHNICIAN_Employee_id" ASC);

CREATE INDEX "fk_MEDICAL EQUIPMENT_ROOM1_idx" ON "MEDICAL EQUIPMENT" ("ROOM_Room_id" ASC);

-- -----------------------------------------------------
-- Table "AMBULANCE"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "AMBULANCE" (
  "Car_number" INT NOT NULL,
  "Licence_plate" INT NULL,
  "DRIVER_Employee_id" INT NOT NULL,
  PRIMARY KEY ("Car_number"),
  CONSTRAINT "fk_AMBULANCE_DRIVER1" FOREIGN KEY ("DRIVER_Employee_id") REFERENCES "DRIVER" ("Employee_id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE INDEX "fk_AMBULANCE_DRIVER1_idx" ON "AMBULANCE" ("DRIVER_Employee_id" ASC);

-- -----------------------------------------------------
-- Table "PRESCRIPTION"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "PRESCRIPTION" (
  "Prescription_id" INT NOT NULL,
  "Date" TIMESTAMP NULL,
  "PATIENT RECORD_Record_id" INT NOT NULL,
  PRIMARY KEY ("Prescription_id"),
  CONSTRAINT "fk_PRESCRIPTION_PATIENT RECORD1" FOREIGN KEY ("PATIENT RECORD_Record_id") REFERENCES "PATIENT RECORD" ("Record_id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE INDEX "fk_PRESCRIPTION_PATIENT RECORD1_idx" ON "PRESCRIPTION" ("PATIENT RECORD_Record_id" ASC);

-- -----------------------------------------------------
-- Table "MEDICINE"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "MEDICINE" (
  "Medicine_id" INT NOT NULL,
  "Brand_name" VARCHAR(45) NULL,
  "Generic_name" VARCHAR(45) NULL,
  "Description" VARCHAR(45) NULL,
  PRIMARY KEY ("Medicine_id")
);

-- -----------------------------------------------------
-- Table "PAYMENT"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "PAYMENT" (
  "Payment_id" INT NOT NULL,
  "Amount" FLOAT NULL,
  "Payment_method" VARCHAR(45) NULL,
  "Date" TIMESTAMP NULL,
  "PATIENT RECORD_Record_id" INT NOT NULL,
  PRIMARY KEY ("Payment_id"),
  CONSTRAINT "fk_PAYMENT_PATIENT RECORD1" FOREIGN KEY ("PATIENT RECORD_Record_id") REFERENCES "PATIENT RECORD" ("Record_id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE INDEX "fk_PAYMENT_PATIENT RECORD1_idx" ON "PAYMENT" ("PATIENT RECORD_Record_id" ASC);

-- -----------------------------------------------------
-- Table "TREATMENT"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "TREATMENT" (
  "Treatment_id" INT NOT NULL,
  "Treatment_name" VARCHAR(45) NULL,
  "Requirement" VARCHAR(45) NULL,
  "Description" VARCHAR(45) NULL,
  PRIMARY KEY ("Treatment_id")
);

-- -----------------------------------------------------
-- Table "EMPLOYEE"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "EMPLOYEE" (
  "Employee_id" INT NOT NULL,
  "FirstName" VARCHAR(45) NULL,
  "LastName" VARCHAR(45) NULL,
  "Gender" SMALLINT NULL,
  "DOB" TIMESTAMP NULL,
  "Address" VARCHAR(45) NULL,
  "Salary" INT NULL,
  PRIMARY KEY ("Employee_id")
);

-- -----------------------------------------------------
-- Table "EQUIPMENT_MAINTENANCE_DATE"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "EQUIPMENT_MAINTENANCE_DATE" (
  "Date" INT NOT NULL,
  "MEDICAL EQUIPMENT_Equipment_id" INT NOT NULL,
  PRIMARY KEY ("Date", "MEDICAL EQUIPMENT_Equipment_id"),
  CONSTRAINT "fk_EQUIPMENT_MAINTENANCE_DATE_MEDICAL EQUIPMENT1" FOREIGN KEY ("MEDICAL EQUIPMENT_Equipment_id") REFERENCES "MEDICAL EQUIPMENT" ("Equipment_id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE INDEX "fk_EQUIPMENT_MAINTENANCE_DATE_MEDICAL EQUIPMENT1_idx" ON "EQUIPMENT_MAINTENANCE_DATE" ("MEDICAL EQUIPMENT_Equipment_id" ASC);

-- -----------------------------------------------------
-- Table "STAY_IN"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "STAY_IN" (
  "PATIENT RECORD_Record_id" INT NOT NULL,
  "ROOM_Room_id" INT NOT NULL,
  "Bed_number" INT NULL,
  "Day_in" TIMESTAMP NULL,
  "Day_out" TIMESTAMP NULL,
  PRIMARY KEY ("PATIENT RECORD_Record_id", "ROOM_Room_id"),
  CONSTRAINT "fk_PATIENT RECORD_has_ROOM_PATIENT RECORD1" FOREIGN KEY ("PATIENT RECORD_Record_id") REFERENCES "PATIENT RECORD" ("Record_id") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "fk_PATIENT RECORD_has_ROOM_ROOM1" FOREIGN KEY ("ROOM_Room_id") REFERENCES "ROOM" ("Room_id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE INDEX "fk_PATIENT RECORD_has_ROOM_PATIENT RECORD1_idx" ON "STAY_IN" ("PATIENT RECORD_Record_id" ASC);

CREATE INDEX "fk_PATIENT RECORD_has_ROOM_ROOM1_idx" ON "STAY_IN" ("ROOM_Room_id" ASC);

-- -----------------------------------------------------
-- Table "LIST"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "LIST" (
  "PRESCRIPTION_Prescription_id" INT NOT NULL,
  "MEDICINE_Medicine_id" INT NOT NULL,
  "Dose" VARCHAR(45) NULL,
  PRIMARY KEY (
    "PRESCRIPTION_Prescription_id",
    "MEDICINE_Medicine_id"
  ),
  CONSTRAINT "fk_PRESCRIPTION_has_MEDICINE_PRESCRIPTION1" FOREIGN KEY ("PRESCRIPTION_Prescription_id") REFERENCES "PRESCRIPTION" ("Prescription_id") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "fk_PRESCRIPTION_has_MEDICINE_MEDICINE1" FOREIGN KEY ("MEDICINE_Medicine_id") REFERENCES "MEDICINE" ("Medicine_id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE INDEX "fk_PRESCRIPTION_has_MEDICINE_PRESCRIPTION1_idx" ON "LIST" ("PRESCRIPTION_Prescription_id" ASC);

CREATE INDEX "fk_PRESCRIPTION_has_MEDICINE_MEDICINE1_idx" ON "LIST" ("MEDICINE_Medicine_id" ASC);

-- -----------------------------------------------------
-- Table "TAKE_TREATMENT"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "TAKE_TREATMENT" (
  "PATIENT RECORD_Record_id" INT NOT NULL,
  "TREATMENT_Treatment_id" INT NOT NULL,
  "Date" TIMESTAMP NULL,
  PRIMARY KEY (
    "PATIENT RECORD_Record_id",
    "TREATMENT_Treatment_id"
  ),
  CONSTRAINT "fk_PATIENT RECORD_has_TREATMENT_PATIENT RECORD1" FOREIGN KEY ("PATIENT RECORD_Record_id") REFERENCES "PATIENT RECORD" ("Record_id") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "fk_PATIENT RECORD_has_TREATMENT_TREATMENT1" FOREIGN KEY ("TREATMENT_Treatment_id") REFERENCES "TREATMENT" ("Treatment_id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE INDEX "fk_PATIENT RECORD_has_TREATMENT_PATIENT RECORD1_idx" ON "TAKE_TREATMENT" ("PATIENT RECORD_Record_id" ASC);

CREATE INDEX "fk_PATIENT RECORD_has_TREATMENT_TREATMENT1_idx" ON "TAKE_TREATMENT" ("TREATMENT_Treatment_id" ASC);

-- -----------------------------------------------------
-- Table "PATIENT RECORD_has_PATIENT RECORD"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "PATIENT RECORD_has_PATIENT RECORD" (
  "PATIENT RECORD_Record_id" INT NOT NULL,
  "PATIENT RECORD_Record_id1" INT NOT NULL,
  PRIMARY KEY (
    "PATIENT RECORD_Record_id",
    "PATIENT RECORD_Record_id1"
  ),
  CONSTRAINT "fk_PATIENT RECORD_has_PATIENT RECORD_PATIENT RECORD1" FOREIGN KEY ("PATIENT RECORD_Record_id") REFERENCES "PATIENT RECORD" ("Record_id") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "fk_PATIENT RECORD_has_PATIENT RECORD_PATIENT RECORD2" FOREIGN KEY ("PATIENT RECORD_Record_id1") REFERENCES "PATIENT RECORD" ("Record_id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE INDEX "fk_PATIENT RECORD_has_PATIENT RECORD_PATIENT RECORD1_idx" ON "PATIENT RECORD_has_PATIENT RECORD" ("PATIENT RECORD_Record_id" ASC);

CREATE INDEX "fk_PATIENT RECORD_has_PATIENT RECORD_PATIENT RECORD2_idx" ON "PATIENT RECORD_has_PATIENT RECORD" ("PATIENT RECORD_Record_id1" ASC);

-- -----------------------------------------------------
-- Table "DO_TEST"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "DO_TEST" (
  "PATIENT RECORD_Record_id" INT NOT NULL,
  "TEST_Test_id" INT NOT NULL,
  "Result" VARCHAR(45) NULL,
  "Date" TIMESTAMP NULL,
  PRIMARY KEY ("PATIENT RECORD_Record_id", "TEST_Test_id"),
  CONSTRAINT "fk_PATIENT RECORD_has_TEST_PATIENT RECORD1" FOREIGN KEY ("PATIENT RECORD_Record_id") REFERENCES "PATIENT RECORD" ("Record_id") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "fk_PATIENT RECORD_has_TEST_TEST1" FOREIGN KEY ("TEST_Test_id") REFERENCES "TEST" ("Test_id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE INDEX "fk_PATIENT RECORD_has_TEST_PATIENT RECORD1_idx" ON "DO_TEST" ("PATIENT RECORD_Record_id" ASC);

CREATE INDEX "fk_PATIENT RECORD_has_TEST_TEST1_idx" ON "DO_TEST" ("TEST_Test_id" ASC);

-- -----------------------------------------------------
-- Table "CARE_FOR"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "CARE_FOR" (
  "NURSE_Employee_id" INT NOT NULL,
  "PATIENT RECORD_Record_id" INT NOT NULL,
  "Start_date" TIMESTAMP NULL,
  "End_date" TIMESTAMP NULL,
  PRIMARY KEY ("NURSE_Employee_id", "PATIENT RECORD_Record_id"),
  CONSTRAINT "fk_NURSE_has_PATIENT RECORD_NURSE1" FOREIGN KEY ("NURSE_Employee_id") REFERENCES "NURSE" ("Employee_id") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "fk_NURSE_has_PATIENT RECORD_PATIENT RECORD1" FOREIGN KEY ("PATIENT RECORD_Record_id") REFERENCES "PATIENT RECORD" ("Record_id") ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE INDEX "fk_NURSE_has_PATIENT RECORD_NURSE1_idx" ON "CARE_FOR" ("NURSE_Employee_id" ASC);

CREATE INDEX "fk_NURSE_has_PATIENT RECORD_PATIENT RECORD1_idx" ON "CARE_FOR" ("PATIENT RECORD_Record_id" ASC);
