 DROP DATABASE IF EXISTS trocaonteca;
CREATE DATABASE trocaonteca;
USE trocaonteca;
 
 CREATE TABLE usuario (
 codigo INT NOT NULL,
 nome VARCHAR(30) NOT NULL,
 senha VARCHAR(10)  NOT NULL,
 email VARCHAR(30) NOT NULL,
 cidade VARCHAR(20) NOT NULL,
 estado CHAR(2) NOT NULL,
 
 PRIMARY KEY (codigo)
 );
 
 CREATE TABLE livro(
 codigo INT NOT NULL,
 titulo VARCHAR(50) NOT NULL,
 autor VARCHAR (40) NOT NULL,
 sinopse VARCHAR(500),
 disponivel TINYINT,
 imagem VARCHAR(256) NULL,
 usuario_codigo INT NOT NULL,
 PRIMARY KEY (codigo),
 FOREIGN KEY (usuario_codigo) REFERENCES usuario(codigo)
 );
 
 
 
 CREATE TABLE genero(
 codigo INT NOT NULL,
 descricao VARCHAR(60) NOT NULL,
 PRIMARY KEY(codigo)
 );
 
 CREATE TABLE livro_genero(
  livro_codigo INT NOT NULL,
  genero_codigo INT NOT NULL,
  PRIMARY KEY(livro_codigo, genero_codigo),
FOREIGN KEY (genero_codigo) REFERENCES genero(codigo),
FOREIGN KEY (livro_codigo) REFERENCES livro(codigo)
  );
  
INSERT INTO usuario(codigo, nome , senha , email , cidade , estado)
  VALUES
    (1, 'Joao da Silva', 'joao1234', 'joao@gmail.com', 'Presidente Epitacio', 'SP' ),
    (2, 'Felipe Almeida', 'felipe333', 'falmeida@gmail.com', 'Presidente Venceslau', 'SP'),
    (3, 'Douglas Souza', 'douglas556', 'dsouza@gmail.com', 'Presidente Prudente', 'SP');

INSERT INTO genero(codigo, descricao)
VALUES
(1,'Fantasia'),
(2,'Romance policial'),
(3,'Tratado');

INSERT INTO livro(codigo,titulo, autor, usuario_codigo, imagem)
VALUES
(1,'Alice no País das Maravilhas ','Lewis Carrol', 2, 'alice.jpg'  ),
(2,'O Cão dos Baskervilles ','Arthur Conan Doyle', 1, 'sherlock.jpg' ),
(3,'A Arte da Guerra','Nicolau Maquiavel', 3, 'Arte_guerra.jpg');

INSERT INTO `trocaonteca`.`livro_genero` (`livro_codigo`, `genero_codigo`) VALUES ('1', '1');
INSERT INTO `trocaonteca`.`livro_genero` (`livro_codigo`, `genero_codigo`) VALUES ('2', '2');
INSERT INTO `trocaonteca`.`livro_genero` (`livro_codigo`, `genero_codigo`) VALUES ('3', '3');

select l.titulo, l.autor, l.usuario_codigo, l.imagem, g.descricao as genero from livro_genero lc inner join livro l on(lc.livro_codigo = l.codigo)
inner join genero g on (g.codigo = lc.genero_codigo) WHERE l.autor LIKE "%Lewis%" AND lc.genero_codigo=2;

select l.titulo, l.autor, l.usuario_codigo, l.imagem, g.descricao as genero from livro_genero lc inner join livro l on(lc.livro_codigo = l.codigo) inner join genero g 
on (g.codigo = lc.genero_codigo) WHERE l.autor LIKE "%lew%" AND lc.genero_codigo=2;

select l.titulo, l.autor, l.usuario_codigo, l.imagem, g.descricao as genero from livro_genero lc inner join livro l on(lc.livro_codigo = l.codigo) inner join genero g on (g.codigo = lc.genero_codigo) WHERE
 l.autor LIKE "%Lewis Carroll%" AND lc.genero_codigo=1;
 
select l.titulo, l.autor, l.usuario_codigo, l.imagem, g.descricao as genero from livro_genero lc inner join livro l on(lc.livro_codigo = l.codigo) inner join genero g on (g.codigo = lc.genero_codigo) WHERE
 lc.genero_codigo=1;
 select l.titulo, l.autor, l.usuario_codigo, l.imagem, g.descricao as genero from livro_genero lc inner join livro l on(lc.livro_codigo = l.codigo) inner join genero g on (g.codigo = lc.genero_codigo)
 WHERE l.autor LIKE "%%";
 
  
 


SELECT * FROM livro;