SET DEFINE off;

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "LAB_BANCO"."UPSET_TIPOS_BOLSA"(
    NOME_TIPO_BOLSA VARCHAR2,
    ID_TIPO_BOLSA OUT INTEGER
) AS    v_count integer;
BEGIN
    IF NOME_TIPO_BOLSA IS NOT NULL THEN
        SELECT COUNT(*) INTO v_count FROM tipos_bolsa WHERE tip_nome = NOME_TIPO_BOLSA;
        IF v_count = 0 THEN
            INSERT INTO tipos_bolsa (tip_nome) VALUES (NOME_TIPO_BOLSA)
            RETURNING tip_id INTO ID_TIPO_BOLSA;
        ELSE
            SELECT tip_id INTO ID_TIPO_BOLSA FROM tipos_bolsa WHERE tip_nome = NOME_TIPO_BOLSA;
        END IF;
    END IF;
END UPSET_TIPOS_BOLSA;