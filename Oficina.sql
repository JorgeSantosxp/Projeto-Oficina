-- Criação do Script SQL para Criação do Esquema do Banco de Dados

create database oficina;
use oficina;
show tables;

select * from Clientes;
CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Endereço VARCHAR(150),
    Telefone VARCHAR(20)
);

CREATE TABLE Carros (
    CarroID INT PRIMARY KEY,
    ClienteID INT,
    Modelo VARCHAR(100),
    Placa VARCHAR(20),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

CREATE TABLE Serviços (
    ServicoID INT PRIMARY KEY,
    Descrição VARCHAR(100),
    Preço DECIMAL(10, 2)
);

CREATE TABLE OrdensServiço (
    OrdemID INT PRIMARY KEY,
    CarroID INT,
    Data DATE,
    ServicoID INT,
    MecânicoID INT,
    FOREIGN KEY (CarroID) REFERENCES Carros(CarroID),
    FOREIGN KEY (ServicoID) REFERENCES Serviços(ServicoID),
    FOREIGN KEY (MecânicoID) REFERENCES Mecânicos(MecânicoID)
);

CREATE TABLE Mecânicos (
    MecânicoID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Especialidade VARCHAR(100)
);

CREATE TABLE Peças (
    PeçaID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Preço DECIMAL(10, 2)
);

-- Persistência de Dados para Testes
-- Inserindo alguns dados nas tabelas para facilitar os testes:

INSERT INTO Clientes (ClienteID, Nome, Endereço, Telefone) VALUES (1, 'João Silva', 'Rua A, 123', '1234-5678');

INSERT INTO Carros (CarroID, ClienteID, Modelo, Placa) VALUES (1, 1, 'Honda Civic', 'XYZ-1234');

INSERT INTO Serviços (ServicoID, Descrição, Preço) VALUES (1, 'Troca de Óleo', 200.00);

INSERT INTO Mecânicos (MecânicoID, Nome, Especialidade) VALUES (1, 'Carlos Pereira', 'Motor');

INSERT INTO OrdensServiço (OrdemID, CarroID, Data, ServicoID, MecânicoID) VALUES (1, 1, '2024-01-15', 1, 1);

INSERT INTO Peças (PeçaID, Nome, Preço) VALUES (1, 'Filtro de Óleo', 50.00);


-- Recuperação de Informações com Queries SQL
-- Criando algumas queries utilizando as cláusulas especificadas:


-- Recuperações simples com SELECT Statement:
SELECT Nome, Telefone FROM Clientes;

-- Filtros com WHERE Statement:
SELECT * FROM Carros WHERE Modelo = 'Honda Civic';

-- Crie expressões para gerar atributos derivados:
SELECT Nome, Preço * 1.1 AS PreçoComTaxa FROM Peças;

-- Defina ordenações dos dados com ORDER BY:
SELECT Nome FROM Mecânicos ORDER BY Nome;

-- Condições de filtros aos grupos – HAVING Statement:
SELECT ClienteID, COUNT(OrdemID) AS TotalOrdens FROM OrdensServiço GROUP BY ClienteID HAVING COUNT(OrdemID) > 1;

-- Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados:
SELECT Clientes.Nome AS Cliente, Carros.Modelo AS Carro, Serviços.Descrição AS Serviço
FROM OrdensServiço
JOIN Clientes ON OrdensServiço.ClienteID = Clientes.ClienteID
JOIN Carros ON OrdensServiço.CarroID = Carros.CarroID
JOIN Serviços ON OrdensServiço.ServicoID = Serviços.ServicoID;
