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

ALTER TABLE empregado
ADD CONSTRAINT fk_empregado_departamento FOREIGN KEY (depto)
REFERENCES deapartamento(numero);

ALTER TABLE empregado
ADD CONSTRAINT fk_empregado_supervisor FOREIGN KEY (rg_supervisor)
REFERENCES empregado(rg);

ALTER TABLE dependentes
ADD CONSTRAINT fk_dependentes_responsavel FOREIGN KEY (rg_responsavel)
REFERENCES empregado(rg);

ALTER TABLE departamento
ADD CONSTRAINT fk_departamento_gerente FOREIGN KEY (rg_gerente)
REFERENCES empregado(rg);

ALTER TABLE departamento_projeto
ADD CONSTRAINT fk_departamento_projeto_departamento FOREIGN KEY (numero_depto)
REFERENCES departamento(numero);

ALTER TABLE departamento_projeto
ADD CONSTRAINT fk_departamento_projeto_projeto FOREIGN KEY (numero_projeto)
REFERENCES projeto(numero);

ALTER TABLE empregado_projeto
ADD CONSTRAINT fk_empregado_projeto_empregado FOREIGN KEY (rg_empregado)
REFERENCES empregado(rg);

ALTER TABLE empregado_projeto
ADD CONSTRAINT fk_empregado_projeto_projeto FOREIGN KEY (numero_projeto)
REFERENCES projeto(numero);
