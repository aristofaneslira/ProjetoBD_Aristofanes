-- MySQL Workbench Synchronization
-- Generated: 2017-12-07 09:35
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Usuario

-- -----------------------------------------------------
-- Schema ACADEMIA
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `ACADEMIA` ;

-- -----------------------------------------------------
-- Schema ACADEMIA
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ACADEMIA` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
SHOW WARNINGS;
USE `ACADEMIA` ;

CREATE TABLE IF NOT EXISTS `ACADEMIA`.`CLIENTE` (
  `idCLIENTE` INT(11) NOT NULL AUTO_INCREMENT,
  `CPF` VARCHAR(14) NULL DEFAULT NULL,
  `NOME` VARCHAR(45) NULL DEFAULT NULL,
  `TELEFONE` VARCHAR(20) NULL DEFAULT NULL,
  `ENDEREÇO` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`idCLIENTE`),
  UNIQUE INDEX `cpf_UNIQUE` (`CPF` ASC),
  UNIQUE INDEX `idCLIENTE_UNIQUE` (`idCLIENTE` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE IF NOT EXISTS `ACADEMIA`.`TREINADOR` (
  `idTREINADOR` INT(11) NOT NULL AUTO_INCREMENT,
  `CPF` VARCHAR(14) NULL DEFAULT NULL,
  `NOME` VARCHAR(45) NULL DEFAULT NULL,
  `TELEFONE` VARCHAR(20) NULL DEFAULT NULL,
  `ENDEREÇO` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`idTREINADOR`),
  UNIQUE INDEX `cpf_UNIQUE` (`CPF` ASC),
  UNIQUE INDEX `idCLIENTE_UNIQUE` (`idTREINADOR` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE IF NOT EXISTS `ACADEMIA`.`GERENTE` (
  `idGERENTE` INT(11) NOT NULL AUTO_INCREMENT,
  `SENHA` VARCHAR(6) NOT NULL,
  `CPF` VARCHAR(14) NULL DEFAULT NULL,
  `NOME` VARCHAR(45) NULL DEFAULT NULL,
  `TELEFONE` VARCHAR(20) NULL DEFAULT NULL,
  `ENDEREÇO` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`idGERENTE`),
  UNIQUE INDEX `cpf_UNIQUE` (`CPF` ASC),
  UNIQUE INDEX `idGERENTE_UNIQUE` (`idGERENTE` ASC),
  UNIQUE INDEX `senha_UNIQUE` (`SENHA` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE IF NOT EXISTS `ACADEMIA`.`ESPORTE` (
  `idESPORTE` INT(11) NOT NULL,
  `NOME` VARCHAR(45) NULL DEFAULT NULL,
  `VALOR_ESPORTE` DECIMAL(5,2) NULL DEFAULT NULL,
  PRIMARY KEY (`idESPORTE`),
  UNIQUE INDEX `idESPORTE_UNIQUE` (`idESPORTE` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE IF NOT EXISTS `ACADEMIA`.`ENSINA` (
  `ESPORTE_idESPORTE` INT(11) NOT NULL,
  `TREINADOR_idTREINADOR` INT(11) NOT NULL,
  PRIMARY KEY (`ESPORTE_idESPORTE`, `TREINADOR_idTREINADOR`),
  INDEX `fk_ESPORTE_has_TREINADOR_TREINADOR1_idx` (`TREINADOR_idTREINADOR` ASC),
  INDEX `fk_ESPORTE_has_TREINADOR_ESPORTE_idx` (`ESPORTE_idESPORTE` ASC),
  CONSTRAINT `fk_ESPORTE_has_TREINADOR_ESPORTE`
    FOREIGN KEY (`ESPORTE_idESPORTE`)
    REFERENCES `ACADEMIA`.`ESPORTE` (`idESPORTE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ESPORTE_has_TREINADOR_TREINADOR1`
    FOREIGN KEY (`TREINADOR_idTREINADOR`)
    REFERENCES `ACADEMIA`.`TREINADOR` (`idTREINADOR`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE IF NOT EXISTS `ACADEMIA`.`PRATICA` (
  `ESPORTE_idESPORTE` INT(11) NOT NULL,
  `CLIENTE_idCLIENTE` INT(11) NOT NULL,
  `MES` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`ESPORTE_idESPORTE`, `CLIENTE_idCLIENTE`, `MES`),
  INDEX `fk_ESPORTE_has_CLIENTE_CLIENTE1_idx` (`CLIENTE_idCLIENTE` ASC),
  INDEX `fk_ESPORTE_has_CLIENTE_ESPORTE1_idx` (`ESPORTE_idESPORTE` ASC),
  CONSTRAINT `fk_ESPORTE_has_CLIENTE_ESPORTE1`
    FOREIGN KEY (`ESPORTE_idESPORTE`)
    REFERENCES `ACADEMIA`.`ESPORTE` (`idESPORTE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ESPORTE_has_CLIENTE_CLIENTE1`
    FOREIGN KEY (`CLIENTE_idCLIENTE`)
    REFERENCES `ACADEMIA`.`CLIENTE` (`idCLIENTE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE IF NOT EXISTS `ACADEMIA`.`PAGAMENTO` (
  `GERENTE_idGERENTE` INT(11) NOT NULL,
  `CLIENTE_idCLIENTE` INT(11) NOT NULL,
  `DATA` VARCHAR(10) NULL DEFAULT NULL,
  `VALOR` DECIMAL(5,2) NULL DEFAULT NULL,
  `MES` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`GERENTE_idGERENTE`, `CLIENTE_idCLIENTE`, `MES`),
  INDEX `fk_GERENTE_has_CLIENTE_CLIENTE1_idx` (`CLIENTE_idCLIENTE` ASC),
  INDEX `fk_GERENTE_has_CLIENTE_GERENTE1_idx` (`GERENTE_idGERENTE` ASC),
  CONSTRAINT `fk_GERENTE_has_CLIENTE_GERENTE1`
    FOREIGN KEY (`GERENTE_idGERENTE`)
    REFERENCES `ACADEMIA`.`GERENTE` (`idGERENTE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_GERENTE_has_CLIENTE_CLIENTE1`
    FOREIGN KEY (`CLIENTE_idCLIENTE`)
    REFERENCES `ACADEMIA`.`CLIENTE` (`idCLIENTE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE IF NOT EXISTS `ACADEMIA`.`GRADUACAO` (
  `ESPORTE_idESPORTE` INT(11) NOT NULL,
  `CLIENTE_idCLIENTE` INT(11) NOT NULL,
  `DESCRICAO` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`ESPORTE_idESPORTE`, `CLIENTE_idCLIENTE`),
  INDEX `fk_ESPORTE_has_CLIENTE_CLIENTE2_idx` (`CLIENTE_idCLIENTE` ASC),
  INDEX `fk_ESPORTE_has_CLIENTE_ESPORTE2_idx` (`ESPORTE_idESPORTE` ASC),
  CONSTRAINT `fk_ESPORTE_has_CLIENTE_ESPORTE2`
    FOREIGN KEY (`ESPORTE_idESPORTE`)
    REFERENCES `ACADEMIA`.`ESPORTE` (`idESPORTE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ESPORTE_has_CLIENTE_CLIENTE2`
    FOREIGN KEY (`CLIENTE_idCLIENTE`)
    REFERENCES `ACADEMIA`.`CLIENTE` (`idCLIENTE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

-- tabela cliente

INSERT INTO `ACADEMIA`.`CLIENTE` (`idCLIENTE`, `CPF`, `NOME`, `TELEFONE`, `ENDEREÇO`) VALUES ('1', '382.942.364-03', 'Vitor Kevin', '(83) 99490-1128', 'Rua São Pedro, 661, Liberdade');
INSERT INTO `ACADEMIA`.`CLIENTE` (`idCLIENTE`, `CPF`, `NOME`, `TELEFONE`, `ENDEREÇO`) VALUES ('2', '441.546.364-99', 'Benjamin Davi', '(83) 99419-0640', 'Rua Jovino Sobreira de Carvalho, 599, Jardim Paulistano');
INSERT INTO `ACADEMIA`.`CLIENTE` (`idCLIENTE`, `CPF`, `NOME`, `TELEFONE`, `ENDEREÇO`) VALUES ('3', '297.325.344-60', 'Heitor Lucca', '(83) 99317-2071', 'Rua José de Sousa Cavalcante, 788, Velame');
INSERT INTO `ACADEMIA`.`CLIENTE` (`idCLIENTE`, `CPF`, `NOME`, `TELEFONE`, `ENDEREÇO`) VALUES ('4', '043.180.224-63', 'Paulo Benício', '(83) 99909-9275', 'Rua Lino Gomes da Silva, 522, São José');
INSERT INTO `ACADEMIA`.`CLIENTE` (`idCLIENTE`, `CPF`, `NOME`, `TELEFONE`, `ENDEREÇO`) VALUES ('5', '144.322.904-04', 'Lara Sabrina', '(83) 98887-3888', 'Rua Gilson Marinho da Silva, 532, Catolé');
INSERT INTO `ACADEMIA`.`CLIENTE` (`idCLIENTE`, `CPF`, `NOME`, `TELEFONE`, `ENDEREÇO`) VALUES ('6', '663.186.374-00', 'Gabrielly Milena', '(83) 98973-1056', 'Rua Maria Vieira César, 415, Jardim Tavares');
INSERT INTO `ACADEMIA`.`CLIENTE` (`idCLIENTE`, `CPF`, `NOME`, `TELEFONE`, `ENDEREÇO`) VALUES ('7', '483.303.644-45', 'Isadora Rodrigues', '(83) 99964-8880', '1ª Travessa Severino Pimentel, 746, Liberdade');
INSERT INTO `ACADEMIA`.`CLIENTE` (`idCLIENTE`, `CPF`, `NOME`, `TELEFONE`, `ENDEREÇO`) VALUES ('8', '578.442.114-07', 'Maitê Rayssa', '(83) 98542-9534', 'Rua José Nogueira Pereira, 688, Três irmãs');
INSERT INTO `ACADEMIA`.`CLIENTE` (`idCLIENTE`, `CPF`, `NOME`, `TELEFONE`, `ENDEREÇO`) VALUES ('9', '516.572.874-91', 'Agatha Giovanna', '(83) 98296-3416', 'Rua Rômulo Dias de Toledo, 310, Nova Brasília');
INSERT INTO `ACADEMIA`.`CLIENTE` (`idCLIENTE`, `CPF`, `NOME`, `TELEFONE`, `ENDEREÇO`) VALUES ('10', '615.637.534-13', 'Diego Kaique', '(83) 99333-6516', 'Rua São José, 896, Vila Cabral');
INSERT INTO `ACADEMIA`.`CLIENTE` (`idCLIENTE`, `CPF`, `NOME`, `TELEFONE`, `ENDEREÇO`) VALUES ('11', '932.187.454-20', 'Ricardo Ian', '(83) 99875-3851', 'Rua Goiá, 390, Estação Velha');
INSERT INTO `ACADEMIA`.`CLIENTE` (`idCLIENTE`, `CPF`, `NOME`, `TELEFONE`, `ENDEREÇO`) VALUES ('12', '171.914.254-82', 'Isaac Marcos', '(83) 98266-2525', 'Rua Presidente Epitácio Pessoa, 838, Conceição');

-- tabela treinador;

INSERT INTO `ACADEMIA`.`TREINADOR` (`idTREINADOR`, `cpf`, `NOME`, `TELEFONE`, `ENDEREÇO`) VALUES ('100', '412.096.414-02', 'Nito Marley', '(83) 99310-1526', 'Rua Santos, 207, Pedregal');
INSERT INTO `ACADEMIA`.`TREINADOR` (`idTREINADOR`, `cpf`, `NOME`, `TELEFONE`, `ENDEREÇO`) VALUES ('200', '984.116.954-17', 'Luis Henrique', '(83) 99914-0156', 'Rua Silva Jardim, 240, José pinheiro');
INSERT INTO `ACADEMIA`.`TREINADOR` (`idTREINADOR`, `cpf`, `NOME`, `TELEFONE`, `ENDEREÇO`) VALUES ('300', '102.402.314-14', 'Jobson', '(83) 98698-8777', 'Rua Aprígio Pereira Nepomuceno, 533, Jardim Paulistano');
INSERT INTO `ACADEMIA`.`TREINADOR` (`idTREINADOR`, `cpf`, `NOME`, `TELEFONE`, `ENDEREÇO`) VALUES ('400', '397.288.554-78', 'Marcelo Cauê', '(83) 99727-4347', 'Rua Lindemberg Galdino da Silva, 758, Serrotão');
INSERT INTO `ACADEMIA`.`TREINADOR` (`idTREINADOR`, `cpf`, `NOME`, `TELEFONE`, `ENDEREÇO`) VALUES ('500', '352.912.104-51', 'Arthur Leonardo', '(83) 98243-1949', 'Rua Roquete Pinto, 326, Serrotão');
INSERT INTO `ACADEMIA`.`TREINADOR` (`idTREINADOR`, `cpf`, `NOME`, `TELEFONE`, `ENDEREÇO`) VALUES ('600', '724.560.794-00', 'Alexandre Freitas', '(83) 99525-5913', 'Rua Manoel Serafim da Costa, 124, Pedregal');

-- tabela gerente;

INSERT INTO `ACADEMIA`.`GERENTE` (`idGERENTE`, `SENHA`, `CPF`, `NOME`, `TELEFONE`, `ENDEREÇO`) VALUES ('1234', '112233', '000.312.054-61', 'Isabel Stefany', '(83) 98643-2969', 'Rua Jomarcio Travassos de Moura, 956, Cidades');

-- tabela esporte;

INSERT INTO `ACADEMIA`.`ESPORTE` (`idESPORTE`, `NOME`, `VALOR_ESPORTE`) VALUES ('111', 'Jiu-Jitsu', '75');
INSERT INTO `ACADEMIA`.`ESPORTE` (`idESPORTE`, `NOME`, `VALOR_ESPORTE`) VALUES ('222', 'Muay Thai', '60');
INSERT INTO `ACADEMIA`.`ESPORTE` (`idESPORTE`, `NOME`, `VALOR_ESPORTE`) VALUES ('333', 'Musculação', '80');

-- tabela ensina;

INSERT INTO `ACADEMIA`.`ENSINA` (`ESPORTE_idESPORTE`, `TREINADOR_idTREINADOR`) VALUES ('111', '100');
INSERT INTO `ACADEMIA`.`ENSINA` (`ESPORTE_idESPORTE`, `TREINADOR_idTREINADOR`) VALUES ('111', '200');
INSERT INTO `ACADEMIA`.`ENSINA` (`ESPORTE_idESPORTE`, `TREINADOR_idTREINADOR`) VALUES ('222', '300');
INSERT INTO `ACADEMIA`.`ENSINA` (`ESPORTE_idESPORTE`, `TREINADOR_idTREINADOR`) VALUES ('333', '400');
INSERT INTO `ACADEMIA`.`ENSINA` (`ESPORTE_idESPORTE`, `TREINADOR_idTREINADOR`) VALUES ('333', '500');
INSERT INTO `ACADEMIA`.`ENSINA` (`ESPORTE_idESPORTE`, `TREINADOR_idTREINADOR`) VALUES ('111', '600');
INSERT INTO `ACADEMIA`.`ENSINA` (`ESPORTE_idESPORTE`, `TREINADOR_idTREINADOR`) VALUES ('333', '600');

-- tabela pratica;

INSERT INTO `ACADEMIA`.`PRATICA` (`ESPORTE_idESPORTE`, `CLIENTE_idCLIENTE`, `MES`) VALUES ('111', '1', 'setembro');
INSERT INTO `ACADEMIA`.`PRATICA` (`ESPORTE_idESPORTE`, `CLIENTE_idCLIENTE`, `MES`) VALUES ('222', '1', 'setembro');
INSERT INTO `ACADEMIA`.`PRATICA` (`ESPORTE_idESPORTE`, `CLIENTE_idCLIENTE`, `MES`) VALUES ('333', '1', 'setembro');
INSERT INTO `ACADEMIA`.`PRATICA` (`ESPORTE_idESPORTE`, `CLIENTE_idCLIENTE`, `MES`) VALUES ('222', '2', 'setembro');
INSERT INTO `ACADEMIA`.`PRATICA` (`ESPORTE_idESPORTE`, `CLIENTE_idCLIENTE`, `MES`) VALUES ('333', '2', 'setembro');
INSERT INTO `ACADEMIA`.`PRATICA` (`ESPORTE_idESPORTE`, `CLIENTE_idCLIENTE`, `MES`) VALUES ('222', '3', 'setembro');
INSERT INTO `ACADEMIA`.`PRATICA` (`ESPORTE_idESPORTE`, `CLIENTE_idCLIENTE`, `MES`) VALUES ('111', '4', 'setembro');
INSERT INTO `ACADEMIA`.`PRATICA` (`ESPORTE_idESPORTE`, `CLIENTE_idCLIENTE`, `MES`) VALUES ('111', '5', 'setembro');
INSERT INTO `ACADEMIA`.`PRATICA` (`ESPORTE_idESPORTE`, `CLIENTE_idCLIENTE`, `MES`) VALUES ('222', '6', 'setembro');
INSERT INTO `ACADEMIA`.`PRATICA` (`ESPORTE_idESPORTE`, `CLIENTE_idCLIENTE`, `MES`) VALUES ('111', '7', 'setembro');
INSERT INTO `ACADEMIA`.`PRATICA` (`ESPORTE_idESPORTE`, `CLIENTE_idCLIENTE`, `MES`) VALUES ('222', '7', 'setembro');
INSERT INTO `ACADEMIA`.`PRATICA` (`ESPORTE_idESPORTE`, `CLIENTE_idCLIENTE`, `MES`) VALUES ('111', '8', 'setembro');
INSERT INTO `ACADEMIA`.`PRATICA` (`ESPORTE_idESPORTE`, `CLIENTE_idCLIENTE`, `MES`) VALUES ('222', '8', 'setembro');
INSERT INTO `ACADEMIA`.`PRATICA` (`ESPORTE_idESPORTE`, `CLIENTE_idCLIENTE`, `MES`) VALUES ('111', '9', 'setembro');
INSERT INTO `ACADEMIA`.`PRATICA` (`ESPORTE_idESPORTE`, `CLIENTE_idCLIENTE`, `MES`) VALUES ('222', '9', 'setembro');
INSERT INTO `ACADEMIA`.`PRATICA` (`ESPORTE_idESPORTE`, `CLIENTE_idCLIENTE`, `MES`) VALUES ('333', '9', 'setembro');
INSERT INTO `ACADEMIA`.`PRATICA` (`ESPORTE_idESPORTE`, `CLIENTE_idCLIENTE`, `MES`) VALUES ('111', '10', 'setembro');
INSERT INTO `ACADEMIA`.`PRATICA` (`ESPORTE_idESPORTE`, `CLIENTE_idCLIENTE`, `MES`) VALUES ('111', '1', 'outubro');
INSERT INTO `ACADEMIA`.`PRATICA` (`ESPORTE_idESPORTE`, `CLIENTE_idCLIENTE`, `MES`) VALUES ('222', '1', 'outubro');
INSERT INTO `ACADEMIA`.`PRATICA` (`ESPORTE_idESPORTE`, `CLIENTE_idCLIENTE`, `MES`) VALUES ('222', '2', 'outubro');
INSERT INTO `ACADEMIA`.`PRATICA` (`ESPORTE_idESPORTE`, `CLIENTE_idCLIENTE`, `MES`) VALUES ('333', '2', 'outubro');
INSERT INTO `ACADEMIA`.`PRATICA` (`ESPORTE_idESPORTE`, `CLIENTE_idCLIENTE`, `MES`) VALUES ('222', '3', 'outubro');
INSERT INTO `ACADEMIA`.`PRATICA` (`ESPORTE_idESPORTE`, `CLIENTE_idCLIENTE`, `MES`) VALUES ('333', '3', 'outubro');
INSERT INTO `ACADEMIA`.`PRATICA` (`ESPORTE_idESPORTE`, `CLIENTE_idCLIENTE`, `MES`) VALUES ('111', '4', 'outubro');
INSERT INTO `ACADEMIA`.`PRATICA` (`ESPORTE_idESPORTE`, `CLIENTE_idCLIENTE`, `MES`) VALUES ('111', '5', 'outubro');
INSERT INTO `ACADEMIA`.`PRATICA` (`ESPORTE_idESPORTE`, `CLIENTE_idCLIENTE`, `MES`) VALUES ('222', '6', 'outubro');
INSERT INTO `ACADEMIA`.`PRATICA` (`ESPORTE_idESPORTE`, `CLIENTE_idCLIENTE`, `MES`) VALUES ('111', '7', 'outubro');
INSERT INTO `ACADEMIA`.`PRATICA` (`ESPORTE_idESPORTE`, `CLIENTE_idCLIENTE`, `MES`) VALUES ('222', '7', 'outubro');
INSERT INTO `ACADEMIA`.`PRATICA` (`ESPORTE_idESPORTE`, `CLIENTE_idCLIENTE`, `MES`) VALUES ('111', '8', 'outubro');
INSERT INTO `ACADEMIA`.`PRATICA` (`ESPORTE_idESPORTE`, `CLIENTE_idCLIENTE`, `MES`) VALUES ('333', '8', 'outubro');
INSERT INTO `ACADEMIA`.`PRATICA` (`ESPORTE_idESPORTE`, `CLIENTE_idCLIENTE`, `MES`) VALUES ('111', '9', 'outubro');
INSERT INTO `ACADEMIA`.`PRATICA` (`ESPORTE_idESPORTE`, `CLIENTE_idCLIENTE`, `MES`) VALUES ('222', '9', 'outubro');
INSERT INTO `ACADEMIA`.`PRATICA` (`ESPORTE_idESPORTE`, `CLIENTE_idCLIENTE`, `MES`) VALUES ('333', '9', 'outubro');
INSERT INTO `ACADEMIA`.`PRATICA` (`ESPORTE_idESPORTE`, `CLIENTE_idCLIENTE`, `MES`) VALUES ('111', '10', 'outubro');
INSERT INTO `ACADEMIA`.`PRATICA` (`ESPORTE_idESPORTE`, `CLIENTE_idCLIENTE`, `MES`) VALUES ('333', '11', 'outubro');
INSERT INTO `ACADEMIA`.`PRATICA` (`ESPORTE_idESPORTE`, `CLIENTE_idCLIENTE`, `MES`) VALUES ('111', '1', 'novembro');
INSERT INTO `ACADEMIA`.`PRATICA` (`ESPORTE_idESPORTE`, `CLIENTE_idCLIENTE`, `MES`) VALUES ('222', '1', 'novembro');
INSERT INTO `ACADEMIA`.`PRATICA` (`ESPORTE_idESPORTE`, `CLIENTE_idCLIENTE`, `MES`) VALUES ('222', '2', 'novembro');
INSERT INTO `ACADEMIA`.`PRATICA` (`ESPORTE_idESPORTE`, `CLIENTE_idCLIENTE`, `MES`) VALUES ('333', '2', 'novembro');
INSERT INTO `ACADEMIA`.`PRATICA` (`ESPORTE_idESPORTE`, `CLIENTE_idCLIENTE`, `MES`) VALUES ('222', '3', 'novembro');
INSERT INTO `ACADEMIA`.`PRATICA` (`ESPORTE_idESPORTE`, `CLIENTE_idCLIENTE`, `MES`) VALUES ('333', '3', 'novembro');
INSERT INTO `ACADEMIA`.`PRATICA` (`ESPORTE_idESPORTE`, `CLIENTE_idCLIENTE`, `MES`) VALUES ('111', '4', 'novembro');
INSERT INTO `ACADEMIA`.`PRATICA` (`ESPORTE_idESPORTE`, `CLIENTE_idCLIENTE`, `MES`) VALUES ('111', '5', 'novembro');
INSERT INTO `ACADEMIA`.`PRATICA` (`ESPORTE_idESPORTE`, `CLIENTE_idCLIENTE`, `MES`) VALUES ('222', '6', 'novembro');
INSERT INTO `ACADEMIA`.`PRATICA` (`ESPORTE_idESPORTE`, `CLIENTE_idCLIENTE`, `MES`) VALUES ('111', '7', 'novembro');
INSERT INTO `ACADEMIA`.`PRATICA` (`ESPORTE_idESPORTE`, `CLIENTE_idCLIENTE`, `MES`) VALUES ('111', '8', 'novembro');
INSERT INTO `ACADEMIA`.`PRATICA` (`ESPORTE_idESPORTE`, `CLIENTE_idCLIENTE`, `MES`) VALUES ('333', '8', 'novembro');
INSERT INTO `ACADEMIA`.`PRATICA` (`ESPORTE_idESPORTE`, `CLIENTE_idCLIENTE`, `MES`) VALUES ('111', '9', 'novembro');
INSERT INTO `ACADEMIA`.`PRATICA` (`ESPORTE_idESPORTE`, `CLIENTE_idCLIENTE`, `MES`) VALUES ('222', '9', 'novembro');
INSERT INTO `ACADEMIA`.`PRATICA` (`ESPORTE_idESPORTE`, `CLIENTE_idCLIENTE`, `MES`) VALUES ('333', '9', 'novembro');
INSERT INTO `ACADEMIA`.`PRATICA` (`ESPORTE_idESPORTE`, `CLIENTE_idCLIENTE`, `MES`) VALUES ('111', '10', 'novembro');
INSERT INTO `ACADEMIA`.`PRATICA` (`ESPORTE_idESPORTE`, `CLIENTE_idCLIENTE`, `MES`) VALUES ('333', '11', 'novembro');
INSERT INTO `ACADEMIA`.`PRATICA` (`ESPORTE_idESPORTE`, `CLIENTE_idCLIENTE`, `MES`) VALUES ('111', '12', 'novembro');
INSERT INTO `ACADEMIA`.`PRATICA` (`ESPORTE_idESPORTE`, `CLIENTE_idCLIENTE`, `MES`) VALUES ('222', '12', 'novembro');

-- tabela pagamento;

INSERT INTO `ACADEMIA`.`PAGAMENTO` (`GERENTE_idGERENTE`, `CLIENTE_idCLIENTE`, `DATA`, `VALOR`, `MES`) VALUES ('1234', '1', '02/09/2017', '215', 'setembro');
INSERT INTO `ACADEMIA`.`PAGAMENTO` (`GERENTE_idGERENTE`, `CLIENTE_idCLIENTE`, `DATA`, `VALOR`, `MES`) VALUES ('1234', '2', '04/09/2017', '140', 'setembro');
INSERT INTO `ACADEMIA`.`PAGAMENTO` (`GERENTE_idGERENTE`, `CLIENTE_idCLIENTE`, `DATA`, `VALOR`, `MES`) VALUES ('1234', '3', '05/09/2017', '60', 'setembro');
INSERT INTO `ACADEMIA`.`PAGAMENTO` (`GERENTE_idGERENTE`, `CLIENTE_idCLIENTE`, `DATA`, `VALOR`, `MES`) VALUES ('1234', '4', '02/09/2017', '75', 'setembro');
INSERT INTO `ACADEMIA`.`PAGAMENTO` (`GERENTE_idGERENTE`, `CLIENTE_idCLIENTE`, `DATA`, `VALOR`, `MES`) VALUES ('1234', '5', '07/09/2017', '75', 'setembro');
INSERT INTO `ACADEMIA`.`PAGAMENTO` (`GERENTE_idGERENTE`, `CLIENTE_idCLIENTE`, `DATA`, `VALOR`, `MES`) VALUES ('1234', '6', '10/09/2017', '60', 'setembro');
INSERT INTO `ACADEMIA`.`PAGAMENTO` (`GERENTE_idGERENTE`, `CLIENTE_idCLIENTE`, `DATA`, `VALOR`, `MES`) VALUES ('1234', '7', '15/09/2017', '135', 'setembro');
INSERT INTO `ACADEMIA`.`PAGAMENTO` (`GERENTE_idGERENTE`, `CLIENTE_idCLIENTE`, `DATA`, `VALOR`, `MES`) VALUES ('1234', '8', '02/09/2017', '155', 'setembro');
INSERT INTO `ACADEMIA`.`PAGAMENTO` (`GERENTE_idGERENTE`, `CLIENTE_idCLIENTE`, `DATA`, `VALOR`, `MES`) VALUES ('1234', '9', '04/09/2017', '215', 'setembro');
INSERT INTO `ACADEMIA`.`PAGAMENTO` (`GERENTE_idGERENTE`, `CLIENTE_idCLIENTE`, `DATA`, `VALOR`, `MES`) VALUES ('1234', '10', '05/09/2017', '75', 'setembro');
INSERT INTO `ACADEMIA`.`PAGAMENTO` (`GERENTE_idGERENTE`, `CLIENTE_idCLIENTE`, `DATA`, `VALOR`, `MES`) VALUES ('1234', '1', '02/10/2017', '135', 'outubro');
INSERT INTO `ACADEMIA`.`PAGAMENTO` (`GERENTE_idGERENTE`, `CLIENTE_idCLIENTE`, `DATA`, `VALOR`, `MES`) VALUES ('1234', '2', '04/10/2017', '140', 'outubro');
INSERT INTO `ACADEMIA`.`PAGAMENTO` (`GERENTE_idGERENTE`, `CLIENTE_idCLIENTE`, `DATA`, `VALOR`, `MES`) VALUES ('1234', '3', '05/10/2017', '140', 'outubro');
INSERT INTO `ACADEMIA`.`PAGAMENTO` (`GERENTE_idGERENTE`, `CLIENTE_idCLIENTE`, `DATA`, `VALOR`, `MES`) VALUES ('1234', '4', '02/10/2017', '75', 'outubro');
INSERT INTO `ACADEMIA`.`PAGAMENTO` (`GERENTE_idGERENTE`, `CLIENTE_idCLIENTE`, `DATA`, `VALOR`, `MES`) VALUES ('1234', '5', '07/10/2017', '75', 'outubro');
INSERT INTO `ACADEMIA`.`PAGAMENTO` (`GERENTE_idGERENTE`, `CLIENTE_idCLIENTE`, `DATA`, `VALOR`, `MES`) VALUES ('1234', '6', '10/10/2017', '60', 'outubro');
INSERT INTO `ACADEMIA`.`PAGAMENTO` (`GERENTE_idGERENTE`, `CLIENTE_idCLIENTE`, `DATA`, `VALOR`, `MES`) VALUES ('1234', '7', '15/10/2017', '135', 'outubro');
INSERT INTO `ACADEMIA`.`PAGAMENTO` (`GERENTE_idGERENTE`, `CLIENTE_idCLIENTE`, `DATA`, `VALOR`, `MES`) VALUES ('1234', '8', '02/10/2017', '155', 'outubro');
INSERT INTO `ACADEMIA`.`PAGAMENTO` (`GERENTE_idGERENTE`, `CLIENTE_idCLIENTE`, `DATA`, `VALOR`, `MES`) VALUES ('1234', '9', '04/10/2017', '215', 'outubro');
INSERT INTO `ACADEMIA`.`PAGAMENTO` (`GERENTE_idGERENTE`, `CLIENTE_idCLIENTE`, `DATA`, `VALOR`, `MES`) VALUES ('1234', '10', '05/10/2017', '75', 'outubro');
INSERT INTO `ACADEMIA`.`PAGAMENTO` (`GERENTE_idGERENTE`, `CLIENTE_idCLIENTE`, `DATA`, `VALOR`, `MES`) VALUES ('1234', '11', '02/10/2017', '80', 'outubro');
INSERT INTO `ACADEMIA`.`PAGAMENTO` (`GERENTE_idGERENTE`, `CLIENTE_idCLIENTE`, `DATA`, `VALOR`, `MES`) VALUES ('1234', '1', '02/11/2017', '135', 'novembro');
INSERT INTO `ACADEMIA`.`PAGAMENTO` (`GERENTE_idGERENTE`, `CLIENTE_idCLIENTE`, `DATA`, `VALOR`, `MES`) VALUES ('1234', '2', '04/11/2017', '140', 'novembro');
INSERT INTO `ACADEMIA`.`PAGAMENTO` (`GERENTE_idGERENTE`, `CLIENTE_idCLIENTE`, `DATA`, `VALOR`, `MES`) VALUES ('1234', '3', '05/11/2017', '140', 'novembro');
INSERT INTO `ACADEMIA`.`PAGAMENTO` (`GERENTE_idGERENTE`, `CLIENTE_idCLIENTE`, `DATA`, `VALOR`, `MES`) VALUES ('1234', '4', '02/11/2017', '75', 'novembro');
INSERT INTO `ACADEMIA`.`PAGAMENTO` (`GERENTE_idGERENTE`, `CLIENTE_idCLIENTE`, `DATA`, `VALOR`, `MES`) VALUES ('1234', '5', '07/11/2017', '75', 'novembro');
INSERT INTO `ACADEMIA`.`PAGAMENTO` (`GERENTE_idGERENTE`, `CLIENTE_idCLIENTE`, `DATA`, `VALOR`, `MES`) VALUES ('1234', '6', '10/11/2017', '60', 'novembro');
INSERT INTO `ACADEMIA`.`PAGAMENTO` (`GERENTE_idGERENTE`, `CLIENTE_idCLIENTE`, `DATA`, `VALOR`, `MES`) VALUES ('1234', '7', '15/11/2017', '75', 'novembro');
INSERT INTO `ACADEMIA`.`PAGAMENTO` (`GERENTE_idGERENTE`, `CLIENTE_idCLIENTE`, `DATA`, `VALOR`, `MES`) VALUES ('1234', '8', '02/11/2017', '155', 'novembro');
INSERT INTO `ACADEMIA`.`PAGAMENTO` (`GERENTE_idGERENTE`, `CLIENTE_idCLIENTE`, `DATA`, `VALOR`, `MES`) VALUES ('1234', '9', '04/11/2017', '215', 'novembro');
INSERT INTO `ACADEMIA`.`PAGAMENTO` (`GERENTE_idGERENTE`, `CLIENTE_idCLIENTE`, `DATA`, `VALOR`, `MES`) VALUES ('1234', '10', '05/11/2017', '75', 'novembro');
INSERT INTO `ACADEMIA`.`PAGAMENTO` (`GERENTE_idGERENTE`, `CLIENTE_idCLIENTE`, `DATA`, `VALOR`, `MES`) VALUES ('1234', '11', '02/11/2017', '80', 'novembro');
INSERT INTO `ACADEMIA`.`PAGAMENTO` (`GERENTE_idGERENTE`, `CLIENTE_idCLIENTE`, `DATA`, `VALOR`, `MES`) VALUES ('1234', '12', '07/11/2017', '135', 'novembro');

-- tabela graduacao;

INSERT INTO `ACADEMIA`.`GRADUACAO` (`ESPORTE_idESPORTE`, `CLIENTE_idCLIENTE`, `DESCRICAO`) VALUES ('111', '1', 'tempo de treino: 3 anos, faixa: azul, grau: 2');
INSERT INTO `ACADEMIA`.`GRADUACAO` (`ESPORTE_idESPORTE`, `CLIENTE_idCLIENTE`, `DESCRICAO`) VALUES ('222', '1', 'tempo de treino: 2 anos, Kruang/Prajied: vermelho ponta branca');
INSERT INTO `ACADEMIA`.`GRADUACAO` (`ESPORTE_idESPORTE`, `CLIENTE_idCLIENTE`, `DESCRICAO`) VALUES ('222', '2', 'tempo de treino: 3 anos, Kruang/Prajied: vermelho');
INSERT INTO `ACADEMIA`.`GRADUACAO` (`ESPORTE_idESPORTE`, `CLIENTE_idCLIENTE`, `DESCRICAO`) VALUES ('222', '3', 'tempo de treino: 2 anos, Kruang/Prajied: vermelho ponta branca');
INSERT INTO `ACADEMIA`.`GRADUACAO` (`ESPORTE_idESPORTE`, `CLIENTE_idCLIENTE`, `DESCRICAO`) VALUES ('111', '4', 'tempo de treino: 2 anos, faixa: branca, grau: 4');
INSERT INTO `ACADEMIA`.`GRADUACAO` (`ESPORTE_idESPORTE`, `CLIENTE_idCLIENTE`, `DESCRICAO`) VALUES ('111', '5', 'tempo de treino: 1 ano, faixa: branca, grau: 2');
INSERT INTO `ACADEMIA`.`GRADUACAO` (`ESPORTE_idESPORTE`, `CLIENTE_idCLIENTE`, `DESCRICAO`) VALUES ('222', '6', 'tempo de treino: 1 ano, Kruang/Prajied: branco');
INSERT INTO `ACADEMIA`.`GRADUACAO` (`ESPORTE_idESPORTE`, `CLIENTE_idCLIENTE`, `DESCRICAO`) VALUES ('111', '7', 'tempo de treino: 5 anos, faixa: roxa, grau: 4');
INSERT INTO `ACADEMIA`.`GRADUACAO` (`ESPORTE_idESPORTE`, `CLIENTE_idCLIENTE`, `DESCRICAO`) VALUES ('222', '7', 'tempo de treino: 1 ano, Kruang/Prajied: branco');
INSERT INTO `ACADEMIA`.`GRADUACAO` (`ESPORTE_idESPORTE`, `CLIENTE_idCLIENTE`, `DESCRICAO`) VALUES ('111', '8', 'tempo de treino: 3 anos, faixa: azul, grau: 2');
INSERT INTO `ACADEMIA`.`GRADUACAO` (`ESPORTE_idESPORTE`, `CLIENTE_idCLIENTE`, `DESCRICAO`) VALUES ('111', '9', 'tempo de treino: 8 anos, faixa: marrom, grau: 3');
INSERT INTO `ACADEMIA`.`GRADUACAO` (`ESPORTE_idESPORTE`, `CLIENTE_idCLIENTE`, `DESCRICAO`) VALUES ('222', '9', 'tempo de treino: 5 anos, Kruang/Prajied: azul escuro');
INSERT INTO `ACADEMIA`.`GRADUACAO` (`ESPORTE_idESPORTE`, `CLIENTE_idCLIENTE`, `DESCRICAO`) VALUES ('111', '10', 'tempo de treino: 6 meses, faixa: branca, grau: 1');
INSERT INTO `ACADEMIA`.`GRADUACAO` (`ESPORTE_idESPORTE`, `CLIENTE_idCLIENTE`, `DESCRICAO`) VALUES ('111', '12', 'tempo de treino: 1 mes, faixa: branca, grau: 0');
INSERT INTO `ACADEMIA`.`GRADUACAO` (`ESPORTE_idESPORTE`, `CLIENTE_idCLIENTE`, `DESCRICAO`) VALUES ('222', '12', 'tempo de treino: 1 mes, Kruang/Prajied: branco');



