SET DEFINE off;

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "LAB_BANCO"."UPSET_BOLSAS"(
    b_ano INTEGER,
    id_curso INTEGER,
    id_intituicao_ensino INTEGER,
    id_beneficiario INTEGER,
    id_tipo_bolsa INTEGER
) AS    v_count integer;
BEGIN
    SELECT  COUNT(*) INTO v_count 
    FROM    bolsas 
    WHERE   bol_cur_id = id_curso
        AND bol_bnf_id = id_beneficiario
        AND bol_ano = b_ano
        AND bol_ins_id = id_intituicao_ensino
        AND bol_tip_id = id_tipo_bolsa;
    IF v_count = 0 THEN
        INSERT INTO bolsas (bol_ano
                        ,   bol_cur_id
                        ,   bol_ins_id
                        ,   bol_bnf_id
                        ,   bol_tip_id) 
                    VALUES (b_ano
                        ,   id_curso
                        ,   id_intituicao_ensino
                        ,   id_beneficiario
                        ,   id_tipo_bolsa);
    END IF;
END UPSET_BOLSAS;