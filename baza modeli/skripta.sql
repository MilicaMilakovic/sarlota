-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema db_sarlota
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_sarlota
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_sarlota` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
USE `db_sarlota` ;

-- -----------------------------------------------------
-- Table `db_sarlota`.`zaposleni`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_sarlota`.`zaposleni` (
  `id` INT NOT NULL,
  `ime` VARCHAR(45) NULL,
  `prezime` VARCHAR(45) NULL,
  `korisnicko_ime` VARCHAR(45) NULL,
  `lozinka` VARCHAR(45) NULL,
  `plata` FLOAT NULL,
  `tip_zaposlenog` TINYINT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `db_sarlota`.`kontakt`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_sarlota`.`kontakt` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `ime` VARCHAR(45) NULL,
  `prezime` VARCHAR(45) NULL,
  `broj_telefona` VARCHAR(20) NULL,
  `link_profila` VARCHAR(50) NULL DEFAULT NULL,
  `email` VARCHAR(50) NULL DEFAULT NULL,
  `zaposleni_zaposleni_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_kontakt_zaposleni_idx` (`zaposleni_zaposleni_id` ASC) VISIBLE,
  CONSTRAINT `fk_kontakt_zaposleni`
    FOREIGN KEY (`zaposleni_zaposleni_id`)
    REFERENCES `db_sarlota`.`zaposleni` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `db_sarlota`.`narudzba`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_sarlota`.`narudzba` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `datum_prijema` DATE NULL,
  `datum_isporuke` DATE NULL,
  `vrijeme_isporuke` TIME NULL,
  `kolicina` INT NOT NULL,
  `opis` VARCHAR(255) NULL DEFAULT NULL,
  `dostava` TINYINT NULL DEFAULT NULL,
  `ime_narucioca` VARCHAR(45) NULL,
  `prezime_narucioca` VARCHAR(45) NULL,
  `broj_telefona_narucioca` VARCHAR(45) NULL,
  `adresa` VARCHAR(256) NULL,
  `aktivna` TINYINT NULL,
  `zaposleni_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_narudzba_zaposleni1_idx` (`zaposleni_id` ASC) VISIBLE,
  CONSTRAINT `fk_narudzba_zaposleni1`
    FOREIGN KEY (`zaposleni_id`)
    REFERENCES `db_sarlota`.`zaposleni` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `db_sarlota`.`narudzba_u_lokalu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_sarlota`.`narudzba_u_lokalu` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `broj_stola` INT NULL,
  `aktivna` TINYINT NULL,
  `zaposleni_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_narudzba_u_lokalu_zaposleni1_idx` (`zaposleni_id` ASC) VISIBLE,
  CONSTRAINT `fk_narudzba_u_lokalu_zaposleni1`
    FOREIGN KEY (`zaposleni_id`)
    REFERENCES `db_sarlota`.`zaposleni` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `db_sarlota`.`tip_proizvoda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_sarlota`.`tip_proizvoda` (
  `id` INT NOT NULL,
  `naziv` VARCHAR(64) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_sarlota`.`proizvod`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_sarlota`.`proizvod` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(45) NULL,
  `opis` VARCHAR(200) NULL DEFAULT NULL,
  `cijena` DECIMAL(6,2) NULL,
  `trenutno_raspolozivo` INT NULL,
  `tezina` VARCHAR(10) NULL,
  `recept_tekst` VARCHAR(500) NULL,
  `slika` BLOB NULL,
  `narudzba_u_lokalu_narudzba_u_lokalu_id` INT NULL,
  `narudzba_narudzba_id` INT NULL,
  `tip_proizvoda_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_proizvod_narudzba_u_lokalu1_idx` (`narudzba_u_lokalu_narudzba_u_lokalu_id` ASC) VISIBLE,
  INDEX `fk_proizvod_narudzba1_idx` (`narudzba_narudzba_id` ASC) VISIBLE,
  INDEX `fk_proizvod_tip_proizvoda1_idx` (`tip_proizvoda_id` ASC) VISIBLE,
  CONSTRAINT `fk_proizvod_narudzba_u_lokalu1`
    FOREIGN KEY (`narudzba_u_lokalu_narudzba_u_lokalu_id`)
    REFERENCES `db_sarlota`.`narudzba_u_lokalu` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_proizvod_narudzba1`
    FOREIGN KEY (`narudzba_narudzba_id`)
    REFERENCES `db_sarlota`.`narudzba` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_proizvod_tip_proizvoda1`
    FOREIGN KEY (`tip_proizvoda_id`)
    REFERENCES `db_sarlota`.`tip_proizvoda` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `db_sarlota`.`sirovina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_sarlota`.`sirovina` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(50) NULL,
  `cijena_po_jedinici_mjere` DOUBLE NULL,
  `jedinica_mjere` VARCHAR(10) NULL,
  `dostupna_kolicina` FLOAT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `db_sarlota`.`zaduzenje`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_sarlota`.`zaduzenje` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `naslov` VARCHAR(50) NULL,
  `opis` VARCHAR(300) NULL,
  `rok_za_izvrsenje` DATE NULL,
  `status` TINYINT NULL,
  `zaposleni_zaposleni_id` INT NOT NULL,
  PRIMARY KEY (`id`, `zaposleni_zaposleni_id`),
  INDEX `fk_zaduzenje_zaposleni1_idx` (`zaposleni_zaposleni_id` ASC) VISIBLE,
  CONSTRAINT `fk_zaduzenje_zaposleni1`
    FOREIGN KEY (`zaposleni_zaposleni_id`)
    REFERENCES `db_sarlota`.`zaposleni` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `db_sarlota`.`recept`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_sarlota`.`recept` (
  `sirovina_id` INT NOT NULL,
  `proizvod_id` INT NOT NULL,
  `kolicina` DECIMAL NULL,
  `opis` VARCHAR(45) NULL,
  PRIMARY KEY (`sirovina_id`, `proizvod_id`),
  INDEX `fk_sirovina_has_proizvod_proizvod1_idx` (`proizvod_id` ASC) VISIBLE,
  INDEX `fk_sirovina_has_proizvod_sirovina1_idx` (`sirovina_id` ASC) VISIBLE,
  CONSTRAINT `fk_sirovina_has_proizvod_sirovina1`
    FOREIGN KEY (`sirovina_id`)
    REFERENCES `db_sarlota`.`sirovina` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sirovina_has_proizvod_proizvod1`
    FOREIGN KEY (`proizvod_id`)
    REFERENCES `db_sarlota`.`proizvod` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
