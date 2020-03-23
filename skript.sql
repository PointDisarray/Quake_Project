DROP SCHEMA IF EXISTS `stats` ;

CREATE SCHEMA IF NOT EXISTS `stats` ;
USE `stats` ;

DROP TABLE IF EXISTS `stats`.`players` ;

CREATE TABLE IF NOT EXISTS `stats`.`players` (
  `id_player` TINYINT(1) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id_player`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC));

DROP TABLE IF EXISTS `stats`.`matches` ;

CREATE TABLE IF NOT EXISTS `stats`.`matches` (
  `id_match` TINYINT(1) UNSIGNED NOT NULL AUTO_INCREMENT,
  `datetime` TIMESTAMP NOT NULL,
  `map` VARCHAR(30) NOT NULL,
  `type` VARCHAR(5) NOT NULL,
  `isTeamGame` TINYINT(1) NOT NULL,
  `duration` DECIMAL(5) NOT NULL,
  PRIMARY KEY (`id_match`),
  UNIQUE INDEX `map_UNIQUE` (`map` ASC));

DROP TABLE IF EXISTS `stats`.`stats` ;

CREATE TABLE IF NOT EXISTS `stats`.`stats` (
  `id_stats` TINYINT(1) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `value` INT(5) NOT NULL,
  `players_id_player` TINYINT(1) UNSIGNED NOT NULL,
  `matches_id_match` TINYINT(1) UNSIGNED NOT NULL,
  PRIMARY KEY (`id_stats`, `matches_id_match`),
  INDEX `fk_stats_players1_idx` (`players_id_player` ASC),
  INDEX `fk_stats_matches1_idx` (`matches_id_match` ASC),
  CONSTRAINT `fk_stats_players1`
    FOREIGN KEY (`players_id_player`)
    REFERENCES `stats`.`players` (`id_player`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_stats_matches1`
    FOREIGN KEY (`matches_id_match`)
    REFERENCES `stats`.`matches` (`id_match`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

DROP TABLE IF EXISTS `stats`.`weapons` ;

CREATE TABLE IF NOT EXISTS `stats`.`weapons` (
  `id_weapons` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(5) NOT NULL,
  `hits` INT(4) NOT NULL,
  `shots` INT(4) NOT NULL,
  `kills` INT(3) NOT NULL,
  `players_id_player` TINYINT(1) UNSIGNED NOT NULL,
  `matches_id_match` TINYINT(1) UNSIGNED NOT NULL,
  PRIMARY KEY (`id_weapons`, `matches_id_match`),
  INDEX `fk_weapons_players1_idx` (`players_id_player` ASC),
  INDEX `fk_weapons_matches1_idx` (`matches_id_match` ASC),
  CONSTRAINT `fk_weapons_players1`
    FOREIGN KEY (`players_id_player`)
    REFERENCES `stats`.`players` (`id_player`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_weapons_matches1`
    FOREIGN KEY (`matches_id_match`)
    REFERENCES `stats`.`matches` (`id_match`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

DROP TABLE IF EXISTS `stats`.`items` ;

CREATE TABLE IF NOT EXISTS `stats`.`items` (
  `id_item` TINYINT(1) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(10) NOT NULL,
  `pickups` INT(3) NOT NULL,
  `players_id_player` TINYINT(1) UNSIGNED NOT NULL,
  `matches_id_match` TINYINT(1) UNSIGNED NOT NULL,
  PRIMARY KEY (`id_item`, `matches_id_match`),
  INDEX `fk_items_players1_idx` (`players_id_player` ASC),
  INDEX `fk_items_matches1_idx` (`matches_id_match` ASC),
  CONSTRAINT `fk_items_players1`
    FOREIGN KEY (`players_id_player`)
    REFERENCES `stats`.`players` (`id_player`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_items_matches1`
    FOREIGN KEY (`matches_id_match`)
    REFERENCES `stats`.`matches` (`id_match`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

DROP TABLE IF EXISTS `stats`.`powerups` ;

CREATE TABLE IF NOT EXISTS `stats`.`powerups` (
  `id_powerups` TINYINT(1) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(10) NOT NULL,
  `pickups` INT(3) NOT NULL,
  `time` INT(9) NOT NULL,
  `players_id_player` TINYINT(1) UNSIGNED NOT NULL,
  `matches_id_match` TINYINT(1) UNSIGNED NOT NULL,
  PRIMARY KEY (`id_powerups`, `matches_id_match`),
  INDEX `fk_powerups_players_idx` (`players_id_player` ASC),
  INDEX `fk_powerups_matches1_idx` (`matches_id_match` ASC),
  CONSTRAINT `fk_powerups_players`
    FOREIGN KEY (`players_id_player`)
    REFERENCES `stats`.`players` (`id_player`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_powerups_matches1`
    FOREIGN KEY (`matches_id_match`)
    REFERENCES `stats`.`matches` (`id_match`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

DROP TABLE IF EXISTS `stats`.`month_year` ;

CREATE TABLE IF NOT EXISTS `stats`.`month_year` (
  `id_month_year` TINYINT(1) UNSIGNED NOT NULL AUTO_INCREMENT,
  `year` VARCHAR(4) NOT NULL,
  `month` CHAR(2) NOT NULL,
  `day` CHAR(2) NOT NULL,
  PRIMARY KEY (`id_month_year`));

DROP TABLE IF EXISTS `stats`.`user_matches` ;

CREATE TABLE IF NOT EXISTS `stats`.`user_matches` (
  `id_user_relactions` TINYINT(1) UNSIGNED NOT NULL AUTO_INCREMENT,
  `players_id_player` TINYINT(1) UNSIGNED NOT NULL,
  `matches_id_match` TINYINT(1) UNSIGNED NOT NULL,
  `month_year_id_month_year` TINYINT(1) UNSIGNED NOT NULL,
  PRIMARY KEY (`id_user_relactions`),
  INDEX `fk_user_matches_players1_idx` (`players_id_player` ASC),
  INDEX `fk_user_matches_matches1_idx` (`matches_id_match` ASC),
  INDEX `fk_user_matches_month_year1_idx` (`month_year_id_month_year` ASC),
  CONSTRAINT `fk_user_matches_players1`
    FOREIGN KEY (`players_id_player`)
    REFERENCES `stats`.`players` (`id_player`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_user_matches_matches1`
    FOREIGN KEY (`matches_id_match`)
    REFERENCES `stats`.`matches` (`id_match`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_user_matches_month_year1`
    FOREIGN KEY (`month_year_id_month_year`)
    REFERENCES `stats`.`month_year` (`id_month_year`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
    