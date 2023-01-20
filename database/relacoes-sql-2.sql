-- Active: 1674169975633@@127.0.0.1@3306
-- Prática 1
CREATE TABLE users (
    id TEXT PRIMARY KEY NOT NULL,
    name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL,
    created_at TEXT NOT NULL DEFAULT (DATETIME())
);

INSERT INTO users (id, name, email, password)
VALUES
("u001", "Fulana", "fulana@gmail.com", "fulana123"),
("u002", "Beltrana", "beltrana@gmail.com", "beltrana123"),
("u003", "Ciclano", "ciclano@gmail.com", "ciclano123");

SELECT * FROM users;

-------- pratica 2

CREATE TABLE follows (
    follower_id TEXT NOT NULL,
    followed_id TEXT NOT NULL,
    FOREIGN KEY (follower_id) REFERENCES users(id),
    FOREIGN KEY (followed_id) REFERENCES users(id)
);

INSERT INTO follows (follower_id, followed_id)
VALUES
    ("u001", "u002"),
    ("u001", "u003"),
    ("u002", "u001");

SELECT * FROM follows;

SELECT * FROM follows
INNER JOIN users
ON follows.follower_id = users.id;

-------- prática 3
SELECT * FROM follows
RIGHT JOIN users
ON follows.follower_id = users.id
INNER JOIN users AS followedUsers
ON follows.followed_id = followedUsers.id;

---------- fixacao
CREATE TABLE professores (
    id TEXT PRIMARY KEY NOT NULL UNIQUE, 
    name TEXT NOT NULL UNIQUE
);

INSERT INTO professores (id, name)
VALUES 
("p01", "Yuzo"),
("p02", "Gabriel"),
("p03", "Bruno");

CREATE TABLE alunos (
    id TEXT PRIMARY KEY NOT NULL UNIQUE, 
    name TEXT NOT NULL UNIQUE
);

DROP TABLE alunos;

INSERT INTO alunos (id, name)
VALUES
    ("a01", "Carla"),
    ("a02", "Guilherme"),
    ("a03", "Pedro"),
    ("a04", "Barbara");


CREATE TABLE alunos_profs (
    aluno_id TEXT NOT NULL,
    professor_id TEXT NOT NULL,
    FOREIGN KEY (aluno_id) REFERENCES alunos (id),
    FOREIGN KEY (professor_id) REFERENCES professores (id)
);

INSERT INTO alunos_profs (aluno_id, professor_id)
VALUES 
    ("a01", "p02"),
    ("a02", "p01"),
    ("a03", "p02");

SELECT * FROM alunos_profs
INNER JOIN alunos
ON alunos_profs.aluno_id = alunos.id
INNER JOIN professores
ON alunos_profs.professor_id = professores.id;