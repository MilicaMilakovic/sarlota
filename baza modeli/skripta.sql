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
-- Table `db_sarlota`.`kontakt`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_sarlota`.`kontakt` (
  `kontakt_id` INT NOT NULL AUTO_INCREMENT,
  `ime` VARCHAR(45) NULL,
  `prezime` VARCHAR(45) NULL,
  `broj_telefona` VARCHAR(20) NULL,
  `link_profila` VARCHAR(50) NULL DEFAULT NULL,
  `email` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`kontakt_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `db_sarlota`.`narudzba`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_sarlota`.`narudzba` (
  `narudzba_id` INT NOT NULL AUTO_INCREMENT,
  `datum_prijema` DATE NULL,
  `datum_isporuke` DATE NULL,
  `vrijeme_isporuke` TIME NULL,
  `kolicina` INT NULL,
  `cijena` FLOAT NULL,
  `opis` VARCHAR(255) NULL DEFAULT NULL,
  `ulica` VARCHAR(50) NULL DEFAULT NULL,
  `dostava` TINYINT NULL DEFAULT NULL,
  `ime_narucioca` VARCHAR(45) NULL,
  `prezime_narucioca` VARCHAR(45) NULL,
  `broj_telefona_narucioca` VARCHAR(45) NULL,
  `ulica_narucioca` VARCHAR(45) NULL,
  `grad_narucioca` VARCHAR(45) NULL,
  `link_profila_narucioca` VARCHAR(45) NULL,
  `poslasticar_id` INT NULL,
  `lista_proizvoda` VARCHAR(200) NULL,
  `aktivna` TINYINT NULL,
  `narudzbacol` VARCHAR(45) NULL,
  PRIMARY KEY (`narudzba_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `db_sarlota`.`narudzba_u_lokalu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_sarlota`.`narudzba_u_lokalu` (
  `narudzba_u_lokalu_id` INT NOT NULL AUTO_INCREMENT,
  `broj_stola` INT NULL,
  `aktivna` TINYINT NULL,
  `lista_proizvoda` VARCHAR(100) NULL,
  PRIMARY KEY (`narudzba_u_lokalu_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `db_sarlota`.`poslasticar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_sarlota`.`poslasticar` (
  `poslasticar_id` INT NOT NULL,
  `ime` VARCHAR(45) NULL,
  `prezime` VARCHAR(45) NULL,
  `korisnicko_ime` VARCHAR(45) NULL,
  `lozinka` VARCHAR(45) NULL,
  `lista_kontakata` VARCHAR(100) NULL,
  PRIMARY KEY (`poslasticar_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `db_sarlota`.`proizvod`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_sarlota`.`proizvod` (
  `proizvod_id` INT NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(45) NULL,
  `opis` VARCHAR(200) NULL DEFAULT NULL,
  `cijena` FLOAT NULL,
  `tip_proizvoda` ENUM('Torta', 'Kolac', 'Cupcake', 'Popcake') NULL,
  `ukus` ENUM('Vocni', 'Cokoladni') NULL,
  `trenutni_broj_komada` INT NULL,
  `tezina` VARCHAR(10) NULL,
  `recept_tekst` VARCHAR(500) NULL,
  `lista_sastojaka` VARCHAR(100) NULL,
  `lista_kolicina` VARCHAR(50) NULL,
  `slika` VARCHAR(45) NULL,
  PRIMARY KEY (`proizvod_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `db_sarlota`.`sirovina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_sarlota`.`sirovina` (
  `sirovina_id` INT NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(50) NULL,
  `cijena_po_jedinici_mjere` DOUBLE NULL,
  `jedinica_mjere` VARCHAR(10) NULL,
  `dostupna_kolicina` FLOAT NULL,
  PRIMARY KEY (`sirovina_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `db_sarlota`.`zaduzenje`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_sarlota`.`zaduzenje` (
  `zaduzenje_id` INT NOT NULL AUTO_INCREMENT,
  `naslov` VARCHAR(50) NULL,
  `opis` VARCHAR(300) NULL,
  `rok_za_izvrsenje` DATE NULL,
  `status` TINYINT NULL,
  `lista_zaposlenih` VARCHAR(200) NULL,
  `lista_poslasticara` VARCHAR(200) NULL,
  PRIMARY KEY (`zaduzenje_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `db_sarlota`.`zaposleni`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_sarlota`.`zaposleni` (
  `zaposleni_id` INT NOT NULL,
  `ime` VARCHAR(45) NULL,
  `prezime` VARCHAR(45) NULL,
  `korisnicko_ime` VARCHAR(45) NULL,
  `lozinka` VARCHAR(45) NULL,
  `plata` FLOAT NULL,
  `lista_zaduzenja` VARCHAR(45) NULL,
  `lista_poslasticara_zaduzenje` VARCHAR(45) NULL,
  PRIMARY KEY (`zaposleni_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
