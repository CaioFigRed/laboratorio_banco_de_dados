SET DEFINE off;

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "LAB_BANCO"."UPSET_CURSOS"(
    c_nome VARCHAR2,
    id_modalidade INTEGER,
    id_turno INTEGER,
    id_curso OUT INTEGER
) AS    v_count integer;
BEGIN
    SELECT COUNT(*) INTO v_count FROM cursos WHERE cur_nome = c_nome;
    IF v_count = 0 THEN
        INSERT INTO cursos (cur_nome, cur_mod_id, cur_tur_id) VALUES (c_nome, id_modalidade, id_turno)
        RETURNING cur_id INTO id_curso;
    ELSE
        SELECT cur_id INTO id_curso FROM cursos WHERE cur_nome = c_nome;
    END IF;
END UPSET_CURSOS;