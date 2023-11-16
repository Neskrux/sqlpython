DROP TABLE IF EXISTS LivroAutor;
DROP TABLE IF EXISTS LivroCategoria;
DROP TABLE IF EXISTS ClientePedido;
DROP TABLE IF EXISTS Estoque;
DROP TABLE IF EXISTS Livro;
DROP TABLE IF EXISTS Autor;
DROP TABLE IF EXISTS Editora;
DROP TABLE IF EXISTS Categoria;
DROP TABLE IF EXISTS Cliente;
DROP TABLE IF EXISTS Funcionario;
DROP TABLE IF EXISTS Pedido;


CREATE TABLE Autor (
    autor_id INT AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    data_nascimento DATE,
    nacionalidade VARCHAR(100),
    PRIMARY KEY (autor_id)
);


CREATE TABLE Editora (
    editora_id INT AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    endereco VARCHAR(255),
    telefone VARCHAR(15),
    PRIMARY KEY (editora_id)
);


CREATE TABLE Categoria (
    categoria_id INT AUTO_INCREMENT,
    nome_categoria VARCHAR(255) NOT NULL,
    descricao_categoria TEXT,
    PRIMARY KEY (categoria_id)
);


CREATE TABLE Cliente (
    cliente_id INT AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    endereco VARCHAR(255),
    email VARCHAR(255),
    telefone VARCHAR(15),
    PRIMARY KEY (cliente_id)
);


CREATE TABLE Funcionario (
    funcionario_id INT AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    cargo VARCHAR(100),
    data_admissao DATE,
    salario DECIMAL(10, 2),
    PRIMARY KEY (funcionario_id)
);


CREATE TABLE Livro (
    livro_id INT AUTO_INCREMENT,
    titulo VARCHAR(255) NOT NULL,
    isbn VARCHAR(13),
    ano_publicacao INT,
    preco DECIMAL(10, 2),
    numero_paginas INT,
    idioma VARCHAR(45),
    PRIMARY KEY (livro_id)
);


CREATE TABLE Pedido (
    pedido_id INT AUTO_INCREMENT,
    data_pedido DATE,
    status_pedido VARCHAR(50),
    total_pedido DECIMAL(10, 2),
    PRIMARY KEY (pedido_id)
);


CREATE TABLE Estoque (
    estoque_id INT AUTO_INCREMENT,
    quantidade_estoque INT,
    PRIMARY KEY (estoque_id)
);


CREATE TABLE LivroAutor (
    livro_id INT,
    autor_id INT,
    PRIMARY KEY (livro_id, autor_id),
    FOREIGN KEY (livro_id) REFERENCES Livro(livro_id),
    FOREIGN KEY (autor_id) REFERENCES Autor(autor_id)
);


CREATE TABLE LivroCategoria (
    livro_id INT,
    categoria_id INT,
    PRIMARY KEY (livro_id, categoria_id),
    FOREIGN KEY (livro_id) REFERENCES Livro(livro_id),
    FOREIGN KEY (categoria_id) REFERENCES Categoria(categoria_id)
);


CREATE TABLE ClientePedido (
    cliente_id INT,
    pedido_id INT,
    PRIMARY KEY (cliente_id, pedido_id),
    FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id),
    FOREIGN KEY (pedido_id) REFERENCES Pedido(pedido_id)
);
INSERT INTO Autor (nome, data_nascimento, nacionalidade) VALUES
('Collen Hoover', '1980-12-01', 'Estadunidense'),
('William Shakespeare', '1975-02-22', 'Espanhol'),
('Machado de Assis', '1990-10-05', 'Francês'),
('José Saramago', '1985-05-03', 'Estadunidense'),
('Clarice Lispector', '1920-11-30', 'Brasileira'),
('Higor Camargo', '1956-05-09', 'Argentino'),
('Julio Lopes', '1985-09-07', 'Brasileiro'),
('Alex Vidal', '1945-09-21', 'Canadense'),
('Heitor Junior', '1956-12-08', 'Ucraniano'),
('Rosana da Rocha', '1980-09-09', 'Brasileira'),
('Roberta Albanez', '1920-11-10', 'Brasileira'),
('Matheus Dias', '1990-10-14', 'Espanhol');

INSERT INTO Editora (nome, endereco, telefone) VALUES
('Editora Saraiva', 'Rua Joaquim Alencar, 123', '41-981111111'),
('Editora Attena', 'Rua Imaculada Conceição, 23', '41-982222222'),
('Editora Citron', 'Rua Candido Hartman, 945', '41-986666666'),
('Editora Denver', 'Avenida Visconde de Guarapuava, 21', '41-987777777'),
('Editora Citron', 'Rua Jacarezinho, 67', '41-988888888'),
('Editora Pascal', 'Rua Brasilio Itibere, 349', '41-98555555'),
('Editora Minas', 'Rua Chile, 77', '41-984444444'),
('Editora Ortega', 'Avenida Sete de Setembro, 498', '41-983333333');

