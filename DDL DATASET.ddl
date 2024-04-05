-- Gerado por Oracle SQL Developer Data Modeler 19.4.0.350.1424
--   em:        2024-03-15 20:12:07 GMT-03:00
--   site:      Oracle Database 12c
--   tipo:      Oracle Database 12c



CREATE TABLE beneficiarios (
    bnf_id                 NUMBER NOT NULL,
    bnf_cpf                CHAR(11),
    bnf_dat_nasc           DATE,
    bnf_deficiente_fisico  CHAR(1),
    bnf_sex_id             NUMBER NOT NULL,
    bnf_rcs_id             NUMBER(6) NOT NULL,
    bnf_mun_id             NUMBER(6) NOT NULL
);

COMMENT ON COLUMN beneficiarios.bnf_id IS
    'Armazena o identificador unico do beneficiario';

COMMENT ON COLUMN beneficiarios.bnf_cpf IS
    'Armazena cpf do beneficiario';

COMMENT ON COLUMN beneficiarios.bnf_dat_nasc IS
    'Armazena data de nascimento do beneficiario';

COMMENT ON COLUMN beneficiarios.bnf_deficiente_fisico IS
    'Armazena se o beneficiario e deficiente fisico';

COMMENT ON COLUMN beneficiarios.bnf_sex_id IS
    'Armazena identificador unico do sexo do beneficiario';

COMMENT ON COLUMN beneficiarios.bnf_rcs_id IS
    'Armazena identificador unico da raca do beneficiario';

COMMENT ON COLUMN beneficiarios.bnf_mun_id IS
    'Armazena identificador unico do municipio onde o beneficiario mora';

ALTER TABLE beneficiarios ADD CONSTRAINT bnf_pk PRIMARY KEY ( bnf_id );

CREATE TABLE bolsas (
    bol_id      NUMBER(6) NOT NULL,
    bol_ano     NUMBER NOT NULL,
    bol_cur_id  NUMBER NOT NULL,
    bol_ins_id  NUMBER(6) NOT NULL,
    bol_bnf_id  NUMBER NOT NULL,
    bol_tip_id  NUMBER(6) NOT NULL
);

COMMENT ON COLUMN bolsas.bol_id IS
    'Armazena o identificador unico da bolsa';

COMMENT ON COLUMN bolsas.bol_ano IS
    'Armazena ano que a bolsa foi concedida';

COMMENT ON COLUMN bolsas.bol_cur_id IS
    'Armazena identificador unico do curso oferecido pela bolsa';

COMMENT ON COLUMN bolsas.bol_ins_id IS
    'Armazena identificador unico da instituicao de ensino que ira ofertar a bolsa';

COMMENT ON COLUMN bolsas.bol_bnf_id IS
    'Armazena o identificador unico do beneficiario da bolsa';

COMMENT ON COLUMN bolsas.bol_tip_id IS
    'Armazena o identificador unico do tipo de bolsa';

ALTER TABLE bolsas ADD CONSTRAINT bol_pk PRIMARY KEY ( bol_id );

CREATE TABLE cursos (
    cur_id      NUMBER NOT NULL,
    cur_nome    VARCHAR2(255),
    cur_mod_id  NUMBER(6) NOT NULL,
    cur_tur_id  NUMBER(6) NOT NULL
);

COMMENT ON COLUMN cursos.cur_id IS
    'Armazena identificador unico do curso';

COMMENT ON COLUMN cursos.cur_nome IS
    'Armazena nome do curso';

COMMENT ON COLUMN cursos.cur_mod_id IS
    'Armazena identificador unico da modalidade do curso';

COMMENT ON COLUMN cursos.cur_tur_id IS
    'Armazena identificador unico do turno do curso';

ALTER TABLE cursos ADD CONSTRAINT cur_pk PRIMARY KEY ( cur_id );

CREATE TABLE instituicoes_ensino (
    ins_id    NUMBER(6) NOT NULL,
    ins_nome  VARCHAR2(255) NOT NULL
);

COMMENT ON COLUMN instituicoes_ensino.ins_id IS
    'Armazena identificador unico da instituicao de ensino';

COMMENT ON COLUMN instituicoes_ensino.ins_nome IS
    'Armazena nome da instituicao de ensino';

ALTER TABLE instituicoes_ensino ADD CONSTRAINT ins_pk PRIMARY KEY ( ins_id );

