CREATE SCHEMA loja_arma;
CREATE TABLE categoria_arma(
id_arma INT AUTO_INCREMENT PRIMARY KEY,
Pistolas VARCHAR(50) NOT NULL,
Revólveres VARCHAR(50) NOT NULL,
Armas_Táticas VARCHAR(50) NOT NULL,
Armas_Longas VARCHAR(50) NOT NULL,
Acessórios VARCHAR(50) NOT NULL
);
select * from categoria_arma;

CREATE TABLE arma_info (
    id_arma INT AUTO_INCREMENT PRIMARY KEY,
    Marca VARCHAR(50) NOT NULL,
    Modelo VARCHAR(50) NOT NULL,
    Calibre VARCHAR(20) NOT NULL,
    Categoria VARCHAR(50) NOT NULL,
    Polegada_do_cano DECIMAL(4,2),
    Modo_de_disparo VARCHAR(50) NOT NULL,
    Nacionalidade VARCHAR(50) NOT NULL
);

select * from arma_info;
