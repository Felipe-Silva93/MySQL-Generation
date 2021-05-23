/*
Atividade 4
Crie um banco de dados para um serviço de um açougue ou uma quitanda, o nome do
banco deverá ter o seguinte nome db_cidade_das_carnes ou db_cidade_das_frutas, onde o
sistema trabalhará com as informações dos produtos desta empresa.
O sistema trabalhará com 2 tabelas tb_produto e tb_categoria.
siga exatamente esse passo a passo:
Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos
relevantes do tb_categoria para se trabalhar com o serviço desse açougue.
Crie uma tabela de tb_produto e utilize a habilidade de abstração e determine 5 atributos
relevantes dos tb_produto para se trabalhar com o serviço desse açougue(não esqueça de
criar a foreign key de tb_categoria nesta tabela).
Popule esta tabela Categoria com até 5 dados.
Popule esta tabela Produto com até 8 dados.
Faça um select que retorne os Produtos com o valor maior do que 50 reais.
Faça um select trazendo os Produtos com valor entre 3 e 60 reais.
Faça um select utilizando LIKE buscando os Produtos com a letra C.
Faça um um select com Inner join entre tabela categoria e produto.
Faça um select onde traga todos os Produtos de uma categoria específica (exemplo todos
os produtos que são aves ou legumes).
Salve as querys para cada uma dos requisitos do exercício em um arquivo .SQL ou texto e
coloque no seu GitHuB pessoal e compartilhe esta atividade.
*/


CREATE DATABASE db_cidade_das_frutas;

USE db_cidade_das_frutas;


CREATE TABLE tb_categoria(
id_categoria BIGINT AUTO_INCREMENT,
nome VARCHAR (255) NOT NULL,
estoque BIGINT,

PRIMARY KEY (id_categoria)
);

CREATE TABLE tb_produto(
id_produto BIGINT AUTO_INCREMENT,
nome_do_tipo_fruta VARCHAR (255) NOT NULL,
nome_da_fruta VARCHAR(255) NOT NULL,
preco decimal(5,2),
id_categoria BIGINT,

FOREIGN KEY (id_categoria) REFERENCES tb_categoria (id_categoria),
PRIMARY KEY (id_produto)
);



INSERT INTO tb_categoria(nome, estoque)
VALUES
("Fruta Citrica",50),
("Fruta Doce",30),
("Fruta Amarga",15),
("Verdura",15),
("Legumes",70);


INSERT INTO tb_produto (nome_do_tipo_fruta, nome_da_fruta, preco, id_categoria)
VALUES
("fruta a", "Banana", 16.3, 1),
("fruta aa", "Uva", 8.6, 1),
("fruta aaa", "Maçã", 18.5, 2),
("fruta b", "Laranja", 23.0, 3),
("fruta bb", "Morango", 18.5, 3),
("fruta bbb", "Uva", 59.75, 4),
("legumes a","Cenoura", 55.0, 5),
("verduta b", "Alface 5", 29.7, 5);

SELECT nome_do_tipo_fruta, nome_da_fruta, preco FROM tb_produto
WHERE preco > 50;

SELECT nome_do_tipo_fruta, nome_da_fruta, preco FROM tb_produto
WHERE preco BETWEEN 3 AND 60;

SELECT nome_do_tipo_fruta, preco FROM tb_produto
WHERE nome_da_fruta LIKE "%C%";

SELECT * FROM tb_produto
INNER JOIN tb_categoria
ON tb_produto.id_categoria = tb_categoria.id_categoria; 

SELECT * FROM tb_produto
INNER JOIN tb_categoria
ON tb_produto.id_categoria = tb_categoria.id_categoria
WHERE tb_categoria.nome = "verdura"; 