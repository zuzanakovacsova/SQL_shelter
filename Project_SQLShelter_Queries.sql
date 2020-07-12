-- VIEW AMOUNT OF ANIMALS PER SHELTER
CREATE VIEW shelter_capacity_summary AS 
SELECT sh.name, sh.location, sh.capacity, COUNT(m.animal_id) as animal_amount
FROM shelters sh LEFT JOIN management m ON sh.shelter_id = m.shelter_id
WHERE m.animal_id IN (
	SELECT a.animal_id FROM animals a 
    WHERE a.availability <> 'rehomed')
GROUP BY m.shelter_id;

DELIMITER //
CREATE FUNCTION is_full (capacity INT, animal_amount INT)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
	DECLARE space_available VARCHAR(50);
    DECLARE difference INT;
    IF animal_amount < capacity THEN
		SET difference = capacity - animal_amount;
		SET space_available = CONCAT(difference, ' spaces available');
	ELSE
		SET space_available = 'Shelter full';
	END IF;
    RETURN (space_available);
END//capacity
DELIMITER ;

-- CHECK IF SHELTER FULL
SELECT name, location, is_full(capacity, animal_amount) as availability FROM shelter_capacity_summary
ORDER BY availability DESC;

-- CHECK IN WHICH SHELTER EMPLOYEE WORKS AND HOW MANY ANIMALS THEY LOOK AFTER
CREATE VIEW employee_tasks AS
SELECT e.name, e.surname, sh.name AS shelter_name, COUNT(m.animal_id) as animal_amount
FROM employees e 
INNER JOIN management m ON e.employee_id = m.employee_id
INNER JOIN shelters sh ON sh.shelter_id = m.shelter_id
GROUP BY e.employee_id;

-- CHECK IF ANIMAL DANGEROUS 
DELIMITER //
CREATE FUNCTION animal_danger (breed VARCHAR(50))
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    DECLARE danger VARCHAR(50);
    IF breed IN ('Tarantula','Python','Ocelot','Alligator') THEN
		SET danger = 'Dangerous animal';
	ELSE
		SET danger = 'No warning';
	END IF;
    RETURN (danger);
END//danger
DELIMITER ;

-- DANGEROUS ANIMAL ADOPTION 
CREATE VIEW dangerous_animal_summary AS 
SELECT a.animal_id, a.name, b.name AS breed, animal_danger(b.name) AS warning, c.name AS customer_name, c.surname AS customer_surname, c.contact 
FROM animals a
INNER JOIN description d ON d.animal_id = a.animal_id
INNER JOIN breeds b ON b.breed_id = d.breed_id
LEFT JOIN adoption ad ON ad.animal_id = a.animal_id -- I IF DO INNER JOIN, ONLY GET THE ADOPTED ANIMALS
LEFT JOIN customer c ON c.customer_id = ad.customer_id
GROUP BY a.animal_id
HAVING warning = 'Dangerous animal'
ORDER BY customer_name DESC;

-- FIND IF ANYONE IS INTERESTED IN DANGEROUS ANIMALS
SELECT d.name, d.breed, c.name AS customer_name, c.surname AS customer_surname, c.contact
FROM dangerous_animal_summary d
LEFT JOIN interest i ON d.animal_id = i.animal_id 
LEFT JOIN customer c ON c.customer_id = i.customer_id
GROUP BY d.animal_id
ORDER BY customer_name DESC;

-- FIND ALL EMPLOYEES IN BATTERSEA 
SELECT e.name,  e.surname
FROM employees e
WHERE e.employee_id IN (
	SELECT m.employee_id
	FROM management m
	INNER JOIN shelters s ON s.shelter_id = m.shelter_id
	WHERE s.name = 'Battersea');

-- CHECK HOW MANY PEOPLE INTERESTED IN CERTAIN ANIMALS
SELECT a.animal_id, a.name, COUNT(c.customer_id) as interested_customer_amount
FROM animals a 
INNER JOIN interest i ON a.animal_id = i.animal_id
INNER JOIN customer c ON c.customer_id = i.customer_id
GROUP BY a.animal_id
ORDER BY interested_customer_amount DESC;

SELECT c.name, c.surname, c.contact
FROM customer c
WHERE c.customer_id IN (
	SELECT i.customer_id 
	FROM interest i 
	WHERE i.animal_id = 15);

-- CREATE TRIGGER WHEN ADOPTION TABLE UPDATED
DELIMITER //
CREATE TRIGGER update_rehomed
BEFORE INSERT ON adoption FOR EACH ROW
BEGIN
	UPDATE animals a
    SET a.availability = 'rehomed'
    WHERE a.animal_id = NEW.animal_id;
END; //
DELIMITER ;

INSERT INTO adoption (animal_id,customer_id, date_of_adoption)
VALUES
(7,4,'2020-07-09');

-- CREATE TRIGGER WHEN INTEREST TABLE UPDATED
DELIMITER //
CREATE TRIGGER update_reserved
BEFORE INSERT ON interest FOR EACH ROW
BEGIN
	UPDATE animals a
    SET a.availability = 'reserved'
    WHERE a.animal_id = NEW.animal_id;
END; //
DELIMITER ;

INSERT INTO interest (animal_id,customer_id)
VALUES
(113,7);

-- PROCEDURE TO SUMMARISE ANIMAL 
DELIMITER //
CREATE PROCEDURE animal_description (animal_id INT)
BEGIN 
	DECLARE descr VARCHAR(200);
    SET @name = (SELECT a.name FROM animals a WHERE a.animal_id = animal_id);
    SET @age = (SELECT YEAR(CURRENT_TIMESTAMP) - YEAR(a.date_of_birth) FROM animals a WHERE a.animal_id = animal_id);
    SET @species = (SELECT b.species_type FROM breeds b INNER JOIN description d ON b.breed_id = d.breed_id WHERE d.animal_id = animal_id);
    SET @breed = (SELECT b.name FROM breeds b INNER JOIN description d ON b.breed_id = d.breed_id WHERE d.animal_id = animal_id);
    SET @avail = (SELECT a.availability FROM animals a WHERE a.animal_id = animal_id);
    SET descr = CONCAT('The animal ',@name,' is a ',@species,', breed ',@breed,', it is ',@age,' years old and it is ',@avail,'.');
    SELECT descr;
END//
DELIMITER ;

CALL animal_description(75);

