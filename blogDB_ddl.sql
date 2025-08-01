-- Create database
CREATE DATABASE IF NOT EXISTS blogDB;

-- Use database
USE blogDB;

-- View database
SHOW TABLES;
SELECT * FROM Author;
SELECT * FROM BlogPost;

/* 1. Normalize the following blog database and write 
the DDL scripts to create the database tables: */
CREATE TABLE Author (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE BlogPost (
    id INT PRIMARY KEY AUTO_INCREMENT,
    author_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    word_count INT NOT NULL,
    views INT NOT NULL,
    FOREIGN KEY (author_id) REFERENCES Author(id)
);

# INSERT DATA
-- Blog data (for test)
INSERT INTO Author (name) VALUES
('Maria Charlotte'),
('Juan Perez'),
('Gemma Alcocer');

INSERT INTO BlogPost (author_id, title, word_count, views) VALUES
(1, 'Best Paint Colors', 814, 14 (SELECT id FROM Author WHERE name = "María Charlotte")),
(2, 'Small Space Decorating Tips', 1146, 221, (SELECT id FROM Author WHERE name = "Juan Pérez")),
(1, 'Hot Accessories', 986, 105, (SELECT id FROM Author WHERE name = ""María Charlotte")),
(1, 'Mixing Textures', 765, 22, (SELECT id FROM Author WHERE name = "María Charlotte")),
(2, 'Kitchen Refresh', 1242, 307, (SELECT id FROM Author WHERE name = "Juan Pérez")),
(1, 'Homemade Art Hacks', 1002, 193, (SELECT id FROM Author WHERE name = "María Charlotte")),
(3, 'Refinishing Wood Floors', 1571, 7542, (SELECT id FROM Author WHERE name = "Gemma Alcocer"));
