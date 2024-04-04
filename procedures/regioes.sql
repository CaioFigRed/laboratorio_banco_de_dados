SET DEFINE off;

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "LAB_BANCO"."UPSET_REGIOES"(
    r_nome VARCHAR2,
    regiao_id OUT INTEGER
) AS    v_count integer;
BEGIN
    IF r_nome IS NOT NULL THEN
        SELECT COUNT(*) INTO v_count FROM regioes WHERE reg_nome = r_nome;
        IF v_count = 0 THEN
            INSERT INTO regioes (reg_nome) VALUES (r_nome)
            RETURNING reg_id INTO regiao_id;
        ELSE
            SELECT reg_id INTO regiao_id FROM regioes WHERE reg_nome = r_nome;
        END IF;
    END IF;
END UPSET_REGIOES;