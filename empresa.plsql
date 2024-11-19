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

INSERT INTO departamento VALUES ('Contabilidade', 1, 10101010);
INSERT INTO departamento VALUES ('Engenharia Civil', 2, 30303030);
INSERT INTO departamento VALUES ('Engenharia Mecânica', 3, 20202020);

INSERT INTO empregado VALUES ('João Luiz', 10101010, 11111111, 1, NULL, 3000.00);
INSERT INTO empregado VALUES ('Fernando', 20202020, 22222222, 2, 10101010, 2500.00);
INSERT INTO empregado VALUES ('Ricardo', 30303030, 33333333, 2, 10101010, 2300.00);
INSERT INTO empregado VALUES ('Jorge', 40404040, 44444444, 2, 20202020, 4200.00);
INSERT INTO empregado VALUES ('Renato', 50505050, 55555555, 3, 20202020, 1300.00);

INSERT INTO projeto VALUES ('Financeiro 1', 5, 'São Paulo');
INSERT INTO projeto VALUES ('Motor 3', 10, 'Rio Claro');
INSERT INTO projeto VALUES ('Prédio Central', 20, 'Campinas');

INSERT INTO dependentes VALUES (10101010, 'Jorge', TO_DATE('27/12/1986', 'DD/MM/YYYY'), 'Filho', 'Masculino');
INSERT INTO dependentes VALUES (10101010, 'Luiz', TO_DATE('18/11/1979', 'DD/MM/YYYY'), 'Filho', 'Masculino');
INSERT INTO dependentes VALUES (20202020, 'Fernanda', TO_DATE('14/02/1969', 'DD/MM/YYYY'), 'Cônjuge', 'Feminino');
INSERT INTO dependentes VALUES (20202020, 'Ângelo', TO_DATE('10/02/1995', 'DD/MM/YYYY'), 'Filho', 'Masculino');
INSERT INTO dependentes VALUES (30303030, 'Adreia', TO_DATE('01/05/1990', 'DD/MM/YYYY'), 'Filho', 'Feminino');

INSERT INTO departamento_projeto VALUES (2, 5);
INSERT INTO departamento_projeto VALUES (2, 10);
INSERT INTO departamento_projeto VALUES (2, 20);

INSERT INTO empregado_projeto VALUES (20202020, 5, 10);
INSERT INTO empregado_projeto VALUES (20202020, 10, 25);
INSERT INTO empregado_projeto VALUES (30303030, 5, 35);
INSERT INTO empregado_projeto VALUES (40404040, 20, 20);
INSERT INTO empregado_projeto VALUES (50505050, 20, 25);

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
