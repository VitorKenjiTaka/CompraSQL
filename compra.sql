CREATE DATABASE compra
GO
USE compra

GO
CREATE TABLE entrada (
codigo_transacao		int	IDENTITY(1,1)	not null,
codigo_produto			int					not null,
qntd					int					not null,
valor_total				int					not null
PRIMARY KEY(codigo_produto, codigo_transacao)
FOREIGN KEY(codigo_produto) REFERENCES produto (codigo)
)

GO
CREATE TABLE saida(
codigo_transacao		int	IDENTITY(1,1)	not null,
codigo_produto			int					not null,
qntd					int					not null,
valor_total				int					not null
PRIMARY KEY(codigo_produto, codigo_transacao)
FOREIGN KEY(codigo_produto) REFERENCES produto (codigo)
)

GO
CREATE TABLE produto (
codigo		 int		not null,
nome	 varchar(100)	not null,
valor	decimal(7,2)    not null
PRIMARY KEY(codigo)
)

GO
CREATE PROCEDURE sp_insert (@opcao CHAR(1), @saida VARCHAR(100))
	AS
DECLARE @codigo int
	Set @codigo = 1
	DECLARE @nome varchar(100)
DECLARE @valor  decimal (7,2)
DECLARE @qntd int
DECLARE @valortotal  decimal (7,2)
	WHILE @codigo <= 10
		BEGIN
			IF(LOWER(@opcao) = 'e')
				BEGIN
					SET @codigo += 1
SET @nome = 'produto'
		SET @valor= rand()*91
SET @qntd = 9
SET @valortotal = @valor * @qntd
	INSERT INTO produto VALUES 
		(@codigo, @nome, @valor)
	INSERT INTO entrada VALUES 
		(@codigo, @qntd, @valortotal)
			END
			IF(LOWER(@opcao) = 's')
				BEGIN
					SET @codigo += 1
SET @nome = 'produto'
		SET @valor= rand()*91
SET @qntd = 9
SET @valortotal = @valor * @qntd
	INSERT INTO produto VALUES 
		(@codigo, @nome, @valor)
	INSERT INTO saida VALUES 
		(@codigo, @qntd, @valortotal)
			END
		END
		DECLARE @out varchar (100)
exec sp_insert 'e', @out	
				SELECT * FROM produto
				SELECT * FROM entrada
				SELECT * FROM saida