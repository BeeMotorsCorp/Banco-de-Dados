CREATE TABLE produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    estoque INT NOT NULL,           
    calibre VARCHAR(20),
    capacidade VARCHAR(20),
    peso VARCHAR(20),             
    marca VARCHAR(50),
    categoria VARCHAR(50),
    badge VARCHAR(30),             
    imagem VARCHAR(255),   
    disponivel ENUM('Sim','Não') DEFAULT 'Sim',
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP, -- quando foi inserido
    data_atualizacao DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP -- ultima vez que foi atualizado
);

INSERT INTO produtos (nome, descricao, preco, estoque, calibre, capacidade, peso, marca, categoria, badge, imagem, disponivel)
VALUES ('Produto Teste', 'Descrição do produto teste', '100.00', 10, '9mm', '10', '500g', 'Marca Teste', 'Categoria Teste', 'Novo', 'teste.jpg', 'Sim');

INSERT INTO produtos (nome, descricao, preco, estoque, calibre, capacidade, peso, marca, categoria, badge, imagem, disponivel) 
VALUES ('Pistola Taurus', 'Pistola', '150.00', '5', '9mm', '13', '720g', 'Taurus', 'Pistolas', 'Oferta', 'texte.jpg', 'Sim');

DELIMITER $$
CREATE TRIGGER trg_produtos_estoque_zero_update
BEFORE UPDATE ON produtos
FOR EACH ROW
BEGIN
    IF NEW.estoque = 0 THEN
        SET NEW.badge = 'indisponível';
        SET NEW.disponivel = 'Não';
    END IF;
END$$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER trg_produtos_estoque_voltou
BEFORE UPDATE ON produtos
FOR EACH ROW
BEGIN
    IF NEW.estoque > 0 THEN
        SET NEW.badge = 'disponivel';
        SET NEW.disponivel = 'Sim';
    END IF;
END$$

DELIMITER ;


UPDATE produtos
SET estoque = 2
WHERE id = 2;

UPDATE produtos
SET estoque = 0
WHERE id = 1;

select * from produtos