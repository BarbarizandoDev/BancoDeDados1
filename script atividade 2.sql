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
-- Table `mydb`.`espedialidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`espedialidade` (
  `idespedialidade` INT NOT NULL AUTO_INCREMENT,
  `pediatria` VARCHAR(45) NOT NULL,
  `gastroenterologia` VARCHAR(45) NOT NULL,
  `Dermatologia` VARCHAR(45) NOT NULL,
  `clinico_geral` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idespedialidade`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`AreaAtuaçao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`AreaAtuaçao` (
  `idAreaAtuaçao` INT NOT NULL AUTO_INCREMENT,
  `generalista` VARCHAR(45) NOT NULL,
  `especialista` VARCHAR(45) NOT NULL,
  `residente` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idAreaAtuaçao`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Medicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Medicos` (
  `idMedicos` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `nascimento` VARCHAR(45) NOT NULL,
  `CRM` VARCHAR(45) NOT NULL,
  `estado` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(45) NOT NULL,
  `endereço` VARCHAR(45) NOT NULL,
  `espedialidade_idespedialidade` INT NOT NULL,
  `AreaAtuaçao_idAreaAtuaçao` INT NOT NULL,
  PRIMARY KEY (`idMedicos`, `espedialidade_idespedialidade`, `AreaAtuaçao_idAreaAtuaçao`),
  INDEX `fk_Medicos_espedialidade1_idx` (`espedialidade_idespedialidade` ASC) VISIBLE,
  INDEX `fk_Medicos_AreaAtuaçao1_idx` (`AreaAtuaçao_idAreaAtuaçao` ASC) VISIBLE,
  CONSTRAINT `fk_Medicos_espedialidade1`
    FOREIGN KEY (`espedialidade_idespedialidade`)
    REFERENCES `mydb`.`espedialidade` (`idespedialidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Medicos_AreaAtuaçao1`
    FOREIGN KEY (`AreaAtuaçao_idAreaAtuaçao`)
    REFERENCES `mydb`.`AreaAtuaçao` (`idAreaAtuaçao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Relatorio_receita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Relatorio_receita` (
  `idRelatorio_receita` INT NOT NULL AUTO_INCREMENT,
  `data_hora` DATETIME NOT NULL,
  PRIMARY KEY (`idRelatorio_receita`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Receitas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Receitas` (
  `idReceitas` INT NOT NULL AUTO_INCREMENT,
  `medicamentos` VARCHAR(45) NOT NULL,
  `dosagem` VARCHAR(45) NOT NULL,
  `instruçoes_uso` VARCHAR(45) NOT NULL,
  `Medicos_idMedicos` INT NOT NULL,
  `Relatorio_receita_idRelatorio_receita` INT NOT NULL,
  PRIMARY KEY (`idReceitas`, `Medicos_idMedicos`, `Relatorio_receita_idRelatorio_receita`),
  INDEX `fk_Receitas_Medicos1_idx` (`Medicos_idMedicos` ASC) VISIBLE,
  INDEX `fk_Receitas_Relatorio_receita1_idx` (`Relatorio_receita_idRelatorio_receita` ASC) VISIBLE,
  CONSTRAINT `fk_Receitas_Medicos1`
    FOREIGN KEY (`Medicos_idMedicos`)
    REFERENCES `mydb`.`Medicos` (`idMedicos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Receitas_Relatorio_receita1`
    FOREIGN KEY (`Relatorio_receita_idRelatorio_receita`)
    REFERENCES `mydb`.`Relatorio_receita` (`idRelatorio_receita`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Convenios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Convenios` (
  `idConvenios` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `CNPJ` VARCHAR(45) NOT NULL,
  `TempoCarencia` VARCHAR(45) NOT NULL,
  `numeroCarteirinha` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idConvenios`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tipoQuarto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tipoQuarto` (
  `idtipoQuarto` INT NOT NULL AUTO_INCREMENT,
  `descriçao` VARCHAR(45) NOT NULL,
  `valorDiaria` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idtipoQuarto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`quarto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`quarto` (
  `idquarto` INT NOT NULL AUTO_INCREMENT,
  `numero` VARCHAR(45) NOT NULL,
  `tipoquarto` VARCHAR(45) NOT NULL,
  `tipoQuarto_idtipoQuarto` INT NOT NULL,
  PRIMARY KEY (`idquarto`, `tipoQuarto_idtipoQuarto`),
  INDEX `fk_quarto_tipoQuarto1_idx` (`tipoQuarto_idtipoQuarto` ASC) VISIBLE,
  CONSTRAINT `fk_quarto_tipoQuarto1`
    FOREIGN KEY (`tipoQuarto_idtipoQuarto`)
    REFERENCES `mydb`.`tipoQuarto` (`idtipoQuarto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Internaçao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Internaçao` (
  `idInternaçao` INT NOT NULL AUTO_INCREMENT,
  `dataEntrada` DATETIME NOT NULL,
  `dataPrevistaAlta` DATETIME NOT NULL,
  `DataAlta` DATETIME NOT NULL,
  `Procedimento` VARCHAR(45) NOT NULL,
  `Medicos_idMedicos` INT NOT NULL,
  `Medicos_espedialidade_idespedialidade` INT NOT NULL,
  `Medicos_AreaAtuaçao_idAreaAtuaçao` INT NOT NULL,
  `quarto_idquarto` INT NOT NULL,
  `quarto_tipoQuarto_idtipoQuarto` INT NOT NULL,
  PRIMARY KEY (`idInternaçao`, `Medicos_idMedicos`, `Medicos_espedialidade_idespedialidade`, `Medicos_AreaAtuaçao_idAreaAtuaçao`, `quarto_idquarto`, `quarto_tipoQuarto_idtipoQuarto`),
  INDEX `fk_Internaçao_Medicos1_idx` (`Medicos_idMedicos` ASC, `Medicos_espedialidade_idespedialidade` ASC, `Medicos_AreaAtuaçao_idAreaAtuaçao` ASC) VISIBLE,
  INDEX `fk_Internaçao_quarto1_idx` (`quarto_idquarto` ASC, `quarto_tipoQuarto_idtipoQuarto` ASC) VISIBLE,
  CONSTRAINT `fk_Internaçao_Medicos1`
    FOREIGN KEY (`Medicos_idMedicos` , `Medicos_espedialidade_idespedialidade` , `Medicos_AreaAtuaçao_idAreaAtuaçao`)
    REFERENCES `mydb`.`Medicos` (`idMedicos` , `espedialidade_idespedialidade` , `AreaAtuaçao_idAreaAtuaçao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Internaçao_quarto1`
    FOREIGN KEY (`quarto_idquarto` , `quarto_tipoQuarto_idtipoQuarto`)
    REFERENCES `mydb`.`quarto` (`idquarto` , `tipoQuarto_idtipoQuarto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pacientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pacientes` (
  `idPacientes` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `endereço` VARCHAR(45) NOT NULL,
  `CPF` VARCHAR(45) NOT NULL,
  `RG` VARCHAR(45) NOT NULL,
  `Telefone` VARCHAR(45) NOT NULL,
  `nascimento` DATETIME NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `convenio` VARCHAR(45) NOT NULL,
  `Receitas_idReceitas` INT NOT NULL,
  `Convenios_idConvenios` INT NOT NULL,
  `Internaçao_idInternaçao` INT NOT NULL,
  PRIMARY KEY (`idPacientes`, `Receitas_idReceitas`, `Convenios_idConvenios`, `Internaçao_idInternaçao`),
  INDEX `fk_Pacientes_Receitas_idx` (`Receitas_idReceitas` ASC) VISIBLE,
  INDEX `fk_Pacientes_Convenios1_idx` (`Convenios_idConvenios` ASC) VISIBLE,
  INDEX `fk_Pacientes_Internaçao1_idx` (`Internaçao_idInternaçao` ASC) VISIBLE,
  CONSTRAINT `fk_Pacientes_Receitas`
    FOREIGN KEY (`Receitas_idReceitas`)
    REFERENCES `mydb`.`Receitas` (`idReceitas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pacientes_Convenios1`
    FOREIGN KEY (`Convenios_idConvenios`)
    REFERENCES `mydb`.`Convenios` (`idConvenios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pacientes_Internaçao1`
    FOREIGN KEY (`Internaçao_idInternaçao`)
    REFERENCES `mydb`.`Internaçao` (`idInternaçao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Consultas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Consultas` (
  `idConsultas` INT NOT NULL AUTO_INCREMENT,
  `Medicos_idMedicos` INT NOT NULL,
  `Medicos_espedialidade_idespedialidade` INT NOT NULL,
  `Convenios_idConvenios` INT NOT NULL,
  PRIMARY KEY (`idConsultas`, `Medicos_idMedicos`, `Medicos_espedialidade_idespedialidade`, `Convenios_idConvenios`),
  INDEX `fk_Consultas_Medicos1_idx` (`Medicos_idMedicos` ASC, `Medicos_espedialidade_idespedialidade` ASC) VISIBLE,
  INDEX `fk_Consultas_Convenios1_idx` (`Convenios_idConvenios` ASC) VISIBLE,
  CONSTRAINT `fk_Consultas_Medicos1`
    FOREIGN KEY (`Medicos_idMedicos` , `Medicos_espedialidade_idespedialidade`)
    REFERENCES `mydb`.`Medicos` (`idMedicos` , `espedialidade_idespedialidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Consultas_Convenios1`
    FOREIGN KEY (`Convenios_idConvenios`)
    REFERENCES `mydb`.`Convenios` (`idConvenios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`paciente_medicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`paciente_medicos` (
  `idpaciente_medicos` INT NOT NULL AUTO_INCREMENT,
  `pacientes_idpacientes` INT NOT NULL,
  `medicos_idmedicos` INT NOT NULL,
  PRIMARY KEY (`idpaciente_medicos`),
  INDEX `fk_pacientes_idx` (`pacientes_idpacientes` ASC) VISIBLE,
  INDEX `fk_medicos_idx` (`medicos_idmedicos` ASC) VISIBLE,
  CONSTRAINT `fk_pacientes`
    FOREIGN KEY (`pacientes_idpacientes`)
    REFERENCES `mydb`.`Pacientes` (`idPacientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_medicos`
    FOREIGN KEY (`medicos_idmedicos`)
    REFERENCES `mydb`.`Medicos` (`idMedicos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`consultas_pacientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`consultas_pacientes` (
  `idconsultas_pacientes` INT NOT NULL AUTO_INCREMENT,
  `consultas_idconsultas` INT NOT NULL,
  `pacientes_idpacientes` INT NOT NULL,
  PRIMARY KEY (`idconsultas_pacientes`),
  INDEX `fk_consultas_idx` (`consultas_idconsultas` ASC) VISIBLE,
  INDEX `fk_pacientes_idx` (`pacientes_idpacientes` ASC) VISIBLE,
  CONSTRAINT `fk_consultas`
    FOREIGN KEY (`consultas_idconsultas`)
    REFERENCES `mydb`.`Consultas` (`idConsultas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pacientes`
    FOREIGN KEY (`pacientes_idpacientes`)
    REFERENCES `mydb`.`Pacientes` (`idPacientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Enfermeiro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Enfermeiro` (
  `idEnfermeiro` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `CPF` VARCHAR(45) NOT NULL,
  `CRE` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEnfermeiro`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Internaaçao_enfermeiro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Internaaçao_enfermeiro` (
  `idInternaaçao_enfermeiro` INT NOT NULL AUTO_INCREMENT,
  `internaçao_idinternaçao` INT NOT NULL,
  `enfermeiro_idenfermeiro` INT NOT NULL,
  PRIMARY KEY (`idInternaaçao_enfermeiro`),
  INDEX `fk_enfermeiro_idx` (`enfermeiro_idenfermeiro` ASC) VISIBLE,
  INDEX `fk_internaçao_idx` (`internaçao_idinternaçao` ASC) VISIBLE,
  CONSTRAINT `fk_enfermeiro`
    FOREIGN KEY (`enfermeiro_idenfermeiro`)
    REFERENCES `mydb`.`Enfermeiro` (`idEnfermeiro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_internaçao`
    FOREIGN KEY (`internaçao_idinternaçao`)
    REFERENCES `mydb`.`Internaçao` (`idInternaçao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
