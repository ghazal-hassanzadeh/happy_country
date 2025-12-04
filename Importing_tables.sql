-- Checking happiness table
SELECT COUNT(*) FROM happiness;
SELECT * FROM happiness LIMIT 10;

-- Checking economy table
SELECT COUNT(*) FROM economy;
SELECT * FROM economy LIMIT 10;

-- Understanding our table structure
DESCRIBE happiness;
DESCRIBE economy;

-- Joining 2 tables
SELECT *
FROM happiness AS h
JOIN economy As e
    ON h.country = e.country;


-- checking column types:
DESCRIBE happiness;

-- changing column types because of the error that we get
USE happy_country;

ALTER TABLE happiness
MODIFY Score DECIMAL(5,3),
MODIFY Social_support DECIMAL(5,3),
MODIFY Healthy_life_expectancy DECIMAL(5,3),
MODIFY Freedom_to_make_life_choices DECIMAL(5,3),
MODIFY Generosity DECIMAL(5,3),
MODIFY Perceptions_of_corruption DECIMAL(5,3);

-- now that the types are altered We delete the table info again and import it again
USE happy_country;
TRUNCATE TABLE happiness;

-- checking
SELECT * FROM happiness LIMIT 10;
SELECT * FROM economy LIMIT 20;

-- now we have to clean economy data type as well
DESCRIBE economy;


USE happy_country;

ALTER TABLE economy
MODIFY `population(mil.)` DECIMAL(10,3),
MODIFY GDP_per_capita DECIMAL(12,2),
MODIFY real_consumption_per_capita DECIMAL(12,2),
MODIFY human_capital_index DECIMAL(5,3);

-- deleting incorrect values and importing the dataset once again
TRUNCATE TABLE economy;
-- fixing error 1701:can't truncate a table refernce because of the foreign key
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE economy;
SET FOREIGN_KEY_CHECKS = 1;

-- reimporting economy table
SELECT * FROM economy LIMIT 10;