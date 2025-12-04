USE happy_country;
CREATE TABLE IF NOT EXISTS `happiness` (
	`Country_ID` INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
	`country` VARCHAR(255) NOT NULL UNIQUE,
	`Score` DECIMAL NOT NULL,
	`Overall_rank` INTEGER NOT NULL,
	`Social_support` DECIMAL NOT NULL,
	`Healthy_life_expectancy` DECIMAL NOT NULL,
	`Freedom_to_make_life_choices` DECIMAL NOT NULL,
	`Generosity` DECIMAL NOT NULL,
	`Perceptions_of_corruption` DECIMAL NOT NULL,
	PRIMARY KEY(`Country_ID`)
);


CREATE TABLE IF NOT EXISTS `economy` (
	`country` VARCHAR(255) NOT NULL UNIQUE,
	`population(mil.)` DECIMAL NOT NULL,
	`GDP_per_capita` DECIMAL NOT NULL,
	`real_consumption_per_capita` DECIMAL NOT NULL,
	`human_capital_index` DECIMAL NOT NULL,
	`av_Working_h` INTEGER NOT NULL,
	PRIMARY KEY(`country`)
);


ALTER TABLE `happiness`
ADD FOREIGN KEY(`country`) REFERENCES `economy`(`country`)
ON UPDATE NO ACTION ON DELETE NO ACTION;