CREATE TABLE modalidades (
    mod_id    NUMBER(6) NOT NULL,
    mod_nome  VARCHAR2(50)
);

COMMENT ON COLUMN modalidades.mod_id IS
    'Armazena identificador unico da modalidade do curso';

COMMENT ON COLUMN modalidades.mod_nome IS
    'Armazena nome da modalidade de curso';

ALTER TABLE modalidades ADD CONSTRAINT mod_pk PRIMARY KEY ( mod_id );

CREATE TABLE municipios (
    mun_id      NUMBER(6) NOT NULL,
    mun_nome    VARCHAR2(255),
    mun_ufs_id  NUMBER(6) NOT NULL
);

COMMENT ON COLUMN municipios.mun_id IS
    'Armazena identificador unico do municipio';

COMMENT ON COLUMN municipios.mun_nome IS
    'Armazena nome do municipio';

COMMENT ON COLUMN municipios.mun_ufs_id IS
    'Armazena identificador unico da uf a qual o municipio pertence';

ALTER TABLE municipios ADD CONSTRAINT mun_pk PRIMARY KEY ( mun_id );

CREATE TABLE racas (
    rcs_id    NUMBER(6) NOT NULL,
    rcs_nome  VARCHAR2(10)
);

COMMENT ON COLUMN racas.rcs_id IS
    'armazena identificador unico de regioes';

COMMENT ON COLUMN racas.rcs_nome IS
    'Armazena nome da raca cadastrada';

ALTER TABLE racas ADD CONSTRAINT rcs_pk PRIMARY KEY ( rcs_id );

CREATE TABLE regioes (
    reg_id    NUMBER(6) NOT NULL,
    reg_nome  VARCHAR2(12)
);

COMMENT ON COLUMN regioes.reg_id IS
    'Armazena o identificador unico de regioes';

COMMENT ON COLUMN regioes.reg_nome IS
    'Armazena nome da tegiao armazenada';

ALTER TABLE regioes ADD CONSTRAINT reg_pk PRIMARY KEY ( reg_id );

CREATE TABLE sexos (
    sex_id     NUMBER NOT NULL,
    sex_letra  CHAR(2) NOT NULL
);

COMMENT ON COLUMN sexos.sex_id IS
    'Armazena identifcador unico de sexos';

COMMENT ON COLUMN sexos.sex_letra IS
    'Armazena a letra que identifica o sexo';

ALTER TABLE sexos ADD CONSTRAINT sex_pk PRIMARY KEY ( sex_id );

CREATE TABLE tipos_bolsa (
    tip_id    NUMBER(6) NOT NULL,
    tip_nome  VARCHAR2(50)
);

COMMENT ON COLUMN tipos_bolsa.tip_id IS
    'Armazena identificador unico de tipos de bolsas';

COMMENT ON COLUMN tipos_bolsa.tip_nome IS
    'Armazena nome do tipo de bolsa cadastrado';

ALTER TABLE tipos_bolsa ADD CONSTRAINT tip_bol_pk PRIMARY KEY ( tip_id );

CREATE TABLE turnos_curso (
    tur_id    NUMBER(6) NOT NULL,
    tur_nome  VARCHAR2(50)
);

COMMENT ON COLUMN turnos_curso.tur_id IS
    'Armazena identificador unico do turno de curso';

COMMENT ON COLUMN turnos_curso.tur_nome IS
    'Armazena o nome do turno de curso';

ALTER TABLE turnos_curso ADD CONSTRAINT tur_pk PRIMARY KEY ( tur_id );

CREATE TABLE ufs (
    ufs_id      NUMBER(6) NOT NULL,
    ufs_sigla   CHAR(2),
    ufs_reg_id  NUMBER(6) NOT NULL
);

COMMENT ON COLUMN ufs.ufs_id IS
    'Armazena identificador unico da uf';

COMMENT ON COLUMN ufs.ufs_sigla IS
    'Armazena a sigla da uf';

COMMENT ON COLUMN ufs.ufs_reg_id IS
    'Armazena o identifcador unico da regiao a qual a uf pertence';

ALTER TABLE ufs ADD CONSTRAINT ufs_pk PRIMARY KEY ( ufs_id );



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            12
-- CREATE INDEX                             0
-- ALTER TABLE                             12
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- TSDP POLICY                              0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
