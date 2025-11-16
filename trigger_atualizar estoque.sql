
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



DELIMITER $$

CREATE TRIGGER trg_insert_produtos_estoque_zero_insert
BEFORE INSERT ON produtos
FOR EACH ROW
BEGIN
    IF NEW.estoque = 0 THEN
        SET NEW.badge = 'indisponível';
        SET NEW.disponivel = 'Não';
    END IF;
END$$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER trg_isert_produtos_estoque_voltou
BEFORE INSERT ON produtos
FOR EACH ROW
BEGIN
    IF NEW.estoque > 0 THEN
        SET NEW.badge = 'disponivel';
        SET NEW.disponivel = 'Sim';
    END IF;
END$$

DELIMITER ;
