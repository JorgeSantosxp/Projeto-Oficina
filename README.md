# Projeto-Oficina

# Projeto de Banco de Dados para Oficina
Introdução
Este projeto tem como objetivo criar um banco de dados para gerenciar uma oficina mecânica. O banco de dados gerencia informações sobre clientes, seus carros, serviços oferecidos, ordens de serviço, mecânicos e peças utilizadas.

Estrutura do Banco de Dados
O banco de dados é composto pelas seguintes tabelas:

Clientes: Armazena informações dos clientes.

Carros: Armazena informações sobre os carros dos clientes.

Serviços: Armazena os tipos de serviços oferecidos pela oficina.

Ordens de Serviço: Armazena detalhes das ordens de serviço realizadas.

Mecânicos: Armazena informações sobre os mecânicos da oficina.

Peças: Armazena informações sobre as peças utilizadas nos serviços.

**Modelo Relacional**

**Clientes**
```sql
CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Endereço VARCHAR(150),
    Telefone VARCHAR(20)
);

**Carros**
```sql
CREATE TABLE Carros (
    CarroID INT PRIMARY KEY,
    ClienteID INT,
    Modelo VARCHAR(100),
    Placa VARCHAR(20),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

**Serviços**
```sql
CREATE TABLE Serviços (
    ServicoID INT PRIMARY KEY,
    Descrição VARCHAR(100),
    Preço DECIMAL(10, 2)
);

**Ordens de Serviço**
```sql
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

**Mecânicos**
```sql
CREATE TABLE Mecânicos (
    MecânicoID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Especialidade VARCHAR(100)
);

**Peças**
```sql
CREATE TABLE Peças (
    PeçaID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Preço DECIMAL(10, 2)
);

Como Executar o Projeto
Passo 1: Criação do Banco de Dados
Execute os scripts SQL acima para criar as tabelas no seu banco de dados.

Passo 2: Inserção de Dados
Utilize os comandos de inserção de dados abaixo para popular as tabelas:

```sql
INSERT INTO Clientes (ClienteID, Nome, Endereço, Telefone) VALUES (1, 'João Silva', 'Rua A, 123', '1234-5678');

INSERT INTO Carros (CarroID, ClienteID, Modelo, Placa) VALUES (1, 1, 'Honda Civic', 'XYZ-1234');

INSERT INTO Serviços (ServicoID, Descrição, Preço) VALUES (1, 'Troca de Óleo', 200.00);

INSERT INTO Mecânicos (MecânicoID, Nome, Especialidade) VALUES (1, 'Carlos Pereira', 'Motor');

INSERT INTO OrdensServiço (OrdemID, CarroID, Data, ServicoID, MecânicoID) VALUES (1, 1, '2024-01-15', 1, 1);

INSERT INTO Peças (PeçaID, Nome, Preço) VALUES (1, 'Filtro de Óleo', 50.00);

**Exemplos de Uso**

**Recuperações Simples com SELECT Statement**
```sql
SELECT Nome, Telefone FROM Clientes;

**Filtros com WHERE Statement**
sql
SELECT * FROM Carros WHERE Modelo = 'Honda Civic';

**Criação de Atributos Derivados**
```sql
SELECT Nome, Preço * 1.1 AS PreçoComTaxa FROM Peças;

**Ordenação dos Dados com ORDER BY**
```sql
SELECT Nome FROM Mecânicos ORDER BY Nome;

**Condições de Filtros aos Grupos – HAVING Statement**
```sql
SELECT ClienteID, COUNT(OrdemID) AS TotalOrdens FROM OrdensServiço GROUP BY ClienteID HAVING COUNT(OrdemID) > 1;

**Junções entre Tabelas**
```sql
SELECT Clientes.Nome AS Cliente, Carros.Modelo AS Carro, Serviços.Descrição AS Serviço
FROM OrdensServiço
JOIN Clientes ON OrdensServiço.ClienteID = Clientes.ClienteID
JOIN Carros ON OrdensServiço.CarroID = Carros.CarroID
JOIN Serviços ON OrdensServiço.ServicoID = Serviços.ServicoID;
