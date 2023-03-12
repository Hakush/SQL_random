-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema portfoliotest
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema portfoliotest
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `portfoliotest` DEFAULT CHARACTER SET utf8mb4 ;
USE `portfoliotest` ;

-- -----------------------------------------------------
-- Table `portfoliotest`.`persona`
-- -----------------------------------------------------
CREATE TABLE `portfoliotest`.`persona` (
  `id` INT(11) NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `surname` VARCHAR(45) NULL DEFAULT NULL,
  `age` VARCHAR(45) NULL DEFAULT NULL,
  `position` VARCHAR(45) NULL DEFAULT NULL,
  `position2` VARCHAR(45) NULL DEFAULT NULL,
  `from` VARCHAR(45) NULL DEFAULT NULL,
  `cellphone` VARCHAR(45) NULL DEFAULT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `imgsrc` VARCHAR(45) NULL DEFAULT NULL,
  `about` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `portfoliotest`.`tipo_empleo`
-- -----------------------------------------------------
CREATE TABLE `portfoliotest`.`tipo_empleo` (
  `id` INT(11) NOT NULL,
  `tipo_empleo` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `portfoliotest`.`experiences`
-- -----------------------------------------------------
CREATE TABLE  `portfoliotest`.`experiences` (
  `id` INT(11) NOT NULL,
  `position` VARCHAR(45) NULL DEFAULT NULL,
  `company` VARCHAR(45) NULL DEFAULT NULL,
  `img` VARCHAR(45) NULL DEFAULT NULL,
  `description` VARCHAR(256) NULL DEFAULT NULL,
  `reference` VARCHAR(45) NULL DEFAULT NULL,
  `start` VARCHAR(45) NULL DEFAULT NULL,
  `end` VARCHAR(45) NULL DEFAULT NULL,
  `persona_id` INT(11) NOT NULL,
  `tipo_empleo_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `persona_id`, `tipo_empleo_id`),
  INDEX `fk_experiences_persona_idx` (`persona_id` ASC),
  INDEX `fk_experiences_tipo_empleo1_idx` (`tipo_empleo_id` ASC),
  CONSTRAINT `fk_experiences_persona`
    FOREIGN KEY (`persona_id`)
    REFERENCES `portfoliotest`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_experiences_tipo_empleo1`
    FOREIGN KEY (`tipo_empleo_id`)
    REFERENCES `portfoliotest`.`tipo_empleo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
