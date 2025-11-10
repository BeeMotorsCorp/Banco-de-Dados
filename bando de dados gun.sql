CREATE SCHEMA loja_arma;
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
    data_atualizacao DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP -- ultima vez que foi atualizado
);

CREATE TABLE usuarios (
    
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    sobrenome VARCHAR(100) NOT NULL, 
    cpf VARCHAR(14) NOT NULL UNIQUE, -- a funçao desse unique é que não tenha valores iguais
    senha VARCHAR(255) NOT NULL,
    data_criacao DATETIME DEFAULT CURRENT_TIMESTAMP
);
