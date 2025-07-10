-- Prueba SQL - Desafío Latam
-- Nombre: Vicente Soto
-- Generación 106

1.

CREATE TABLE Peliculas(
id INTEGER PRIMARY KEY,
nombre VARCHAR(32),
anno INTEGER
);

CREATE TABLE Tags(
id INTEGER PRIMARY KEY,
tag VARCHAR(32)
);


CREATE TABLE Peliculas_tags (
pelicula_id INTEGER REFERENCES peliculas(id),
tag_id INTEGER REFERENCES Tags(id),
PRIMARY KEY (pelicula_id, tag_id)
);


2.

INSERT INTO Peliculas (id, nombre, anno) VALUES
(1,'matrix',1999)
INSERT INTO Peliculas (id, nombre, anno) VALUES
(2,'naruto',2005);
INSERT INTO Peliculas (id, nombre, anno) VALUES
(3,'dragon ball',2000);
INSERT INTO Peliculas (id, nombre, anno) VALUES
(4,'interestelar',2014);
INSERT INTO Peliculas (id, nombre, anno) VALUES
(5,'titanic',1997);

3.

INSERT INTO  Tags (id, tag) VALUES
(1, 'ciencia ficcion');
INSERT INTO  Tags (id, tag) VALUES
(2, 'anime');
INSERT INTO  Tags (id, tag) VALUES
(3, 'anime');
INSERT INTO  Tags (id, tag) VALUES
(4, 'suspenso');
INSERT INTO  Tags (id, tag) VALUES
(5, 'romance');

INSERT INTO Peliculas_tags VALUES (1,1), (1,3), (1,4);

INSERT INTO Peliculas_tags VALUES (2,2), (2,4);

4.

CREATE TABLE usuarios (
id SERIAL PRIMARY KEY,
nombre VARCHAR(255),
edad INTEGER
);


CREATE TABLE preguntas (
id SERIAL PRIMARY KEY,
texto TEXT
);


CREATE TABLE respuestas (
id SERIAL PRIMARY KEY,
texto TEXT,
usuario_id INTEGER REFERENCES usuarios(id) ON DELETE CASCADE,
pregunta_id INTEGER REFERENCES preguntas(id)
);

5.

INSERT INTO usuarios (nombre, edad) VALUES
('vicente', 22),
('karla', 23),
('cristobal', 26),
('renzo', 30),
('claudio', 33)

INSERT INTO preguntas(texto) VALUES
('¿ cual es la capital de chile?'),
('¿ cuanto es 2 + 2?'),
('¿ cual es la capital de francia?'),
('¿ cual es el color de la sangre?'),
('¿ que planeta esta mas cerca del sol?')


INSERT INTO respuestas (texto, usuario_id, pregunta_id) VALUES
('santiago', 1,1), --correcta
('santiago', 2,1), --correcta
('4', 3,2), --correcta
('azul',4,3), -- incorrecta
('luna', 5,4); --incorrecta

6.

SELECT 
u.nombre AS "NOMBRE",
COUNT(r.id) AS "RESPUESTAS CORRECTAS"
FROM usuarios u JOIN respuestas r ON
u.id = r.usuario_id
JOIN preguntas p ON r.pregunta_id = p.id
WHERE r.texto = p.texto
GROUP BY u.id;


7.

SELECT 
p.id AS "ID DE PREGUNTA",
p.texto AS "TEXTO",
COUNT(r.id) AS "RESPUESTAS CORRECTAS"
FROM preguntas p JOIN respuestas r ON
p.id = r.pregunta_id
WHERE r.texto = p.texto
GROUP BY p.id;

8.

DELETE FROM usuarios WHERE ID = 1;

9.

ALTER TABLE usuarios
ADD CONSTRAINT edad_minima CHECK (edad >= 18);


10.

ALTER TABLE usuarios
ADD COLUMN email VARCHAR(100) UNIQUE;



SELECT *
FROM usuarios;


