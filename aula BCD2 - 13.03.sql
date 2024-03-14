-- Criar o banco de dados
CREATE DATABASE func_dep_bd;
-- Usar o banco de dados recém-criado
USE func_dep_bd;
-- Criar a tabela "Pessoa"
CREATE TABLE Funcionario (
    Pnome VARCHAR(50),
    Unome VARCHAR(50),
    Endereco VARCHAR(100),
	Dnr INT,
    CodEmpr INT
);

-- Inserir dados na tabela "Pessoa"
INSERT INTO Funcionario (Pnome, Unome, Endereco, Dnr, CodEmpr) VALUES
('João', 'Silva', 'Rua Principal, 123', 101, 1),
('Maria', 'Santos', 'Avenida Central, 456', 102, 1),
('Renata', 'Teodoro', 'Avenida Central, 456', 104, 2);


-- Criar a tabela "Departamento"
CREATE TABLE Departamento (
    Dnumero INT,
    Dnome VARCHAR(50),
	CodEmpr INT
);

-- Inserir dados na tabela "Departamento"
INSERT INTO Departamento (Dnumero, Dnome, CodEmpr) VALUES
(101, 'Vendas', 1),
(102, 'Produção', 1),
(103, 'Vendas', 2),
(104, 'Produção', 2);

## JOIN
SELECT * FROM (FUNCIONARIO JOIN DEPARTAMENTO);
SELECT * FROM (FUNCIONARIO NATURAL JOIN DEPARTAMENTO);
SELECT * FROM (FUNCIONARIO INNER JOIN DEPARTAMENTO ON Dnr=Dnumero) WHERE Dnome='Vendas';
SELECT * FROM (departamento );

## Para JOIN com múltiplas tarefas

CREATE TABLE Empresa (
    CodEmpr INT PRIMARY KEY,
    EmprNome VARCHAR(100),
    Email VARCHAR(100)
);

INSERT INTO Empresa (CodEmpr, EmprNome, Email) VALUES
(1, 'FarmaCom', 'contato@farmacom.com'),
(2, 'AgroMassa', 'contato@agromassa.com'),
(3, 'EngTop', 'contato@engtop.com');

#Todos os funcionários das empresas (mostrar todas as empresas)
SELECT * FROM Empresa
LEFT OUTER JOIN Funcionario ON Funcionario.CodEmpr = Empresa.CodEmpr;

#Join com mais de duas tabelas
SELECT * FROM Empresa
LEFT OUTER JOIN Funcionario ON Funcionario.CodEmpr = Empresa.CodEmpr
RIGHT OUTER JOIN Departamento ON Departamento.CodEmpr = Empresa.CodEmpr;

# Mostrar os departamentos e seus funcionários das empresas (mostrar todas as empresas)
SELECT * FROM Empresa
LEFT OUTER JOIN Funcionario ON Funcionario.CodEmpr = Empresa.CodEmpr
LEFT OUTER JOIN Departamento ON Departamento.CodEmpr = Empresa.CodEmpr;

CREATE TABLE EmpDetails (
    ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Salary DECIMAL(10, 2)
);

-- Inserir dados na tabela EmpDetails
INSERT INTO EmpDetails (ID, Name, Salary) VALUES
(1, 'John', 40000.00),
(2, 'Alex', 25000.00),
(3, 'Simon', 43000.00);



-- Criar a tabela MaritalStatus
CREATE TABLE MaritalStatus (
    ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Status VARCHAR(20)
);

-- Inserir dados na tabela MaritalStatus
INSERT INTO MaritalStatus (ID, Name, Status) VALUES
(1, 'John', 'Married'),
(2, 'Simon', 'Married'),
(3, 'Stella', 'Unmarried');


SELECT empdetails.id, empdetails.name,empdetails.salary, maritalstatus.status FROM empdetails
LEFT OUTER JOIN maritalstatus ON maritalstatus.name = empdetails.name;

SELECT empdetails.id, empdetails.name,  maritalstatus.status FROM empdetails
RIGHT OUTER JOIN maritalstatus ON maritalstatus.name = empdetails.name;

#Isso é um full join
SELECT empdetails.id, empdetails.name, maritalstatus.status FROM empdetails
LEFT OUTER JOIN maritalstatus ON maritalstatus.name = empdetails.name
UNION 
SELECT empdetails.id, empdetails.name,  maritalstatus.status FROM empdetails
RIGHT OUTER JOIN maritalstatus ON maritalstatus.name = empdetails.name;