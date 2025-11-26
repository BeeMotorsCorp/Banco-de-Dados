CREATE VIEW vw_usuarios_nome_completo AS
SELECT
    id_usuario,
    CONCAT(nome, ' ', sobrenome) AS nome_completo, 
    data_criacao
FROM
    Usuarios;

select * from vw_usuarios_nome_completo;

CREATE VIEW vw_total_usuarios AS
SELECT
    COUNT(id_usuario) AS total_usuarios
FROM
    Usuarios;
    
    select * from vw_total_usuarios ;