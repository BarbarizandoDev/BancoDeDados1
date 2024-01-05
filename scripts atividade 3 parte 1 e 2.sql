-- MySQL Script generated by MySQL Workbench
-- Mon Mar 27 21:01:02 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

-- -----------------------------------------------------
-- Schema hospital3
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hospital3` DEFAULT CHARACTER SET utf8mb3 ;
USE `hospital3` ;

-- -----------------------------------------------------
-- Table `hospital3`.`medicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital3`.`medicos` (
  `idmedicos` INT NOT NULL AUTO_INCREMENT,
  `especialidade` VARCHAR(45) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `nascimento` VARCHAR(45) NOT NULL,
  `CRM` VARCHAR(45) NOT NULL,
  `Estado` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(45) NOT NULL,
  `endereço` VARCHAR(45) NOT NULL,
  `areaAtuaçao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idmedicos`))
ENGINE = InnoDB
AUTO_INCREMENT = 12
DEFAULT CHARACTER SET = utf8mb3;

-- script de update , adicionar coluna na tabela Medicos

alter table Medicos
add column Atividade enum ('Ativo', 'Inativo');

desc Medicos;

-- script de povoamento geral da tabela Medicos
insert into Medicos
(especialidade,Nome, nascimento, CRM,estado, telefone,endereço, areaAtuaçao)
values

('Cardiologia', 'Dr. Roberto Silva', '02/05/1975', '123456', 'São Paulo', '(11) 1234-5678', 'Av. Paulista, 123','generalista'),
('Dermatologia', 'Dra. Ana Costa', '15/10/1980', '654321', 'Rio de Janeiro', '(21) 9876-5432', 'Rua das Flores, 456','residente'),
('Pediatria', 'Dr. Marcos Santos', '20/12/1978', '246810', 'Minas Gerais', '(31) 5555-5555', 'Rua do Sol, 789','especialista'),
('Oftalmologia', 'Dr. Luiz Gonzaga', '05/03/1985', '135790', 'Bahia', '(71) 2222-2222', 'Av. da Liberdade, 321','residente'),
('Ginecologia', 'Dra. Camila Rodrigues', '12/06/1990', '246810', 'São Paulo', '(11) 7777-7777', 'Rua do Bosque, 567','especialista'),
('Ortopedia', 'Dr. Pedro Oliveira', '10/02/1982', '369258', 'Rio de Janeiro', '(21) 4444-4444', 'Av. das Acácias, 789','residente'),
('Oncologia', 'Dra. Ana Paula Santos', '01/09/1970', '975310', 'São Paulo', '(11) 9999-9999', 'Rua das Palmeiras, 123','generalista'),
('Urologia', 'Dr. Gustavo Almeida', '25/11/1973', '864209', 'Rio Grande do Sul', '(51) 3333-3333', 'Rua dos Pinheiros, 456','residente'),
('Neurologia', 'Dr. Carlos Martins', '08/07/1987', '357911', 'Paraná', '(41) 6666-6666', 'Av. dos Girassóis, 789','residente'),
('Endocrinologia', 'Dra. Renata Andrade', '17/04/1976', '258147', 'Santa Catarina', '(47) 8888-8888', 'Rua dos Lírios, 123','especialista');


-- script para inserir dados na coluna Atividade.

update Medicos
set Atividade = 'Inativo'
where idMedicos = '1';

update Medicos
set Atividade = 'Inativo'
where idMedicos = '4';

update Medicos
set Atividade = 'inativo'
where idMedicos = '3';

update Medicos
set Atividade = 'Ativo'
where idMedicos = '2';

update Medicos
set Atividade = 'Ativo'
where idMedicos = '5';

update Medicos
set Atividade = 'Ativo'
where idMedicos = '6';

update Medicos
set Atividade = 'Ativo'
where idMedicos = '7';

update Medicos
set Atividade = 'Ativo'
where idMedicos = '8';

update Medicos
set Atividade = 'Ativo'
where idMedicos = '9';

update Medicos
set Atividade = 'Ativo'
where idMedicos = '10';

select*from medicos;

-- -----------------------------------------------------
-- Table `hospital3`.`pacientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital3`.`pacientes` (
  `idpacientes` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `endereço` VARCHAR(45) NOT NULL,
  `CPF` VARCHAR(45) NOT NULL,
  `RG` VARCHAR(45) NOT NULL,
  `data_nascimento` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `convenio` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idpacientes`))
