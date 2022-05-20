-- --------:::::::::::::::::::::::::::: PARTE 1 ::::::::::::::::::::::::::::--------
-- 1. Se crea la base de datos con el comando CREATE DATABASE
-- nombre_base_de_datos; y luego nos cambiamos a ella.
CREATE DATABASE posts;
-- \c posts :::: es para ingresar a la base de datos 
-- 2. Se crea la tabla post, con los parámetros correspondientes, definiendo el id como
-- clave primaria.
CREATE TABLE post(
id SERIAL,
usuario VARCHAR(20),
fecha_creacion DATE,
contenido VARCHAR,
descripcion VARCHAR(255),
PRIMARY KEY (id)
);

-- 3. Se ingresan los 3 post, dos para Pamela y uno para Carlos con el comando INSERT
-- INTO nombre_tabla () VALUES();
INSERT INTO post (usuario, fecha_creacion, contenido, descripcion)
VALUES ('Pamela','07-13-2022' ,'Revisaremos el contenido que se verá en este curso, comenzando por ..','Introducción a las bases de datos');
INSERT INTO post (usuario, fecha_creacion, contenido, descripcion)
VALUES ('Pamela','07-14-2022' ,'En esta oportunidad, empezaremos con la creación ....','Creando una tabla');
INSERT INTO post (usuario, fecha_creacion, contenido, descripcion)
VALUES ('Carlos','07-15-2022' ,'En latinoamérica hay un déficit de programadores ....','Empezando a programar');

-- 4. Se modifica la tabla agregando la columna título.
ALTER TABLE post ADD titulo VARCHAR(20);
-- 5. Agregar título a las publicaciones ya ingresadas.
UPDATE post SET titulo ='Unidad 1' WHERE id = 1;
UPDATE post SET titulo ='Unidad 2' WHERE id = 2;
UPDATE post SET titulo ='Programación?' WHERE id = 3;
-- 6. Se ingresan 2 post más, ahora se debe incluir el título.
INSERT INTO post (usuario, fecha_creacion, contenido, descripcion,titulo)
VALUES ('Pedro','07-14-2022' ,'Los pasos para armar ...','Tips al momento de armar el curriculum ', 'Armando curriculum');
INSERT INTO post (usuario, fecha_creacion, contenido, descripcion,titulo)
VALUES ('Pedro','07-14-2022' ,'Hoy en día, ...','Problemas al momento de buscar trabajo', 'Mi primer trabajo');

-- 7. Eliminar los post de Carlos.
DELETE FROM post WHERE usuario='Carlos';
-- 8. Ingresar un nuevo post para el usuario "Carlos".
INSERT INTO post (usuario, fecha_creacion, contenido, descripcion, titulo) VALUES ('Carlos','07-14-2022' ,'En esta nueva unidad...','Alterando una tabla', 'ALTER TABLE');

-- :::::::::::::: PARTE 2 :::::::::::::::::::: -------------------

-- 1. Se crea la tabla comentario, haciendo referencia a la tabla post sobre el id del post.
CREATE TABLE comentario(
id_comentario SERIAL,
id_post INT,
fecha_creacion TIMESTAMP,
contenido VARCHAR (255),
FOREIGN KEY (id_post) REFERENCES post (id)
);


-- 2. Crear 2 comentarios para los post de "Pamela" y 4 para "Carlos".
INSERT INTO comentario (id_post, fecha_creacion, contenido) VALUES (6,'07-19-2022 15:16:19', 'Muy buen contenido!');
INSERT INTO comentario (id_post, fecha_creacion, contenido) VALUES (6,'07-19-2022 16:16:19', 'Gracias');
INSERT INTO comentario (id_post, fecha_creacion, contenido) VALUES (3,'07-19-2022 12:19:49', 'exelente');
INSERT INTO comentario (id_post, fecha_creacion, contenido) VALUES (3,'07-20-2022 16:20:15', 'maravilloso');
INSERT INTO comentario (id_post, fecha_creacion, contenido) VALUES (3,'07-21-2022 17:40:12', 'me perdí en el 3er punto');
INSERT INTO comentario (id_post, fecha_creacion, contenido) VALUES (3,'07-21-2022 19:26:56', 'gracias!');

-- 3. Crear nuevo post de Margarita.
INSERT INTO post (usuario, fecha_creacion, contenido, descripcion,
titulo) VALUES ('Margarita','07-23-2022' ,'para comenzar ...','Taller debases de datos', 'SQL');
-- 4. Insertar 5 comentarios para Margarita.
INSERT INTO comentario (id_post, fecha_creacion, contenido) VALUES (7,'07-22-2022 13:26:56', 'gracias!');
INSERT INTO comentario (id_post, fecha_creacion, contenido) VALUES (7,'07-22-2022 14:38:12', 'gracias!');
INSERT INTO comentario (id_post, fecha_creacion, contenido) VALUES (7,'07-22-2022 15:26:56', 'muchas gracias por tu aporte');
INSERT INTO comentario (id_post, fecha_creacion, contenido) VALUES (7,'07-23-2022 13:42:42', 'Entendí todo');
INSERT INTO comentario (id_post, fecha_creacion, contenido) VALUES (7,'07-24-2022 03:15:34', 'gracias!');