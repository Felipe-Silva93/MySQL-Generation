/*Atividade 2

Crie um banco de dados para um serviço de pizzaria de uma empresa, o nome do banco
deverá ter o seguinte nome db_pizzaria_legal, onde o sistema trabalhará com as
informações dos produtos desta empresa.

O sistema trabalhará com 2 tabelas tb_pizza e tb_categoria.

siga exatamente esse passo a passo:

Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos
relevantes do tb_categoria para se trabalhar com o serviço dessa pizzaria.

Crie uma tabela de tb_pizza e utilizando a habilidade de abstração e determine 5 atributos
relevantes dos tb_produto para se trabalhar com o serviço dessa pizzaria(não esqueça de
criar a foreign key de tb_categoria nesta tabela).

Popule esta tabela Categoria com até 5 dados.

Popule esta tabela pizza com até 8 dados.

Faça um select que retorne os Produtos com o valor maior do que 45 reais.

Faça um select trazendo os Produtos com valor entre 29 e 60 reais.

Faça um select utilizando LIKE buscando os Produtos com a letra C.

Faça um um select com Inner join entre tabela categoria e pizza.

Faça um select onde traga todos os Produtos de uma categoria específica (exemplo todos
os produtos que são pizza doce).
salve as querys para cada uma dos requisitos o exercício em um arquivo .SQL ou texto e
coloque no seu GitHuB pessoal e compartilhe esta atividade.*/

CREATE DATABASE db_pizzaria_legal;

USE db_pizzaria_legal;


CREATE TABLE tb_categoria(
id_categoria BIGINT AUTO_INCREMENT,
nome VARCHAR (255) NOT NULL,
tipo VARCHAR(255),

PRIMARY KEY (id_categoria)
);


CREATE TABLE tb_pizza(
id_pizza BIGINT AUTO_INCREMENT,
nome_da_pizza VARCHAR (255) NOT NULL,
preco decimal(5,2),
quantidade_de_pedacos INT,
borda BOOLEAN,
id_categoria BIGINT,

FOREIGN KEY (id_categoria) REFERENCES tb_categoria (id_categoria),
PRIMARY KEY (id_pizza)
);


INSERT INTO tb_categoria (nome , tipo)
VALUES 
("Pizza1", "massa leve"),
("pizza2", "massa pesada"),
("pizza3", "massa leve"),
("pizza4", "massa pesada"),
("Broto", "massa leve");


INSERT INTO tb_pizza (nome_da_pizza, preco,quantidade_de_pedacos,borda, id_categoria)
VALUES
("pizza portuguesa", 50.00, 8,true, 1),
("pizza margarida", 59.00, 8,true, 2),
("pizza loka", 40.00, 8,false, 6),
("pizza a moda da casa", 60.00, 8,true, 7),
("pizza moda da casa 2", 20.00, 8,true, 8),
("pizza de peixe", 29.00, 8,false, 3),
("pizza vegana", 30.00, 8,true, 5),
("pizza vegetariana", 60.00, 4,true, 6);

SELECT * FROM tb_pizza
WHERE preco > 45; 

SELECT * FROM tb_pizza
WHERE preco BETWEEN 29 AND 60;

SELECT * FROM tb_pizza
WHERE nome LIKE "%C%"; 

SELECT * FROM tb_pizza
INNER JOIN tb_categoria
ON tb_pizza.id_categoria = tb_categoria.id_categoria;

SELECT * FROM tb_pizza
INNER JOIN tb_categoria
ON tb_pizza.id_categoria = tb_categoria.id_categoria
WHERE tb_categoria.nome = "pizza1"; 