ENGINE = InnoDB
AUTO_INCREMENT = 16
DEFAULT CHARACTER SET = utf8mb3;

-- script de povoamento geral da tabela pacientespacientes

insert into pacientes
(Nome, Endereco, CPF, RG, data_nascimento, Telefone, email,Convenio)
 values
('João Silva', 'Rua A, nº 123, São Paulo', '111.222.333-44', '12.345.678-9', '01/01/1980', '(11) 9999-8888', 'joao.silva@email.com', 'Amil'),
('Maria Santos', 'Avenida B, nº 456, Rio de Janeiro', '222.333.444-55', '21.987.654-3', '02/02/1985', '(21) 8888-7777', 'maria.santos@email.com', 'Bradesco Saúde'),
('Carlos Oliveira', 'Rua C, nº 789, Belo Horizonte', '333.444.555-66', '34.567.890-1', '03/03/1990', '(31) 7777-6666', 'carlos.oliveira@email.com', 'SulAmérica'),
('Ana Paula Rodrigues', 'Avenida D, nº 1011, Brasília', '444.555.666-77', '45.678.901-2', '04/04/1975', '(61) 6666-5555', 'ana.rodrigues@email.com', 'Unimed'),
('Pedro Alves', 'Rua E, nº 1213, Curitiba', '555.666.777-88', '56.789.012-3', '05/05/1986', '(41) 5555-4444', 'pedro.alves@email.com', 'Bradesco Saúde'),
('Julia Costa', 'Avenida F, nº 1415, Salvador', '666.777.888-99', '67.890.123-4', '06/06/1981', '(71) 4444-3333', 'julia.costa@email.com', 'SulAmérica'),
('Lucas Lima', 'Rua G, nº 1617, Florianópolis', '777.888.999-00', '78.901.234-5', '07/07/1995', '(48) 3333-2222', 'lucas.lima@email.com', 'Bradesco Saúde'),
('Amanda Ferreira', 'Avenida H, nº 1819, Fortaleza', '888.999.000-11', '89.012.345-6', '08/08/1984', '(85) 2222-1111', 'amanda.ferreira@email.com', 'SulAmérica'),
('Rafael Souza', 'Rua I, nº 2021, Recife', '999.000.111-22', '90.123.456-7', '09/09/1979', '(81) 1111-0000', 'rafael.souza@email.com', 'Unimed'),
('Fernanda Santos', 'Avenida J, nº 2223, Goiânia', '000.111.222-33', '01.234.567-8', '10/10/1992', '(62) 0000-9999', 'fernanda.santos@email.com', 'Bradesco Saúde'),
('Gustavo Oliveira', 'Rua K, nº 2425, Belém', '111.222.333-44', '12.345.678-9', '11/11/1976', '(91) 9999-8888', 'gustavo.oliveira@email.com', 'Unimed'),
('Larissa Rodrigues', 'Avenida L, nº 2627, Natal', '222.333.444-55', '21.976.765-7 ', '12/01/1993', '(91) 6777-4545', 'larissa.@email.com', 'Bradesco Saúde');

select * from pacientes;
desc pacientes;

-- -----------------------------------------------------
-- Table `hospital3`.`receitas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital3`.`receitas` (
  `idreceitas` INT NOT NULL AUTO_INCREMENT,
  `medicamentos` VARCHAR(45) NOT NULL,
  `dosagem` VARCHAR(45) NOT NULL,
  `instruçoes_uso` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idreceitas`))
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `hospital3`.`consultas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital3`.`consultas` (
  `idconsultas` INT NOT NULL AUTO_INCREMENT,
  `valor` VARCHAR(45) NOT NULL,
  `dataConsulta` VARCHAR(45) NOT NULL,
  `fkpacientes` INT NULL DEFAULT NULL,
  `fkmedicos` INT NULL DEFAULT NULL,
  `fkreceitas` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idconsultas`),
  INDEX `fkconsultas_pacientes` (`fkpacientes` ASC) VISIBLE,
  INDEX `fkconsultas_medicos` (`fkmedicos` ASC) VISIBLE,
  INDEX `fkconsultas_receitas` (`fkreceitas` ASC) VISIBLE,
  CONSTRAINT `fkconsultas_medicos`
    FOREIGN KEY (`fkmedicos`)
    REFERENCES `hospital3`.`medicos` (`idmedicos`),
  CONSTRAINT `fkconsultas_pacientes`
    FOREIGN KEY (`fkpacientes`)
    REFERENCES `hospital3`.`pacientes` (`idpacientes`),
  CONSTRAINT `fkconsultas_receitas`
    FOREIGN KEY (`fkreceitas`)
    REFERENCES `hospital3`.`receitas` (`idreceitas`))
