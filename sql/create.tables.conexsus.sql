USE conexsus;

SHOW ENGINE INNODB STATUS;

DROP TABLE IF EXISTS `conexsus`.`projetoOrcado`;
DROP TABLE IF EXISTS `conexsus`.`planoGerencial`;
DROP TABLE IF EXISTS `conexsus`.`projeto`;
DROP TABLE IF EXISTS `conexsus`.`planoDeContaContabil`;
DROP TABLE IF EXISTS `conexsus`.`empresa`;
DROP TABLE IF EXISTS `conexsus`.`usuario`;

SET foreign_key_checks = 0;

CREATE TABLE `conexsus`.`usuario` (
	id INT(6) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	email VARCHAR(30) NOT NULL,
	senha VARCHAR(30) NOT NULL,
	token VARCHAR(500) NULL,
	UNIQUE INDEX `usuario_email_UNIQUE` (`email` ASC) VISIBLE
)ENGINE = innodb;

CREATE TABLE `conexsus`.`empresa` (
	id INT(6) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	codigo VARCHAR(15) NULL,
	nome VARCHAR(255) NULL
)ENGINE = innodb;

CREATE TABLE `conexsus`.`planoDeContaContabil` (
	id INT(6) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	idEmpresa INT(6) NOT NULL,
	codigo VARCHAR(15) NOT NULL,
	tipo VARCHAR(1) NULL,
	conta VARCHAR(30) NULL,
	descricao VARCHAR(500) NULL
)ENGINE = innodb;

CREATE TABLE `conexsus`.`projeto` (
	id INT(6) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	idEmpresa INT(6) NOT NULL,
	codigo VARCHAR(15) NOT NULL,
	nome VARCHAR(100) NULL
)ENGINE = innodb;

CREATE TABLE `conexsus`.`planoGerencial` (
	id INT(6) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	idProjeto INT(6) NOT NULL,
	codigo VARCHAR(15) NOT NULL,
	tipo VARCHAR(1) NULL,
	conta VARCHAR(30) NULL,
	descricao VARCHAR(500) NULL
)ENGINE = innodb;

CREATE TABLE `conexsus`.`projetoOrcado` (
	id INT(6) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	idProjeto INT(6) NOT NULL,
	ano INT(4) NOT NULL,
	valorOrcado DECIMAL(5,3) NULL,
	valorAlerta DECIMAL(5,3) NULL
)ENGINE = innodb;

CREATE TABLE `conexsus`.`projetoExecutado` (
	id INT(6) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	idProjeto INT(6) NOT NULL,
	ano INT(4) NOT NULL,
	valorProjetado DECIMAL(5,3) NULL,
    valorAcumulado DECIMAL(5,3) NULL,
    valorExecutado DECIMAL(5,3) NULL,
	SaldoFinal DECIMAL(5,3) NULL,
    valorJan DECIMAL(5,3) NULL,
    valorFev DECIMAL(5,3) NULL,
    valorMar DECIMAL(5,3) NULL,
    valorAbr DECIMAL(5,3) NULL,
    valorMai DECIMAL(5,3) NULL,
    valorJun DECIMAL(5,3) NULL,
    valorJul DECIMAL(5,3) NULL,
    valorAgo DECIMAL(5,3) NULL,
    valorSet DECIMAL(5,3) NULL,
    valorOut DECIMAL(5,3) NULL,
    valorNov DECIMAL(5,3) NULL,
    valorDez DECIMAL(5,3) NULL
)ENGINE = innodb;

INSERT INTO usuario (email, senha) VALUES ('rodrigolsr@gmail.com', 'Q1w2e3');

SELECT * FROM `conexsus`.`usuario`;

ALTER TABLE `conexsus`.`planoDeContaContabil`
ADD CONSTRAINT fk_planoDeContaContabil_empresa FOREIGN KEY (idEmpresa) REFERENCES `conexsus`.`empresa`(id);

ALTER TABLE `conexsus`.`projeto`
ADD CONSTRAINT fk_projeto_empresa FOREIGN KEY (idEmpresa) REFERENCES `conexsus`.`empresa`(id);

ALTER TABLE `conexsus`.`planoGerencial`
ADD CONSTRAINT fk_planoGerencial_projeto FOREIGN KEY (idProjeto) REFERENCES `conexsus`.`projeto`(id);

ALTER TABLE `conexsus`.`projetoOrcado`
ADD CONSTRAINT fk_projetoOrcado_projeto FOREIGN KEY (idProjeto) REFERENCES `conexsus`.`projeto`(id);

ALTER TABLE `conexsus`.`projetoExecutado`
ADD CONSTRAINT fk_projetoExecutado_projeto FOREIGN KEY (idProjeto) REFERENCES `conexsus`.`projeto`(id);

#Segue relatório de acompanhamento mensal dos projetos por Atividade x Despesas.