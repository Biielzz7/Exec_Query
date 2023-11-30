CREATE DATABASE aula
GO
USE aula
GO

CREATE TABLE funcionario (
codigo		   INT		  NOT NULL,
nome       VARCHAR(100)   NOT NULL,
salario	   DECIMAL(7,2)   NOT NULL
PRIMARY KEY(codigo)
)
GO

CREATE TABLE dependendente (
codigo_funcion�rio		INT			NOT NULL,
nome_dependente	    VARCHAR(100)    NOT NULL,
salario_dependente  DECIMAL(7,2)    NOT NULL
PRIMARY KEY(codigo_funcion�rio)
FOREIGN KEY(codigo_funcion�rio) REFERENCES funcionario (codigo)
)
GO
DECLARE @codigo		INT,
		@nome	VARCHAR(100),
		@salario DECIMAL(7,2)

		SET @codigo = 1
		WHILE (@codigo <=10)
		BEGIN
			SET @salario = ((RAND()*9000) + 10)
			INSERT INTO funcionario VALUES (@codigo,'Pessoa'+CAST(@codigo AS VARCHAR(2)), @salario)
			SET @codigo = @codigo + 1
			END



			SELECT * FROM funcionario

DECLARE @codigo_funcion�rio	INT,
		@nome_dependente	VARCHAR(100),
		@salario_dependente DECIMAL(7,2)

		SET @codigo_funcion�rio = 1
		WHILE (@codigo_funcion�rio <=10)
		BEGIN
			SET @salario_dependente = ((RAND()*9000) + 10)
			INSERT INTO dependendente VALUES (@codigo_funcion�rio,'Dependente'+CAST(@codigo_funcion�rio AS VARCHAR(2)), @salario_dependente)
			SET @codigo_funcion�rio = @codigo_funcion�rio + 1
			END

			SELECT * FROM dependendente


CREATE FUNCTION fn_tableFUN()
RETURNS @tabela TABLE (
nomeF		VARCHAR(100),
nomeD       VARCHAR(100),
salarioF	DECIMAL(7,2),
salarioD    DECIMAL(7,2)
)
AS
BEGIN
	INSERT INTO @tabela(nomeF, nomeD, salarioF, salarioD)
	SELECT f.nome, d.nome_dependente, f.salario, d.salario_dependente
	from funcionario f INNER JOIN dependendente d 
	ON f.codigo = d.codigo_funcion�rio
	RETURN

	END
	SELECT * FROM fn_tableFUN()
	


CREATE FUNCTION fn_tableSoma(@codigo_funcionario INT)
RETURNS DECIMAL (7,2)
AS
BEGIN
DECLARE @salarioF	DECIMAL(7,2),
		@salarioD    DECIMAL(7,2),
		@total		DECIMAL(7,2)
	
	SELECT @salarioF = f.salario, @salarioD = d.salario_dependente
	FROM funcionario f INNER JOIN dependendente d 
	ON f.codigo = d.codigo_funcion�rio
	WHERE  f.codigo  = codigo_funcion�rio
	SET @total = @salarioD + @salarioF

	RETURN @total
	END


	

	END