ENGINE = InnoDB
AUTO_INCREMENT = 61
DEFAULT CHARACTER SET = utf8mb3;


-- script para excluir o último convênio cadastrado e todas as consultas realizadas com esse convênio como pediu . 

alter table Consultas
add column status char (1);
desc Consultas;

select * from Consultas;

-- -----------------------------------------------------
-- Table `hospital3`.`convenio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital3`.`convenio` (
  `idconvenio` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `CNPJ` VARCHAR(45) NOT NULL,
  `Tempo_carencia` VARCHAR(45) NOT NULL,
  `numero_carteirinha` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idconvenio`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb3;

-- Crie script para excluir o último convênio cadastrado e todas as consultas realizadas com esse convênio.alter table Convenio

alter table Convenio
add column status char (1);
desc Convenio;


-- script povoamento basico,Convenio

insert into convenio
(nome,CNPJ,tempo_carencia, numero_carteirinha)
values
('unimed', '1234567890001', '60 ', '60001'),
('sulamerica', '2345678900001', '90', '880001'),
('amil' '34567890100001', '30 dias', 'SEF0001'),
('hapivida', '45678901200001', '120 dias', 'PMI0001'),
('viva', '56789012300001', '60 dias', 'CMS0001');


select * from convenio;




-- -----------------------------------------------------
-- Table `hospital3`.`enfermeiro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital3`.`enfermeiro` (
  `idenfermeiro` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `CPF` VARCHAR(45) NOT NULL,
  `CRE` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idenfermeiro`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb3;

-- script de povoamento na enfermeirotabela Enfermeiro.

insert into Enfermeiro
(Nome, CPF, CRE)
values

('João da Silva', '123.456.789-10', '0123456'),
('Maria dos Santos', '987.654.321-10', '6543210'),
('José Roberto', '456.789.123-45', '7890123'),
('Ana Paula', '111.222.333-44', '3332221'),
('Carlos Eduardo', '222.333.444-55', '4443332'),
('Aline Ferreira', '777.888.999-00', '0009997'),
('Pedro Henrique', '555.666.777-88', '7776664'),
('Mariana Costa', '999.888.777-66', '8887775'),
('joao Gomes', '868.909.555-44', '9934223');

SELECT*FROM enfermeiro;


-- -----------------------------------------------------
-- Table `hospital3`.`especialidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital3`.`especialidades` (
  `idespecialidades` INT NOT NULL AUTO_INCREMENT,
  `pediatria` VARCHAR(45) NOT NULL,
  `gastroenterologia` VARCHAR(45) NOT NULL,
  `dermatologia` VARCHAR(45) NOT NULL,
  `clinico geral` VARCHAR(45) NOT NULL,
  `oftalmologia` VARCHAR(45) NOT NULL,
  `cardiologia` VARCHAR(45) NOT NULL,
  `ortopedia` VARCHAR(45) NOT NULL,
  `ginecologia` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idespecialidades`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `hospital3`.`quarto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital3`.`quarto` (
  `idquarto` INT NOT NULL AUTO_INCREMENT,
  `numero` VARCHAR(45) NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  `valorQuarto` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idquarto`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb3;

-- script de povoamento quarto (basico) 
  
insert into Quarto
(Numero, Tipo, ValorQuarto)
values
('001', 'Enfermaria', 'R$ 150,00 por dia'),
('002', 'Enfermaria', 'R$ 150,00 por dia'),
('101', 'quarto duplo', 'R$ 350,00 por dia'),
('102', 'quarto duplo', 'R$ 350,00 por dia'),
('201', 'Apartamento', 'R$ 600,00 por dia'),
('202', 'Apartamento', 'R$ 600,00 por dia');


-- -----------------------------------------------------
-- Table `hospital3`.`internaçao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital3`.`internaçao` (
  `idinternaçao` INT NOT NULL AUTO_INCREMENT,
  `dataentrada` DATETIME NOT NULL,
  `dataPrevistaAlta` DATETIME NOT NULL,
  `dataAlta` DATETIME NOT NULL,
  `Procedimento` VARCHAR(45) NOT NULL,
  `fkpacientes` INT NULL DEFAULT NULL,
  `fkmedicos` INT NULL DEFAULT NULL,
  `fkenfermeiro` INT NULL DEFAULT NULL,
  `fkquarto` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idinternaçao`),
  INDEX `fkinternaçao_pacientes` (`fkpacientes` ASC) VISIBLE,
  INDEX `fkinternaçao_medicos` (`fkmedicos` ASC) VISIBLE,
  INDEX `fkinternaçao_enfermeiro` (`fkenfermeiro` ASC) VISIBLE,
  INDEX `fkinternaçao_quarto` (`fkquarto` ASC) VISIBLE,
  CONSTRAINT `fkinternaçao_enfermeiro`
    FOREIGN KEY (`fkenfermeiro`)
    REFERENCES `hospital3`.`enfermeiro` (`idenfermeiro`),
  CONSTRAINT `fkinternaçao_medicos`
    FOREIGN KEY (`fkmedicos`)
    REFERENCES `hospital3`.`medicos` (`idmedicos`),
  CONSTRAINT `fkinternaçao_pacientes`
    FOREIGN KEY (`fkpacientes`)
    REFERENCES `hospital3`.`pacientes` (`idpacientes`),
  CONSTRAINT `fkinternaçao_quarto`
    FOREIGN KEY (`fkquarto`)
    REFERENCES `hospital3`.`quarto` (`idquarto`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8mb3;

-- script de internaçaopovoamento geral na tabela Internação.

insert into Internacao
(Dataentrada, DataPrevistaAlta, DataAlta, Procedimento, pacientes_idpacientes , medicos_idmedicos ,Enfermeiro_idEnfermeiro, Enfermeiro_idEnfermeiro1, Quarto_idQuarto)
values
('2019-10-03 06:00:00', '2019-10-23 20:00:00','2019-10-21 20:00:00', 'Cirurgia de implante de valvula coronaria', '2', '8', '2', '4', '3'),
('2020-08-10 06:00:00', '2020-08-11 20:00:00','2020-08-16 20:00:00', 'Rinoplastia', '1', '2', '3', '2', '1'),
('2018-03-02 06:00:00', '2018-03-22  20:00:00','2018-03-22 20:00:00', 'Mastectomia', '3', '1', '5', '1', '4'),
('2017-11-11 06:00:00', '2017-11-15 20:00:00','2017-11-20 20:00:00',  'Cirurgia cardíaca', '4', '6', '4', '3', '3'),
('2020-09-04  06:00:00', '2020-09-14  20:00:00','2020-09-15 20:00:00', 'Histerectomia', '5', '3', '7', '1', '2'),
('2016-05-07 06:00:00', '2016-05-19 20:00:00','2016-05-15 20:00:00', 'Gastrectomia', '7', '5', '6', '2', '3'),
('2021-06-01 06:00:00', '2021-06-09 20:00:00','2021-06-05 20:00:00', 'Cirurgia de catarata', '6', '7', '1', '6', '1');

-- Crie script para atualizar as datas de alta nas internações em quartos de enfermaria para três dias após a entrada
-- segue script

update internacao
set Data_prev_alta = '2019-11-18 19:00:00'
where idInternacao = '1';

select * from Internacao;


-- -----------------------------------------------------
-- Table `hospital3`.`relatorio_receitas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital3`.`relatorio_receitas` (
  `idRELATORIO_RECEITAS` INT NOT NULL AUTO_INCREMENT,
  `data_hora` DATETIME NOT NULL,
  PRIMARY KEY (`idRELATORIO_RECEITAS`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
