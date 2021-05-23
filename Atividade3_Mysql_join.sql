/*
Atividade 3
Crie um banco de dados para um serviço de farmácia de uma empresa, o nome do banco
deverá ter o seguinte nome db_farmacia_do_bem, onde o sistema trabalhará com as
informações dos produtos desta empresa.
O sistema trabalhará com 2 tabelas tb_produto e tb_categoria.
siga exatamente esse passo a passo:
Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos
relevantes do tb_categoria para se trabalhar com o serviço desta farmacia.
Crie uma tabela de tb_produto e utilizando a habilidade de abstração e determine 5
atributos relevantes dos tb_produto para se trabalhar com o serviço deste farmacia(não
esqueça de criar a foreign key de tb_categoria nesta tabela).
Popule esta tabela Categoria com até 5 dados.
Popule esta tabela Produto com até 8 dados.
Faça um select que retorne os Produtos com o valor maior do que 50 reais.
Faça um select trazendo os Produtos com valor entre 3 e 60 reais.
Faça um select utilizando LIKE buscando os Produtos com a letra B.
Faça um um select com Inner join entre tabela categoria e produto.
Faça um select onde traga todos os Produtos de uma categoria específica (exemplo todos
os produtos que são cosméticos).
salve as querys para cada uma dos requisitos o exercício em um arquivo .SQL ou texto e
coloque no seu GitHuB pessoal e compartilhe esta atividade.
*/


CREATE DATABASE db_farmacia_do_bem;

USE db_farmacia_do_bem;


CREATE TABLE tb_categoria(
id_categoria BIGINT AUTO_INCREMENT,
nome VARCHAR (255) NOT NULL,
quant_estoque BIGINT,

PRIMARY KEY (id_categoria)
);


CREATE TABLE tb_produto(
id_produto BIGINT AUTO_INCREMENT,
nome_do_produto VARCHAR (255) NOT NULL,
preco decimal(5,2),
venda_sobre_pres_medica BOOLEAN,
id_categoria BIGINT,

FOREIGN KEY (id_categoria) REFERENCES tb_categoria (id_categoria),
PRIMARY KEY (id_produto)
);


INSERT INTO tb_categoria(nome ,quant_estoque)
VALUES 
("Curatico",200),
("Antibiotico",15),
("anti-alergico",10),
("analgésico",300),
("injeção",150);


INSERT INTO tb_produto (nome_do_produto, preco,venda_sobre_pres_medica, id_categoria)
VALUES
("Amoxilina 1", 10.50, true,1),
("xarope 1", 19.90, false,2),
("Dipirona 1", 40.50, true,1),
("Amoxilina 2", 20.50, false,1),
("xarope 2", 30.90, true,2),
("Dipirona B2", 20.50,false,2),
("Amoxilina 3", 20.50,true,1),
("xarope 3", 99.90,false ,1);



SELECT * FROM tb_produto
WHERE preco > 50;

SELECT * FROM tb_produto
WHERE preco BETWEEN 3 AND 60; 

SELECT * FROM tb_produto
WHERE nome_do_produto LIKE "%B"; 

SELECT * FROM tb_produto
INNER JOIN tb_categoria
ON tb_produto.id_categoria = tb_categoria.id_categoria; 

SELECT * FROM tb_produto
INNER JOIN tb_categoria
ON tb_produto.id_categoria = tb_categoria.id_categoria
WHERE tb_categoria.nome = "injeçao"; 