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

