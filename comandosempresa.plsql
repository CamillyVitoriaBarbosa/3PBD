SELECT empregado.nome
FROM empregado
JOIN departamento ON empregado.depto = departamento.numero
WHERE departamento.nome = 'Engenharia Civil';


SELECT projeto.numero AS numero_projeto, departamento_projeto.numero_depto AS numero_departamento, empregado.nome AS nome_gerente 
FROM projeto
JOIN departamento ON empregado.depto = departamento.numero
JOIN departamento ON departamento_projeto.numero_depto = departamento.numero
JOIN empregado ON departamento.rg_gerente = empregado.rg
WHERE projeto.localizacao = 'São Paulo';


SELECT empregado.nome
FROM empregado
WHERE NOT EXISTS (
    SELECT 1
    FROM departamento_projeto
    WHERE departamento_projeto.numero_depto = 3
    AND departamento_projeto.numero_projeto NOT IN (
        SELECT empregado_projeto.numero_projeto
        FROM empregado_projeto
        WHERE empregado_projeto.rg_empregado = empregado.rg
    )
);


SELECT DISTINCT departamento_projeto.numero_projeto
FROM empregado
JOIN empregado_projeto ON empregado.rg = empregado_projeto.rg_empregado
JOIN departamento_projeto ON departamento_projeto.numero_projeto = empregado_projeto.numero_projeto
WHERE empregado.nome = 'Fernando'
UNION
SELECT DISTINCT departamento_projeto.numero_projeto
FROM empregado
JOIN departamento ON departamento.rg_gerente = empregado.rg
JOIN departamento_projeto ON departamento_projeto.numero_depto = departamento.numero
WHERE empregado.nome = 'Fernando';


SELECT empregado.nome
FROM empregado
LEFT JOIN dependentes ON empregado.rg = dependentes.rg_responsavel
WHERE dependentes.rg_responsavel IS NULL;


SELECT empregado.nome
FROM empregado
JOIN departamento ON empregado.rg = departamento.rg_gerente
JOIN dependentes ON empregado.rg = dependentes.rg_responsavel;


SELECT DISTINCT departamento_projeto.numero_depto
FROM projeto
JOIN departamento_projeto ON projeto.numero = departamento_projeto.numero_projeto
WHERE projeto.localizacao = 'Rio Claro';


SELECT nome, rg
FROM empregado
WHERE rg IN (SELECT DISTINCT rg_supervisor FROM empregado WHERE rg_supervisor IS NOT NULL);


SELECT nome, salario
FROM empregado
WHERE salario >= 2000;


SELECT nome
FROM empregado
WHERE nome LIKE 'J%';


SELECT nome
FROM empregado
WHERE nome LIKE '%Luiz%' OR nome LIKE '%Luis%';


SELECT empregado.nome
FROM empregado
JOIN departamento ON empregado.depto = departamento.numero
WHERE departamento.nome = 'Engenharia Civil';


SELECT departamento.nome
FROM departamento
JOIN departamento_projeto ON departamento.numero = departamento_projeto.numero_depto
JOIN projeto ON departamento_projeto.numero_projeto = projeto.numero
WHERE projeto.nome = 'Motor 3';


SELECT empregado.nome
FROM empregado
JOIN empregado_projeto ON empregado.rg = empregado_projeto.rg_empregado
JOIN projeto ON empregado_projeto.numero_projeto = projeto.numero
WHERE projeto.nome = 'Financeiro 1';


SELECT empregado.nome
FROM empregado
JOIN empregado supervisores ON empregado.rg_supervisor = supervisores.rg
WHERE supervisores.salario BETWEEN 2000 AND 2500;


SELECT empregado.nome
FROM empregado
JOIN departamento ON empregado.rg = departamento.rg_gerente
JOIN dependentes ON empregado.rg = dependentes.rg_responsavel;


UPDATE empregado
SET salario = 3000
WHERE depto = 2;


UPDATE empregado
SET salario = salario * 1.10;


SELECT AVG(salario) AS media_salarial
FROM empregado;


SELECT nome
FROM empregado
WHERE salario > (SELECT AVG(salario) FROM empregado)
ORDER BY nome;
