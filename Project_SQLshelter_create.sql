
-- CREATE DATABASE
CREATE DATABASE Suzis_Quaint_Lounge_Shelter;
USE Suzis_Quaint_Lounge_Shelter;

-- CREATE TABLES AND SET RELATIONS
CREATE TABLE Shelters (
shelter_id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(50) NOT NULL,
location VARCHAR(50),
capacity VARCHAR(50),
budget DECIMAL(12,4),
CONSTRAINT PK_Shelters PRIMARY KEY (shelter_id));

CREATE TABLE Employees (
employee_id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(50) NOT NULL,
surname VARCHAR(50) NOT NULL,
phone_number VARCHAR(50),
CONSTRAINT PK_Employees PRIMARY KEY (employee_id));

CREATE TABLE Animals (
animal_id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(50) NOT NULL,
date_of_birth DATE,
availability ENUM('rehomed','reserved','available') DEFAULT 'available',
CONSTRAINT PK_Animals PRIMARY KEY (animal_id));

CREATE TABLE Breeds (
breed_id INT NOT NULL AUTO_INCREMENT,
species_type ENUM('dog','cat','small_animal','other') NOT NULL,
name VARCHAR(50) NOT NULL,
PRIMARY KEY (breed_id));

CREATE TABLE Customer (
customer_id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(50) NOT NULL,
surname VARCHAR(50) NOT NULL,
contact VARCHAR(50) NOT NULL,
PRIMARY KEY (customer_id));

-- CREATE JUNCTION TABLES
CREATE TABLE Management (
shelter_id INT NOT NULL,
employee_id INT NOT NULL,
animal_id INT NOT NULL,
CONSTRAINT PK_Management PRIMARY KEY (animal_id),
FOREIGN KEY (shelter_id) REFERENCES Shelters(shelter_id),
FOREIGN KEY (employee_id) REFERENCES Employees(employee_id),
FOREIGN KEY (animal_id) REFERENCES Animals(animal_id));

CREATE TABLE Description (
animal_id INT NOT NULL,
breed_id INT NOT NULL,
PRIMARY KEY (animal_id),
FOREIGN KEY (animal_id) REFERENCES Animals(animal_id),
FOREIGN KEY (breed_id) REFERENCES Breeds(breed_id));

CREATE TABLE Interest (
animal_id INT NOT NULL,
customer_id INT NOT NULL,
PRIMARY KEY (animal_id, customer_id),
FOREIGN KEY (animal_id) REFERENCES Animals(animal_id),
FOREIGN KEY (customer_id) REFERENCES Customer(customer_id));

CREATE TABLE Adoption (
animal_id INT NOT NULL,
customer_id INT NOT NULL,
date_of_adoption DATE NOT NULL,
PRIMARY KEY (animal_id),
FOREIGN KEY (animal_id) REFERENCES Animals(animal_id),
FOREIGN KEY (customer_id) REFERENCES Customer(customer_id));

INSERT INTO Shelters (name, location, capacity, budget)
VALUES
('Battersea', 'London', 100, 500000),
('Old Windsor','Berkshire',80, 400000),
('Brands Hatch','Kent',85,400000);

INSERT INTO Employees (name, surname, phone_number)
VALUES
('Ron','Weasley','07122365956'),
('Harry','Potter','07122368756'),
('Seamus','Finnigan','07122123956'),
('Hermine','Granger','07145665956'),
('Ginni','Weasley','07122369646'),
('Dudley','Dursley','07122367775'),
('Tom','Riddle','I-AM-LORD-VOLDEMORT'),
('Minerva','McGonagall','07122367789'),
('Rubeus','Hagrid','07122345656'),
('Bellatrix','Lestrange','07667365956');

-- Animal names and DOB imported from 'animals.csv' file using the impor wizard

INSERT INTO Breeds (species_type,name)
VALUES
('dog','Dalmatian'),
('dog','Siberian Husky'),
('dog','Boston Terrier'),
('dog','Akita Inu'),
('dog','Poodle'),
('dog','French Terrier'),
('dog','Pomeranian'),
('dog','Dachshund'),
('dog','Australian Shepherd'),
('dog','Keeshond'),
('cat','Russian Blue'),
('cat','Ragdoll'),
('cat','Norwegian Forest'),
('cat','Persian'),
('cat','Sphynx'),
('cat','Maine Coon'),
('cat','British shorthair'),
('cat','Turkish Angora'),
('cat','Egyptian Mau'),
('cat','Bengal'),
('small_animal','Bunny'),
('small_animal','Mouse'),
('small_animal','Rat'),
('small_animal','Budgie'),
('small_animal','Gerbil'),
('small_animal','Tarantula'),
('small_animal','Python'),
('small_animal','Hamster'),
('small_animal','Chincilla'),
('small_animal','Ferret'),
('other','Fish'),
('other','Alligator'),
('other','Ocelot');

INSERT INTO Customer (name,surname,contact)
VALUES
('Bilbo','Baggins','bilbo.baggins@middleearth.com'),
('Frodo','Baggins','frodo.baggins@middleearth.com'),
('Legolas','Elvish','legolas@middleearth.com'),
('Aragorn','King of Gondor','aragorn@gondor.com'),
('Samwise','Gamgee','samwise@middleearth.com'),
('Galadriel','Elvish','galadriel@mysterious.com'),
('Eowyn','Human','eowyn@rohan.com'),
('Arwen','Elvish','arwen@gondor.com'),
('Gimli','Son of Gloin','gimli@middleearth.com'),
('Boromir','Human','boromir@gondor.com'),
('Gandalf','The Grey','gandalf@magic.com');

-- Management loaded from 'management.csv', description loaded from 'description.csv'
SELECT * FROM adoption;
INSERT INTO adoption (animal_id,customer_id,date_of_adoption)
VALUES
(114,9,'2020-04-04'),
(80,9,'2020-04-10'),
(45,10,'2020-01-15'),
(33,6,'2020-02-28'),
(145,3,'2020-05-19'),
(51,1,'2020-06-01');

INSERT INTO interest (animal_id,customer_id)
VALUES
(53,9),
(21,2),
(89,6),
(150,8),
(15,4),
(38,5),
(96,5),
(136,7),
(2,10),
(99,3),
(15,2),
(53,11);

-- POPULATE 'availability' COLUMN IN 'animals' TABLE BASED ON 'interest' AND 'adoption' TABLES
DELIMITER //
CREATE PROCEDURE update_availability()
BEGIN	
    SET @start = 1;
    SET @end = (select MAX(animal_id) from animals);    
    WHILE @start <= @end DO
		SET @interest = (SELECT COUNT(*) FROM interest i WHERE i.animal_id = @start);
		SET @adoption = (SELECT COUNT(*) FROM adoption a WHERE a.animal_id = @start);    
		IF (@interest <> 0 AND @adoption = 0) THEN
			UPDATE animals
			SET availability = 'reserved'
			WHERE animal_id = @start;
		ELSEIF @adoption <> 0 THEN
			UPDATE animals
			SET availability = 'rehomed'
			WHERE animal_id = @start;
		ELSE 
			UPDATE animals
			SET availability = 'available'
			WHERE animal_id = @start;
		END IF; 
		SET @start = @start + 1;
    END WHILE;   
END //
DELIMITER ;

START TRANSACTION;
CALL update_availability();
COMMIT;
