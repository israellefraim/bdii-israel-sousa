CREATE DATABASE cinetime;

USE cinetime;

CREATE TABLE users (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    nome_usuario VARCHAR(50) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL
);

INSERT INTO users (nome, data_nascimento, email, nome_usuario, senha)
VALUES
('Luís Dantas', '2009-03-05', 'luis.dantas@email.com', 'luis29', 'senha123'),
('Gustavo Mascio', '2008-05-12', 'gustavo.mascio@email.com', 'gustavo85', 'senha456'),
('Israel Efraim', '1992-11-10', 'israel.efraim@email.com', 'israel90', 'senha789');

CREATE TABLE plataforma (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL UNIQUE,
    tipo_plataforma ENUM('Streaming', 'TV aberta', 'TV a cabo', 'Cinema', 'Locadora Digital'),
    url_plataforma VARCHAR(750) UNIQUE
);

INSERT INTO plataforma (nome, tipo_plataforma, url_plataforma)
VALUES
('Netflix', 'Streaming', 'https://www.netflix.com'),
('GloboPlay', 'Streaming', 'https://www.globoplay.com.br'),
('Cinemark', 'Cinema', 'https://www.cinemark.com.br');

CREATE TABLE obras (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    tipo_obra ENUM('Filme', 'Série', 'TV Show', 'Minissérie') NOT NULL,
    titulo VARCHAR(200) NOT NULL,
    ano_lancamento YEAR NOT NULL,
    genero VARCHAR(50) NOT NULL,
    sinopse TEXT NOT NULL,
    nota_critica DECIMAL(2,1) CHECK (nota_critica IN (1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5)),
    id_plataforma INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_plataforma) REFERENCES plataforma(id)
);

INSERT INTO obras (tipo_obra, titulo, ano_lancamento, genero, sinopse, nota_critica, id_plataforma)
VALUES
('Filme', 'Vingadores: Ultimato', 2019, 'Ação', 'Os heróis mais poderosos da Terra enfrentam Thanos.', 5, 1),
('Série', 'Stranger Things', 2016, 'Ficção Científica', 'Um grupo de crianças enfrenta forças sobrenaturais em sua cidade.', 4.5, 1),
('Minissérie', 'Chernobyl', 2019, 'Drama', 'A história real do desastre nuclear de Chernobyl e suas consequências.', 5, 2);

CREATE TABLE avaliacoes (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nota DECIMAL(2,1) NOT NULL 
      CHECK (nota BETWEEN 1 AND 5 AND nota * 2 = FLOOR(nota * 2)),
    texto TEXT CHECK(CHAR_LENGTH(texto) BETWEEN 1 AND 4000),
    data_avaliacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    curtidas INT UNSIGNED DEFAULT 0,
    id_usuario INT UNSIGNED NOT NULL,
    id_obra INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES users(id),
    FOREIGN KEY (id_obra) REFERENCES obras(id)
);

INSERT INTO avaliacoes (nota, texto, data_avaliacao, curtidas, id_usuario, id_obra)
VALUES
(5, 'Excelente filme! Muito bem produzido e emocionante.', '2025-04-08 14:00:00', 120, 1, 1),
(4.5, 'Ótima série, mas o ritmo poderia ser melhor em alguns episódios.', '2025-04-08 14:30:00', 80, 2, 2),
(5, 'Uma das melhores minisséries que já vi. A atuação é impecável.', '2025-04-08 15:00:00', 150, 3, 3);

CREATE TABLE comentarios (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    texto TEXT NOT NULL,
    data_criacao DATETIME NOT NULL,
    id_usuario INT UNSIGNED NOT NULL,
    id_avaliacao INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES users(id),
    FOREIGN KEY (id_avaliacao) REFERENCES avaliacoes(id)
);

INSERT INTO comentarios (texto, data_criacao, id_usuario, id_avaliacao)
VALUES
('Concordo com a avaliação, o filme é incrível!', '2025-04-08 14:15:00', 2, 1),
('Gostei muito da série, mas realmente o final deixou a desejar um pouco.', '2025-04-08 14:45:00', 1, 2),
('A minissérie é espetacular. A atmosfera criada é única.', '2025-04-08 15:10:00', 1, 3);