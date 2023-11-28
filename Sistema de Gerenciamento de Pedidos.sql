-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema MODELO_LOGICO_GERENCIAMENTO_DE_PEDID
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MODELO_LOGICO_GERENCIAMENTO_DE_PEDID
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MODELO_LOGICO_GERENCIAMENTO_DE_PEDID` DEFAULT CHARACTER SET utf8 ;
USE `MODELO_LOGICO_GERENCIAMENTO_DE_PEDID` ;

-- -----------------------------------------------------
-- Table `MODELO_LOGICO_GERENCIAMENTO_DE_PEDID`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MODELO_LOGICO_GERENCIAMENTO_DE_PEDID`.`clientes` (
  `id_clientes` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `endereco` VARCHAR(150) NOT NULL,
  `telefone` VARCHAR(11) NOT NULL,
  `totalPedidos` DECIMAL(10,2) NULL,
  PRIMARY KEY (`id_clientes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MODELO_LOGICO_GERENCIAMENTO_DE_PEDID`.`pedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MODELO_LOGICO_GERENCIAMENTO_DE_PEDID`.`pedidos` (
  `id_pedidos` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(200) NOT NULL,
  `valor` DECIMAL(10,2) NOT NULL,
  `data` DATE NOT NULL,
  `id_clientes_pedidos` INT NOT NULL,
  PRIMARY KEY (`id_pedidos`, `id_clientes_pedidos`),
  INDEX `fk_pedidos_clientes_idx` (`id_clientes_pedidos` ASC) VISIBLE,
  CONSTRAINT `fk_pedidos_clientes`
    FOREIGN KEY (`id_clientes_pedidos`)
    REFERENCES `MODELO_LOGICO_GERENCIAMENTO_DE_PEDID`.`clientes` (`id_clientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


insert into clientes (nome,endereco,telefone) values 
('mario mario', 'mario_bros@mushroomkingdom.com' ,'66123456789' ), 
('squall leonhart','leonhart@garden.com','98486512379'),
('Lone Wanderer','wanderer@vault.com','19123486579'),
('Janus Zeal','magus666@magnet.com','14789653256'),
('Edward Elric','edowado@alchemist.com','45123478569');

insert into pedidos (valor,descricao,data,id_clientes_pedidos) values
(200.50,'kit de cogumelos','2023-03-10',1),
(1500.99,'gunblade:Lion Heart','2023-03-27',2),
(23.66,'2 stimpack','2023-03-31',3),
(18000.00,'Judgment Scythe','2023-03-13',4),
(25000.00,'automail fibra de carbono','2023-03-03',5);


DELIMITER //

CREATE PROCEDURE InserirPedido(
    IN cliente_id INT,
    IN descricao_pedido VARCHAR(200),
    IN valor_pedido DECIMAL(10,2),
    IN data_pedido DATE
)
BEGIN 
    INSERT INTO pedidos (id_clientes_pedidos, descricao, valor, data)
    VALUES (cliente_id, descricao_pedido, valor_pedido, data_pedido);
END //

DELIMITER ;


DELIMITER $$

CREATE TRIGGER AtualizarTotalPedidos
AFTER INSERT ON pedidos
FOR EACH ROW
BEGIN
    UPDATE clientes
    SET totalPedidos = totalPedidos + NEW.valor
    WHERE id_clientes = NEW.id_clientes_pedidos;
END $$

DELIMITER ;


CREATE VIEW PedidosClientes AS
SELECT
    id_pedidos, descricao AS descricao_pedido,
    valor,
    data,
    
    id_clientes,
    nome AS nome_cliente,
    endereco,
    telefone
FROM
    pedidos p
JOIN
    clientes c ON p.id_clientes_pedidos = c.id_clientes;
    
    SELECT
    id_clientes,
    nome AS nome_cliente,
    endereco,
    telefone,

    id_pedidos,
    descricao AS descricao_pedido,
    valor,
    data,
    SUM(valor) AS valor_total_pedidos
FROM
    clientes
JOIN
    pedidos  ON id_clientes = id_clientes_pedidos
GROUP BY
    id_clientes, id_pedidos;