CREATE TABLE empregado (
    nome VARCHAR2(50 CHAR) NOT NULL,
    rg NUMBER(8) NOT NULL,
    cic NUMBER(8) NOT NULL,
    depto INTEGER NOT NULL,
    rg_supervisor NUMBER(8),
    salario NUMBER(7, 2)
);

ALTER TABLE empregado ADD CONSTRAINT empregado_pk PRIMARY KEY ( rg );

CREATE TABLE departamento (
    nome VARCHAR2(30 CHAR) NOT NULL,
    numero INTEGER NOT NULL,
    rg_gerente NUMBER(8)
);

ALTER TABLE departamento ADD CONSTRAINT departamento_pk PRIMARY KEY ( numero );

CREATE TABLE projeto (
    nome VARCHAR2(30 CHAR) NOT NULL,
    numero INTEGER NOT NULL,
    localizacao VARCHAR2(20 CHAR) NOT NULL
);

ALTER TABLE projeto ADD CONSTRAINT projeto_pk PRIMARY KEY ( numero );

CREATE TABLE dependentes (
    rg_responsavel NUMBER(8) NOT NULL,
    nome_dependente VARCHAR2(30 CHAR) NOT NULL,
    nascimento date NOT NULL,
    sexo VARCHAR2(10 CHAR)
);

ALTER TABLE dependentes ADD CONSTRAINT dependentes_pk PRIMARY KEY ( rg_responsavel, nome_dependente );

CREATE TABLE departamento_projeto (
    numero_depto INTEGER NOT NULL,
    numero_projeto INTEGER NOT NULL
);

ALTER TABLE departamento_projeto ADD CONSTRAINT departamento_projeto_pk PRIMARY KEY ( numero_depto, numero_projeto );

CREATE TABLE empregado_projeto (
    rg_empregado NUMBER(8) NOT NULL,
    numero_projeto INTEGER NOT NULL,
    horas INTEGER
);

ALTER TABLE empregado_projeto ADD CONSTRAINT empregado_projeto_pk PRIMARY KEY ( rg_empregado, numero_projeto );

ALTER TABLE EMPREGADO
ADD CONSTRAINT FK_EMPREGADO_DEPARTAMENTO FOREIGN KEY (Depto)
REFERENCES DEPARTAMENTO(Numero);

-- Adicionando a chave estrangeira na tabela EMPREGADO para EMPREGADO (Supervisor)
ALTER TABLE EMPREGADO
ADD CONSTRAINT FK_EMPREGADO_SUPERVISOR FOREIGN KEY (RG_Supervisor)
REFERENCES EMPREGADO(RG);

-- Adicionando a chave estrangeira na tabela DEPENDENTES para EMPREGADO
ALTER TABLE DEPENDENTES
ADD CONSTRAINT FK_DEPENDENTES_RESPONSAVEL FOREIGN KEY (RG_Responsavel)
REFERENCES EMPREGADO(RG);

-- Adicionando a chave estrangeira na tabela DEPARTAMENTO para EMPREGADO (Gerente)
ALTER TABLE DEPARTAMENTO
ADD CONSTRAINT FK_DEPARTAMENTO_GERENTE FOREIGN KEY (RG_Gerente)
REFERENCES EMPREGADO(RG);

-- Adicionando a chave estrangeira na tabela DEPARTAMENTO_PROJETO para DEPARTAMENTO
ALTER TABLE DEPARTAMENTO_PROJETO
ADD CONSTRAINT FK_DEPARTAMENTO_PROJETO_DEPARTAMENTO FOREIGN KEY (Numero_Depto)
REFERENCES DEPARTAMENTO(Numero);

-- Adicionando a chave estrangeira na tabela DEPARTAMENTO_PROJETO para PROJETO
ALTER TABLE DEPARTAMENTO_PROJETO
ADD CONSTRAINT FK_DEPARTAMENTO_PROJETO_PROJETO FOREIGN KEY (Numero_Projeto)
REFERENCES PROJETO(Numero);

-- Adicionando a chave estrangeira na tabela EMPREGADO_PROJETO para EMPREGADO
ALTER TABLE EMPREGADO_PROJETO
ADD CONSTRAINT FK_EMPREGADO_PROJETO_EMPREGADO FOREIGN KEY (RG_Empregado)
REFERENCES EMPREGADO(RG);

-- Adicionando a chave estrangeira na tabela EMPREGADO_PROJETO para PROJETO
ALTER TABLE EMPREGADO_PROJETO
ADD CONSTRAINT FK_EMPREGADO_PROJETO_PROJETO FOREIGN KEY (Numero_Projeto)
REFERENCES PROJETO(Numero);