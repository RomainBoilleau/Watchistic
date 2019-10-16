-- MySQL Script generated by MySQL Workbench
-- Wed Oct 16 10:41:52 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Utilisateur`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Utilisateur` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(45) NOT NULL,
  `Prenom` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(150) NOT NULL,
  `Mdp` VARCHAR(45) NOT NULL,
  `Telephone` INT NOT NULL,
  `Adresse` VARCHAR(255) NULL,
  `Ville` VARCHAR(45) NULL,
  `CodePostale` INT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Couleur`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Couleur` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(45) NOT NULL,
  `Description` VARCHAR(255) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Matiere`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Matiere` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NOT NULL,
  `Description` VARCHAR(255) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Bracelet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Bracelet` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Couleur_id` INT NOT NULL,
  `Matiere_id` INT NOT NULL,
  `Image` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`, `Couleur_id`, `Matiere_id`),
  INDEX `fk_Bracelet_Couleur1_idx` (`Couleur_id` ASC) ,
  INDEX `fk_Bracelet_Matiere1_idx` (`Matiere_id` ASC) ,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) ,
  CONSTRAINT `fk_Bracelet_Couleur1`
    FOREIGN KEY (`Couleur_id`)
    REFERENCES `mydb`.`Couleur` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Bracelet_Matiere1`
    FOREIGN KEY (`Matiere_id`)
    REFERENCES `mydb`.`Matiere` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cadran`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cadran` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(45) NOT NULL,
  `Description` VARCHAR(255) NOT NULL,
  `Image` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Boitier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Boitier` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(45) NOT NULL,
  `Description` VARCHAR(255) NOT NULL,
  `Image` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Modele`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Modele` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Bracelet_id` INT NOT NULL,
  `Cadran_id` INT NOT NULL,
  `Boitier_id` INT NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`, `Bracelet_id`, `Cadran_id`, `Boitier_id`),
  INDEX `fk_Modele_Bracelet_idx` (`Bracelet_id` ASC) ,
  INDEX `fk_Modele_Cadran1_idx` (`Cadran_id` ASC) ,
  INDEX `fk_Modele_Boitier1_idx` (`Boitier_id` ASC) ,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) ,
  CONSTRAINT `fk_Modele_Bracelet`
    FOREIGN KEY (`Bracelet_id`)
    REFERENCES `mydb`.`Bracelet` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Modele_Cadran1`
    FOREIGN KEY (`Cadran_id`)
    REFERENCES `mydb`.`Cadran` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Modele_Boitier1`
    FOREIGN KEY (`Boitier_id`)
    REFERENCES `mydb`.`Boitier` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Soumettre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Soumettre` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Modele_id` INT NOT NULL,
  `Utilisateur_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Soumettre_Modele1_idx` (`Modele_id` ASC) ,
  INDEX `fk_Soumettre_Utilisateur1_idx` (`Utilisateur_id` ASC) ,
  UNIQUE INDEX `Modele_id_UNIQUE` (`Modele_id` ASC) ,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) ,
  CONSTRAINT `fk_Soumettre_Modele1`
    FOREIGN KEY (`Modele_id`)
    REFERENCES `mydb`.`Modele` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Soumettre_Utilisateur1`
    FOREIGN KEY (`Utilisateur_id`)
    REFERENCES `mydb`.`Utilisateur` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Voter`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Voter` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Utilisateur_id` INT NOT NULL,
  `Soumettre_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Voter_Utilisateur1_idx` (`Utilisateur_id` ASC) ,
  INDEX `fk_Voter_Soumettre1_idx` (`Soumettre_id` ASC) ,
  UNIQUE INDEX `Soumettre_id_UNIQUE` (`Soumettre_id` ASC) ,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) ,
  CONSTRAINT `fk_Voter_Utilisateur1`
    FOREIGN KEY (`Utilisateur_id`)
    REFERENCES `mydb`.`Utilisateur` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Voter_Soumettre1`
    FOREIGN KEY (`Soumettre_id`)
    REFERENCES `mydb`.`Soumettre` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Achat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Achat` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Utilisateur_id` INT NOT NULL,
  `Soumettre_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Achat_Utilisateur1_idx` (`Utilisateur_id` ASC) ,
  INDEX `fk_Achat_Soumettre1_idx` (`Soumettre_id` ASC) ,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) ,
  CONSTRAINT `fk_Achat_Utilisateur1`
    FOREIGN KEY (`Utilisateur_id`)
    REFERENCES `mydb`.`Utilisateur` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Achat_Soumettre1`
    FOREIGN KEY (`Soumettre_id`)
    REFERENCES `mydb`.`Soumettre` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
