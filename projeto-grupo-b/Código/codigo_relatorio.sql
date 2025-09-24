/*IMOVEL
Pergunta: Quais imóveis do tipo "Casa" estão disponíveis com valor acima de R$ 500.000, ordenados pelo valor decrescente?*/
SELECT id_imovel, endereco, tipo, propret, valor 
FROM IMOVEL 
WHERE tipo = 'Casa' AND valor > 500000 
ORDER BY valor DESC;

/*IMOBILIARIA
Pergunta: Quais imobiliárias possuem avaliação 5 estrelas, ordenadas por nome?*/
SELECT cnpj, nome, ende, email, aval 
FROM IMOBILIARIA 
WHERE aval = 5 
ORDER BY nome;

/*REGISTRO
Pergunta: Quais registros foram feitos no "Parque Sol" com preço superior a R$ 3.000, ordenados por data?*/
SELECT id_registro, data_registro, local, preco 
FROM REGISTRO 
WHERE local = 'Parque Sol' AND preco > 3000 
ORDER BY data_registro;

/*ANUNCIA
Pergunta: Quais são os anúncios realizados a partir de 2023?*/
SELECT id_imovel, cnpj, data_anuncio 
FROM ANUNCIA 
WHERE data_anuncio >= '2023-01-01' 
ORDER BY data_anuncio DESC;

/*SITE
Pergunta: Quais sites possuem "blog" na descrição?*/
SELECT url, nome, emailcontt, descri 
FROM SITE 
WHERE descri LIKE '%blog%';

/*ENTREGA
Pergunta: Quais entregas foram realizadas no ano de 2022?*/
SELECT url, cnpj, data_entrega 
FROM ENTREGA 
WHERE YEAR(data_entrega) = 2022 
ORDER BY data_entrega;

/*CLIENTE
Pergunta: Quais clientes possuem email do domínio "example.org"?*/
SELECT cpf, nome, ende, email 
FROM CLIENTE 
WHERE email LIKE '%@example.org';

/*PROPOSTA
Pergunta: Quais propostas foram "Aceitas" com valor acima de R$ 300.000?*/
SELECT id_proposta, valor, dat, proponente, resgprost 
FROM PROPOSTA 
WHERE resgprost = 'Aceita' AND valor > 300000 
ORDER BY valor DESC;

/*FAZ
Pergunta: Quais associações entre clientes e propostas existem no sistema?*/
SELECT cpf, id_proposta 
FROM FAZ 
ORDER BY cpf;

/*COMPRA
Pergunta: Quais compras foram pagas com "Cartão de Débito" e tiveram valor superior a R$ 300.000?*/
SELECT id_compra, valpag, nomecomprad, metpag, data_compra 
FROM COMPRA 
WHERE metpag = 'Cartão de Débito' AND valpag > 300000 
ORDER BY valpag DESC;
