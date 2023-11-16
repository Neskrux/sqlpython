SELECT categoria.nome_categoria, COUNT(livroCategoria.livro_id) AS quantidade
FROM categoria
LEFT JOIN livroCategoria ON categoria.categoria_id = livroCategoria.categoria_id
GROUP BY categoria.nome_categoria;


SELECT autor.nome, AVG(livro.preco) AS preco_medio
FROM autor
INNER JOIN livroAutor ON autor.autor_id = livroAutor.autor_id
INNER JOIN livro ON livroAutor.livro_id = livro.livro_id
GROUP BY autor.nome;


SELECT cliente.nome, SUM(pedido.total_pedido) AS valor_total
FROM cliente
INNER JOIN clientePedido ON cliente.cliente_id = clientePedido.cliente_id
INNER JOIN pedido ON clientePedido.pedido_id = pedido.pedido_id
GROUP BY cliente.nome;


SELECT categoria.nome_categoria, AVG(Livro.numero_paginas) AS media_paginas
FROM categoria
LEFT JOIN livroCategoria ON categoria.categoria_id = livroCategoria.categoria_id
LEFT JOIN livro ON livroCategoria.livro_id = livro.livro_id
GROUP BY categoria.nome_categoria;


SELECT YEAR(pedido.data_pedido) AS ano, MONTH(pedido.data_pedido) AS mes, COUNT(*) AS pedidos_concluidos
FROM pedido
WHERE pedido.status_pedido = 'Concluído'
GROUP BY ano, mes;


SELECT titulo, autor_id
FROM livro
ORDER BY titulo ASC;


SELECT pedido_id, data_pedido, total_pedido
FROM pedido
ORDER BY total_pedido DESC;


SELECT nome, endereco, email
FROM cliente
ORDER BY nome ASC;


SELECT livro.titulo, autor.nome
FROM livro
INNER JOIN livroAutor ON livro.livro_id = livroAutor.livro_id;


SELECT categoria.nome_categoria, livro.titulo
FROM categoria
LEFT JOIN livroCategoria ON categoria.categoria_id = livroCategoria.categoria_id;


SELECT autor.nome, livro.titulo
FROM autor
RIGHT JOIN livroAutor ON autor.autor_id = livroAutor.autor_id;


SELECT cliente.nome, pedido.pedido_id
FROM cliente
FULL OUTER JOIN clientePedido ON cliente.cliente_id = clientePedido.cliente_id;


SELECT livro1.titulo AS livro1, livro2.titulo AS livro2, autor1.nacionalidade AS nacionalidade
FROM livroAutor AS LA1
INNER JOIN livroAutor AS LA2 ON LA1.livro_id = LA2.livro_id
INNER JOIN autor AS autor1 ON LA1.autor_id = autor1.autor_id
INNER JOIN autor AS autor2 ON LA2.autor_id = autor2.autor_id
WHERE autor1.nacionalidade = autor2.nacionalidade
AND Livro1.livro_id < Livro2.livro_id;


CREATE OR REPLACE VIEW pedidoCliente 
(cliente_id, cliente_nome, data_nascimento, data_criacao,
pedido_id, data_do_pedido, status_pedido, pedido_total) AS
SELECT p.pedido_id,
    p.data_pedido,
    p.status_pedido,
    c.cliente_id,
    c.nome AS nome_cliente,
    c.email AS email_cliente
FROM pedido AS p
INNER JOIN cliente AS c ON p.cliente_id = c.cliente_id;
SELECT * FROM pedidoCliente;


CREATE OR REPLACE VIEW livroAutor
(nome, data_nascimento, nacionalidade,titulo, isbn,
ano_publicacao, preco, numero_paginas, idioma) AS
SELECT l.titulo,
    l.isbn,
    l.ano_publicacao,
    l.preco,
    l.numero_paginas,
    l.idioma,
    a.nome AS nome_autor,
    a.data_nascimento AS data_nascimento_autor,
    a.nacionalidade AS nacionalidade_autor
FROM livro AS l
INNER JOIN autor AS a ON l.autor_id = a.id_autor;
SELECT * FROM livroAutor;


CREATE OR REPLACE VIEW livroCategoria
(titulo, isbn, ano_publicacao, preco, numero_paginas, idioma,
nome_categoria, descricao_categoria) AS
SELECT l.titulo,
    l.isbn,
    l.ano_publicacao,
    l.preco,
    l.numero_paginas,
    l.idioma,
    c.nome_categoria AS nome_categoria,
    c.descricao_categoria AS descricao_categoria
FROM livro AS l
INNER JOIN categoria c ON l.categoria_id = c.id_categoria;
SELECT * FROM livroCategoria;