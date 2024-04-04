SET DEFINE off;

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "LAB_BANCO"."UPSET_MODALIDADES"(
    m_nome VARCHAR2,
    id_modalidade OUT INTEGER
) AS    v_count integer;
BEGIN
    IF m_nome IS NOT NULL THEN
        SELECT COUNT(*) INTO v_count FROM modalidades WHERE mod_nome = m_nome;
        IF v_count = 0 THEN
            INSERT INTO modalidades (mod_nome) VALUES (m_nome)
            RETURNING mod_id INTO id_modalidade;
        ELSE
            SELECT mod_id INTO id_modalidade FROM modalidades WHERE mod_nome = m_nome;
        END IF;
    END IF;
END UPSET_MODALIDADES;