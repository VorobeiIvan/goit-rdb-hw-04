CREATE DATABASE IF NOT EXISTS LibraryManagement;
USE LibraryManagement;

CREATE TABLE authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(200)
);

CREATE TABLE genres (
    genre_id INT AUTO_INCREMENT PRIMARY KEY,
    genre_name VARCHAR(200)
);

CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200),
    publication_year INT,
    author_id INT,
    genre_id INT,
    FOREIGN KEY (author_id) REFERENCES authors(author_id),
    FOREIGN KEY (genre_id) REFERENCES genres(genre_id)
);

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(200),
    email VARCHAR(200)
);

CREATE TABLE borrowed_books (
    borrow_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    user_id INT,
    borrow_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

INSERT INTO authors (author_name) VALUES
('Jane Austen'),
('George Orwell');

INSERT INTO genres (genre_name) VALUES
('Novel'),
('Historical Fiction');

INSERT INTO users (username, email) VALUES
('John Smith', 'john@example.com'),
('Emily Johnson', 'emily@example.com');

INSERT INTO books (title, publication_year, author_id, genre_id) VALUES
('Pride and Prejudice', 1813, 1, 1),
('1984', 1949, 2, 2);

INSERT INTO borrowed_books (book_id, user_id, borrow_date, return_date) VALUES
(1, 1, '2024-03-28', '2024-04-10'),
(2, 2, '2024-03-25', '2024-04-05');
