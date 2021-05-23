


/*Atividade 1

Crie um banco de dados para um serviço de um game Online , o nome do banco deverá ter
o seguinte nome db_generation_game_online, onde, o sistema trabalhará com as
informações dos personagens desse game.

O sistema trabalhará com 2 tabelas tb_personagem e tb_classe.

siga exatamente esse passo a passo:

Crie uma tabela tb_classe utilizando a habilidade de abstração e determine 3 atributos
relevantes da classe para se trabalhar com o serviço desse game Online.

Crie uma tabela tb_personagem e utilizando a habilidade de abstração e determine 5
atributos relevantes dos funcionários para se trabalhar com o serviço desse game Online
(não esqueça de criar a foreign key de tb_classe nesta tabela).

Popule esta tabela classe com até 5 dados.

Popule esta tabela personagem com até 8 dados.

Faça um select que retorne os personagens com o poder de ataque maior do que 2000.

Faça um select trazendo os personagens com poder de defesa entre 1000 e 2000.

Faça um select utilizando LIKE buscando os personagens com a letra C.

Faça um um select com Inner join entre tabela classe e personagem.

Faça um select onde traga todos os personagem de uma classe específica (exemplo todos
os personagens que são arqueiros).
salve as querys para cada uma dos requisitos do exercício em um arquivo .SQL ou texto e
coloque no seu GitHuB pessoal e compartilhe esta atividade.*/

-- criação do Banco de Dados
CREATE DATABASE db_generation_game_online;

USE db_generation_game_online;


CREATE TABLE tb_classe(
id_classe BIGINT AUTO_INCREMENT,
categoria VARCHAR (255) NOT NULL,
funcao VARCHAR (255),
poder VARCHAR (255),
PRIMARY KEY (id_classe)
);


CREATE TABLE tb_personagem(
id_personagem BIGINT AUTO_INCREMENT,
nome_do_personagem VARCHAR (255) NOT NULL,
ataque INT,
defesa INT,
cura INT,
estrategia INT,
id_classe BIGINT,

FOREIGN KEY (id_classe) REFERENCES tb_classe (id_classe),
PRIMARY KEY (id_personagem)
);


INSERT INTO tb_classe (categoria,funcao,poder)
VALUES 
("samurai", "Linha de Frente", "Duas Espadas"),
("Arqueiro", "Segunda Linha", "Arco e Flexas"),
("lancador", "Ultima Linha", "cataputa"),
("lenhador", "Linha de Frente", "Machado"),
("Cavaleiro", "Segunda Linha", "Cavalo e espadas");


INSERT INTO tb_personagem (nome_do_personagem, ataque, defesa,cura,estrategia, id_classe)
VALUES
("Sasuke", 2000, 5000, 1000, 5, 1),
("Zeca", 2500, 400, 13, 7, 3),
("Juca", 2300, 700, 80, 15, 8),
("Parrudo", 50, 1300, 40, 20, 6),
("zeki", 6000, 2000, 90, 25, 7),
("Boruto", 1000, 900, 80, 85, 9),
("Yamato", 1200, 1500, 85, 90, 5),
("Sai", 4000, 1500, 15, 20, 2);

SELECT * FROM tb_personagem 
WHERE ataque > 20; 

SELECT * FROM tb_personagem 
WHERE defesa BETWEEN 1000 AND 2000;

SELECT * FROM tb_personagem 
WHERE nome_do_personagem
LIKE "%c%"; -- buscando os personagens com a letra C

SELECT * FROM tb_personagem
INNER JOIN tb_classe on tb_personagem.id_classe = tb_classe.id_classe; 

SELECT * FROM tb_personagem 
INNER JOIN tb_classe
ON tb_personagem.id_classe = tb_classe.id_classe
WHERE tb_classe.categoria = "Arqueiro";