INSERT INTO Categoria (nome_categoria, descricao_categoria) VALUES
('Ficção Científica', 'Livros de ficção científica'),
('Romance', 'Livros de romance'),
('Suspense', 'Livros de suspense'),
('Ação', 'Livros de ação'),
('Terror', 'Livros de terror'),
('Comédia', 'Livros de comédia'),
('Drama', 'Livros de drama');

INSERT INTO Cliente (nome, endereco, email, telefone) VALUES
('Amanda da Silva', 'Avenida Iguaçu, 89', 'amandasilva@gmail.com', '41-987645678'),
('Bruno Sandoval', 'Rua Tiradentes, 256', 'brunosandoval@gmail.com', '41-93562876'),
('Isabelle Lopes', 'Rua Martin Afonso, 77', 'isabellelopes@gmail.com', '41-927365802'),
('Barbara Borges', 'Rua Padre Agostinho, 607', 'barbaraborges@gmail.com', '41-902637406'),
('Rodrigo Granado', 'Rua Pedro Viriato, 23', 'rodrigogranado@gmail.com', '41-955263781'),
('Guilherme Voss', 'Rua Jose Juglair, 45', 'guilhermevoss@gmail.com', '41-944253678'),
('Pedro Bastos', 'Rua Paulo Gorski, 908', 'pedrobastos@gmail.com', '41-934255607'),
('Caio Santana', 'Rua Jose Culpi, 443', 'caiosantana@gmail.com', '41-983740023');

INSERT INTO Funcionario (nome, cargo, data_admissao, salario) VALUES
('Sandra', 'Gerente', '2018-10-02', 5000.00),
('Gustavo', 'Atendente', '2019-02-03', 2500.00),
('Caique', 'Atendente', '2019-03-09', 2500.00),
('Ana Julia', 'Atendente', '2020-12-05', 2500.00),
('Luiza', 'Atendente', '2018-12-04', 2500.00),
('Murilo', 'Gerente', '2020-06-11', 5000.00);

INSERT INTO Livro (titulo, isbn, ano_publicacao, preco, numero_paginas, idioma) VALUES
('Por lugares incriveis', '1234567890123', 2023, 27.99, 300, 'Português'),
('Assim que acaba', '9876543210989', 2017, 19.99, 250, 'Inglês'),
('Jogos Vorazes', '1234563654123', 2022, 15.99, 115, 'Inglês'),
('Assim que começa', '9876987710947', 2019, 45.99, 220, 'Inglês'),
('Pequeno Principe', '1234567894978', 2021, 54.99, 370, 'Português'),
('O lado feio do amor', '9976343210987', 2018, 23.99, 259, 'Português');

INSERT INTO Pedido (pedido_id, data_pedido, status_pedido, total_pedido) VALUES
(1, '2023-03-10', 'Em andamento', 23.98),
(2, '2023-06-10', 'Concluído', 32.50),
(3, '2023-09-02', 'Concluído', 45.20),
(4, '2023-03-04', 'Concluído', 54.99),
(5, '2023-12-10', 'Em andamento', 45.70),
(6, '2023-11-06', 'Concluído', 78.96);

INSERT INTO Estoque (quantidade_estoque) VALUES
(100),
(50),
(170),
(90),
(140),
(500);

INSERT INTO LivroAutor (livro_id, autor_id) VALUES
(1, 1), -- Por lugares incriveis foi escrito pelo Collen Hoover
(2, 2); -- Assim que acaba foi escrito pelo William Shakespeare

INSERT INTO LivroCategoria (livro_id, categoria_id) VALUES
(1, 7), -- Por lugares incriveis pertence à categoria Drama
(3, 2); -- Jogos Vorazes pertence à categoria Romance

INSERT INTO clientepedido (cliente_id, pedido_id) VALUES
(1, 1), -- Amanda da Silva fez o pedido 1
(2, 2); -- Bruno Sandoval fez o pedido 2

UPDATE cliente
SET email = 'brunosandoval@gmail.com'
WHERE email = 'isabellelopes@gmail.com';

UPDATE clientepedido
SET pedido_id = '5'
WHERE pedido_id = '1';



UPDATE editora
SET nome = 'LojaDeJogos'
WHERE nome = 'Editora Saraiva';

UPDATE livro
SET titulo = 'A casa mal assombrada'
WHERE titulo = 'Assim que acaba';

DELETE FROM cliente
WHERE nome = 'Guilherme Voss';

DELETE FROM livro
WHERE titulo = 'O lado feio do amor';

DELETE FROM funcionario
WHERE nome = 'Gustavo';

DELETE FROM autor
WHERE nome = 'Matheus Dias';



