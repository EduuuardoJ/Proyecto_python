-- Table structure for table `airlines`
DROP TABLE IF EXISTS `airlines`;
CREATE TABLE `airlines` (
    `carrier_id` INT NOT NULL AUTO_INCREMENT,
    `carrier` VARCHAR(10) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`carrier_id`)
);

-- Table structure for table `airport`
DROP TABLE IF EXISTS `airport`;
CREATE TABLE `airport` (
    `airport_id` INT NOT NULL AUTO_INCREMENT,
    `airport` VARCHAR(10) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `lat` DECIMAL(10, 8) NOT NULL,
    `lon` DECIMAL(11, 8) NOT NULL,
    `alt` INT NOT NULL,
    `tz` INT NOT NULL,
    `dst` VARCHAR(1) NOT NULL,
    `tzone` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`airport_id`)
);

-- Table structure for table `planes`
DROP TABLE IF EXISTS `planes`;
CREATE TABLE `planes` (
    `tailnum_id` INT NOT NULL AUTO_INCREMENT,
    `tailnum` VARCHAR(10) NOT NULL,
    `year` INT NOT NULL,
    `type` VARCHAR(255) NOT NULL,
    `manufacturer` VARCHAR(255) NOT NULL,
    `model` VARCHAR(255) NOT NULL,
    `engines` INT NOT NULL,
    `seats` INT NOT NULL,
    `speed` INT NOT NULL,
    `engine` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`tailnum_id`)
);

-- Table structure for table `weather`
DROP TABLE IF EXISTS `weather`;
CREATE TABLE `weather` (
    `weather_id` INT NOT NULL AUTO_INCREMENT,
    `origin` VARCHAR(10) NOT NULL,
    `year` INT NOT NULL,
    `month` INT NOT NULL,
    `day` INT NOT NULL,
    `hour` INT NOT NULL,
    `temp` DECIMAL(5, 2) NOT NULL,
    `dewp` DECIMAL(5, 2) NOT NULL,
    `humid` DECIMAL(5, 2) NOT NULL,
    `wind_dir` INT NOT NULL,
    `wind_speed` DECIMAL(5, 2) NOT NULL,
    `wind_gust` DECIMAL(5, 2) NOT NULL,
    `precip` DECIMAL(5, 2) NOT NULL,
    `pressure` DECIMAL(5, 2) NOT NULL,
    `visib` DECIMAL(5, 2) NOT NULL,
    `time_hour` DATETIME(3) NOT NULL,
    PRIMARY KEY (`weather_id`)
);

ALTER TABLE airlines ADD INDEX idx_carrier (carrier);
ALTER TABLE airport ADD INDEX idx_airport (airport);
ALTER TABLE planes ADD INDEX idx_tailnum (tailnum);
ALTER TABLE weather ADD INDEX idx_weather (year, month, day, hour, origin);

-- Table structure for table `flights`
DROP TABLE IF EXISTS `flights`;
CREATE TABLE `flights` (
    `year` INT NOT NULL,
    `month` INT NOT NULL,
    `day` INT NOT NULL,
    `dep_time` INT NOT NULL,
    `sched_dep_time` INT NOT NULL,
    `dep_delay` INT NOT NULL,
    `arr_time` INT NOT NULL,
    `sched_arr_time` INT NOT NULL,
    `arr_delay` INT NOT NULL,
    `carrier` VARCHAR(10) NOT NULL,
    `flight` INT NOT NULL,
    `tailnum` VARCHAR(10) NOT NULL,
    `origin` VARCHAR(10) NOT NULL,
    `airport` VARCHAR(10) NOT NULL,
    `air_time` INT NOT NULL,
    `distance` INT NOT NULL,
    `hour` INT NOT NULL,
    `minute` INT NOT NULL,
    `time_hour` DATETIME(3) NOT NULL,
    FOREIGN KEY (`carrier`) REFERENCES `airlines`(`carrier`),
    FOREIGN KEY (`airport`) REFERENCES `airport`(`airport`),
    FOREIGN KEY (`tailnum`) REFERENCES `planes`(`tailnum`),
    FOREIGN KEY (`year`, `month`, `day`, `hour`, `origin`) REFERENCES `weather`(`year`, `month`, `day`, `hour`, `origin`)
) ;


-- SELECT

SELECT * FROM airlines
SELECT * FROM planes
SELECT * FROM airport
SELECT * FROM weather
SELECT * FROM flights
SELECT * FROM airport
limit 10
