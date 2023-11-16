DELIMITER $$
CREATE PROCEDURE inserirLivro (
    IN titulo VARCHAR(255),
    IN isbn VARCHAR(13),
    IN ano_publicacao INT,
    IN preco DECIMAL(10, 2),
    IN descricao TEXT,
    IN numero_paginas INT,
    IN idioma VARCHAR(50)
)
BEGIN
    INSERT INTO livro (titulo, isbn, ano_publicacao, preco, descricao, numero_paginas, idioma)
    VALUES (titulo, isbn, ano_publicacao, preco, descricao, numero_paginas, idioma);
END;
$$
DELIMITER ;

-- 2. Procedimento para Atualizar o Preço de Todos os Livros de um Autor
DELIMITER $$
CREATE PROCEDURE atualizarPrecoLivrosAutor (
    IN autor_id INT,
    IN novo_preco DECIMAL(10, 2)
)
BEGIN
    UPDATE Livro
    SET preco = novo_preco
    WHERE livro_id IN (SELECT livro_id FROM LivroAutor WHERE autor_id = autor_id);
END;
$$
DELIMITER ;

-- 3. Procedimento com Uso de Cursor para Relatório de Pedidos de um Cliente
DELIMITER $$
CREATE PROCEDURE relatorioPedidosCliente (
    IN cliente_id INT
)
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE pedido_id INT;
    DECLARE data_pedido DATE;
    DECLARE status_pedido VARCHAR(50);

    -- Cursor para percorrer os pedidos do cliente
    DECLARE pedido_cursor CURSOR FOR
    SELECT pedido_id, data_pedido, status_pedido
    FROM Pedido
    WHERE pedido_id IN (SELECT pedido_id FROM clientePedido WHERE cliente_id = cliente_id);

    -- Lidar com resultados do cursor
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN pedido_cursor;

    -- Iniciar loop
    read_loop: LOOP
        FETCH pedido_cursor INTO pedido_id, data_pedido, status_pedido;

        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Imprimir informações do pedido (você pode personalizar a saída conforme necessário)
        SELECT CONCAT('Pedido ID: ', pedido_id, ', Data: ', data_pedido, ', Status: ', status_pedido);

    END LOOP;

    CLOSE pedido_cursor;
END;
$$
DELIMITER ;


DELIMITER $$

CREATE FUNCTION precoMedioCategoria(categoria_nome VARCHAR(255))
RETURNS DECIMAL(10, 2)
BEGIN
    DECLARE avg_price DECIMAL(10, 2);
    SELECT AVG(Livro.preco)
    INTO avg_price
    FROM livro
    INNER JOIN livroCategoria ON livro.livro_id = livroCategoria.livro_id
    INNER JOIN categoria ON livroCategoria.categoria_id = categoria.categoria_id
    WHERE categoria.nome_categoria = categoria_nome;
    RETURN avg_price;
END;
$$
DELIMITER ;



DELIMITER $$

CREATE FUNCTION ContarPedidosCliente(cliente_id INT)
RETURNS INT
BEGIN
    DECLARE pedido_count INT;
    SELECT COUNT(*) INTO pedido_count FROM ClientePedido WHERE cliente_id = cliente_id;
    RETURN pedido_count;
END;
$$
DELIMITER ;



DELIMITER $$

CREATE FUNCTION AutorComMaisLivros()
RETURNS VARCHAR(255)
BEGIN
    DECLARE autor_nome VARCHAR(255);
    SELECT Autor.nome
    INTO autor_nome
    FROM Autor
    INNER JOIN LivroAutor ON Autor.autor_id = LivroAutor.autor_id
    GROUP BY Autor.nome
    ORDER BY COUNT(LivroAutor.livro_id) DESC
    LIMIT 1;
    RETURN autor_nome;
END;
$$
DELIMITER ;

!--

DELIMITER $$

CREATE TRIGGER Livro_Insercao
AFTER INSERT ON Livro
FOR EACH ROW
BEGIN
    DECLARE novo_estoque INT;
    SELECT quantidade_estoque INTO novo_estoque FROM Estoque WHERE estoque_id = NEW.livro_id;
    SET novo_estoque = novo_estoque + 1;
    UPDATE Estoque SET quantidade_estoque = novo_estoque WHERE estoque_id = NEW.livro_id;
END;
$$
DELIMITER ;



DELIMITER $$

CREATE TRIGGER Livro_Atualizacao
AFTER UPDATE ON Livro
FOR EACH ROW
BEGIN
    INSERT INTO AuditoriaLivro (livro_id, data_modificacao, preco_anterior, preco_novo)
    VALUES (NEW.livro_id, NOW(), OLD.preco, NEW.preco);
END;
$$
DELIMITER ;



DELIMITER $$


CREATE TRIGGER Livro_Exclusao
BEFORE DELETE ON Livro
FOR EACH ROW
BEGIN
    DECLARE novo_estoque INT;
    SELECT quantidade_estoque INTO novo_estoque FROM Estoque WHERE estoque_id = OLD.livro_id;
    SET novo_estoque = novo_estoque - 1;
    UPDATE Estoque SET quantidade_estoque = novo_estoque WHERE estoque_id = OLD.livro_id;
END;
$$
DELIMITER ;