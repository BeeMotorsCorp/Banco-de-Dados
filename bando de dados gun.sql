CREATE SCHEMA sport_gun;
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
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    sobrenome VARCHAR(50) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE, 
    telefone VARCHAR(20),
    usuario VARCHAR(50) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    data_criacao DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE documentos_usuario (
    id_documento_usuario INT AUTO_INCREMENT PRIMARY KEY, 
    id_usuario INT NOT NULL, -- Chave estrangeira para o usuário na tabela 'usuarios'.

    --Esses ENUM aí abaixo significa Enumeração, que a função dele é aceitar somente um dos valores listados
    comprovante_capacidade_tecnica ENUM('Aprovado', 'Pendente', 'Reprovado') DEFAULT 'Pendente',
    
    comprovante_habitualidade ENUM('Aprovado', 'Pendente', 'Reprovado') DEFAULT 'Pendente',
    
    declaracao_seguranca_acervo ENUM('Aprovado', 'Pendente', 'Reprovado') DEFAULT 'Pendente',
    
    certidao_antecedente_federal ENUM('Aprovado', 'Pendente', 'Reprovado') DEFAULT 'Pendente',
    
    declaracao_nao_responde_inquerito ENUM('Aprovado', 'Pendente', 'Reprovado') DEFAULT 'Pendente',
    
    documento_identificacao ENUM('Aprovado', 'Pendente', 'Reprovado') DEFAULT 'Pendente',
    
    laudo_aptidao_psicologica ENUM('Aprovado', 'Pendente', 'Reprovado') DEFAULT 'Pendente',
    
    comprovante_residencia ENUM('Aprovado', 'Pendente', 'Reprovado') DEFAULT 'Pendente',
    
    comprovante_ocupacao_licita ENUM('Aprovado', 'Pendente', 'Reprovado') DEFAULT 'Pendente',
    
    certidao_antecedente_estadual ENUM('Aprovado', 'Pendente', 'Reprovado') DEFAULT 'Pendente',
    
    certidao_antecedente_militar ENUM('Aprovado', 'Pendente', 'Reprovado') DEFAULT 'Pendente',
    
    certidao_antecedente_eleitoral ENUM('Aprovado', 'Pendente', 'Reprovado') DEFAULT 'Pendente',
    
    data_envio DATETIME DEFAULT CURRENT_TIMESTAMP, -- Data em que o registro foi criado
    data_ultima_analise DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Última data de atualização 
    
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) -- esse REFERENCE é para ligar o "id_usuario" da tabela "usuarios" com o "id_usuario" da tabela "documentos_usuario"
);
