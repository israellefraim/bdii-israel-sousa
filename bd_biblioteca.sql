CREATE DATABASE Biblioteca;
USE Biblioteca;

CREATE TABLE Alunos (
	idAluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    idade INT
);

CREATE TABLE Livros (
	idLivro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(50),
    autor VARCHAR(50)
);

CREATE TABLE Emprestimos (
	idEmprestimo INT AUTO_INCREMENT PRIMARY KEY,
    idLivro INT NOT NULL,
    idAutor INT NOT NULL,
    idAluno INT NOT NULL,
    FOREIGN KEY (idLivro) REFERENCES Livro_Autor (idLivro),
    FOREIGN KEY (idAutor) REFERENCES Livro_Autor (idAutor),
    FOREIGN KEY (idAluno) REFERENCES Alunos (idAluno),
    dataDevolucao DATE,
    dataEmprestimo DATE
);

CREATE TABLE Autores (
	idAutor INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(50)
);

CREATE TABLE Livro_Autor (
	idLivro INT NOT NULL,
    idAutor INT NOT NULL,
    FOREIGN KEY (idLivro) REFERENCES Livros (idLivro),
    FOREIGN KEY (idAutor) REFERENCES Autores (idAutor),
    PRIMARY KEY (idLivro, idAutor)
);

ALTER TABLE Livros ADD statusLivro VARCHAR(20) NOT NULL DEFAULT 'disponível'; 
ALTER TABLE Emprestimos ADD CHECK (dataDevolucao >= dataEmprestimo);