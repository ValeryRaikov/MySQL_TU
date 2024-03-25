/* Consider a database for a library management system. The database should keep track of 
books, authors, and users. Each book can have one or more authors. Users can borrow multiple 
books, and each book can be borrowed by multiple users. */

DROP DATABASE IF EXISTS library;

CREATE DATABASE library;

USE library;

CREATE TABLE authors (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    nationality VARCHAR(50),
    is_active BOOLEAN DEFAULT FALSE,
    debut DATE
);

CREATE TABLE books (
    id INT PRIMARY KEY AUTO_INCREMENT,
    author_id INT NOT NULL,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    serial_number VARCHAR(15) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    publish_date DATE,
    FOREIGN KEY (author_id) 
		REFERENCES authors(id) 
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender ENUM('M', 'F'),
    email VARCHAR(100),
    address VARCHAR(100) NOT NULL
);

CREATE TABLE borrowed_books (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    book_id INT NOT NULL,
    borrow_date DATE,
    return_date DATE,
    FOREIGN KEY (user_id) 
		REFERENCES users(id) 
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (book_id) 
		REFERENCES books(id) 
		ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE book_authors (
    author_id INT NOT NULL,
    book_id INT NOT NULL,
    PRIMARY KEY (author_id, book_id),
    FOREIGN KEY (author_id) 
		REFERENCES authors(id) 
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (book_id) 
		REFERENCES books(id) 
		ON UPDATE CASCADE ON DELETE CASCADE
);

insert into authors (id, first_name, last_name, nationality, is_active, debut) values (1, 'Collette', 'Bauld', 'United States', true, '2023-06-19');
insert into authors (id, first_name, last_name, nationality, is_active, debut) values (2, 'Nikolaus', 'Tolfrey', 'Czech Republic', null, '2023-04-05');
insert into authors (id, first_name, last_name, nationality, is_active, debut) values (3, 'Rollo', 'Passler', 'Portugal', null, '2023-12-15');
insert into authors (id, first_name, last_name, nationality, is_active, debut) values (4, 'Cilka', 'Constantine', null, false, '2023-07-10');
insert into authors (id, first_name, last_name, nationality, is_active, debut) values (5, 'Dedra', 'Spalding', 'Jordan', false, '2024-02-01');
insert into authors (id, first_name, last_name, nationality, is_active, debut) values (6, 'Webster', 'Carnaman', 'China', false, '2023-03-27');
insert into authors (id, first_name, last_name, nationality, is_active, debut) values (7, 'Merlina', 'Penbarthy', null, null, '2023-06-06');
insert into authors (id, first_name, last_name, nationality, is_active, debut) values (8, 'Barrett', 'Broader', null, null, null);
insert into authors (id, first_name, last_name, nationality, is_active, debut) values (9, 'Alphard', 'Ingree', 'Mexico', true, null);
insert into authors (id, first_name, last_name, nationality, is_active, debut) values (10, 'Carmine', 'Hadden', null, true, '2023-06-08');
insert into authors (id, first_name, last_name, nationality, is_active, debut) values (11, 'Giordano', 'Leindecker', 'Thailand', false, '2023-09-11');
insert into authors (id, first_name, last_name, nationality, is_active, debut) values (12, 'Leeland', 'Cleverly', 'Norway', null, null);
insert into authors (id, first_name, last_name, nationality, is_active, debut) values (13, 'Prentiss', 'Yaldren', 'Russia', true, '2023-10-08');
insert into authors (id, first_name, last_name, nationality, is_active, debut) values (14, 'Reggie', 'Van Giffen', null, false, '2023-09-21');
insert into authors (id, first_name, last_name, nationality, is_active, debut) values (15, 'Erhart', 'Haborn', 'Pakistan', false, '2023-06-16');
insert into authors (id, first_name, last_name, nationality, is_active, debut) values (16, 'Annamarie', 'Slinger', null, true, null);
insert into authors (id, first_name, last_name, nationality, is_active, debut) values (17, 'Caz', 'Healey', 'Cambodia', true, '2024-02-02');
insert into authors (id, first_name, last_name, nationality, is_active, debut) values (18, 'Lexis', 'Jacquemard', 'Chile', null, '2023-11-17');
insert into authors (id, first_name, last_name, nationality, is_active, debut) values (19, 'Ashil', 'Austing', null, false, null);
insert into authors (id, first_name, last_name, nationality, is_active, debut) values (20, 'Norine', 'Sysland', 'Colombia', null, '2023-07-23');
insert into authors (id, first_name, last_name, nationality, is_active, debut) values (21, 'Rosana', 'Josefsohn', 'Peru', true, '2023-11-22');
insert into authors (id, first_name, last_name, nationality, is_active, debut) values (22, 'Rolland', 'Rawsthorne', 'China', null, '2023-05-13');
insert into authors (id, first_name, last_name, nationality, is_active, debut) values (23, 'Ruttger', 'MacIllrick', 'Portugal', null, null);
insert into authors (id, first_name, last_name, nationality, is_active, debut) values (24, 'Muffin', 'Raffon', null, false, '2024-03-06');
insert into authors (id, first_name, last_name, nationality, is_active, debut) values (25, 'Ethe', 'McAirt', 'Thailand', null, null);
insert into authors (id, first_name, last_name, nationality, is_active, debut) values (26, 'Gerardo', 'Ohm', 'Philippines', null, null);
insert into authors (id, first_name, last_name, nationality, is_active, debut) values (27, 'Teressa', 'Crosby', 'Syria', null, '2023-04-07');
insert into authors (id, first_name, last_name, nationality, is_active, debut) values (28, 'Raimundo', 'Saundercock', 'Portugal', null, '2023-06-16');
insert into authors (id, first_name, last_name, nationality, is_active, debut) values (29, 'Winny', 'Hubball', 'Indonesia', null, null);
insert into authors (id, first_name, last_name, nationality, is_active, debut) values (30, 'Moira', 'Dubock', 'Dominican Republic', true, '2024-02-18');
insert into authors (id, first_name, last_name, nationality, is_active, debut) values (31, 'Devondra', 'Etheredge', 'Russia', false, null);
insert into authors (id, first_name, last_name, nationality, is_active, debut) values (32, 'Bernadine', 'Simonato', 'Indonesia', null, '2023-05-27');
insert into authors (id, first_name, last_name, nationality, is_active, debut) values (33, 'Genna', 'Cussen', 'Czech Republic', null, '2023-08-15');
insert into authors (id, first_name, last_name, nationality, is_active, debut) values (34, 'Celene', 'Box', 'Indonesia', true, '2023-06-15');
insert into authors (id, first_name, last_name, nationality, is_active, debut) values (35, 'Darcey', 'Dell ''Orto', 'Portugal', null, null);
insert into authors (id, first_name, last_name, nationality, is_active, debut) values (36, 'Briano', 'Twaits', 'France', true, '2024-02-22');
insert into authors (id, first_name, last_name, nationality, is_active, debut) values (37, 'Jacquenette', 'Scholfield', 'Indonesia', true, null);
insert into authors (id, first_name, last_name, nationality, is_active, debut) values (38, 'Averill', 'Grichukhin', 'Argentina', false, '2023-07-03');
insert into authors (id, first_name, last_name, nationality, is_active, debut) values (39, 'Giovanna', 'Buddleigh', null, false, '2023-06-20');
insert into authors (id, first_name, last_name, nationality, is_active, debut) values (40, 'Charyl', 'Muzzullo', 'Indonesia', null, '2023-12-06');
insert into authors (id, first_name, last_name, nationality, is_active, debut) values (41, 'Alejandro', 'Farrington', 'Brazil', null, '2024-01-23');
insert into authors (id, first_name, last_name, nationality, is_active, debut) values (42, 'Whitman', 'Dainton', 'China', true, '2023-10-08');
insert into authors (id, first_name, last_name, nationality, is_active, debut) values (43, 'Bellanca', 'Jesse', 'Poland', null, null);
insert into authors (id, first_name, last_name, nationality, is_active, debut) values (44, 'Zaneta', 'Bleackly', 'Croatia', true, '2023-07-21');
insert into authors (id, first_name, last_name, nationality, is_active, debut) values (45, 'Michell', 'Carnock', 'American Samoa', true, '2023-03-29');
insert into authors (id, first_name, last_name, nationality, is_active, debut) values (46, 'Mariejeanne', 'Searle', 'Morocco', true, '2023-04-16');
insert into authors (id, first_name, last_name, nationality, is_active, debut) values (47, 'Gusella', 'Fidge', null, true, '2023-10-13');
insert into authors (id, first_name, last_name, nationality, is_active, debut) values (48, 'Lyndsie', 'Lemary', 'China', true, '2024-03-01');
insert into authors (id, first_name, last_name, nationality, is_active, debut) values (49, 'Izabel', 'Cominello', null, true, '2023-11-02');
insert into authors (id, first_name, last_name, nationality, is_active, debut) values (50, 'Selle', 'Greetland', 'Tanzania', false, '2023-07-01');

insert into books (id, author_id, title, description, serial_number, price, publish_date) values (1, 67, 'Bunch Of Amateurs, A', 'Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus.', 'aQlTircGJEXTfKu', 12.18, '2024-01-29');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (2, 46, 'Tomorrow, When the War Began', null, 'JFrXSFGSIrtbRyQ', 20.7, '2024-02-07');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (3, 79, 'Black Water', 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit.', 'NlAAGbQfCGxQWRE', 70.76, '2023-06-03');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (4, 22, 'Tie Me Up! Tie Me Down! (¡Átame!)', 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio.', 'CODLXRlFurOOaNw', 63.25, '2023-08-26');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (5, 87, 'Hangin'' with the Homeboys', null, 'TCVPoLXLPAnGPdJ', 89.69, '2023-06-16');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (6, 86, 'Bringing Out the Dead', 'Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero.', 'JjCCaWeuRRroQLO', 35.33, '2023-06-14');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (7, 27, 'AKA', 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus.', 'VrZaiZwExqhGicv', 18.16, '2023-05-01');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (8, 77, 'All the Mornings of the World (Tous les matins du monde)', null, 'EgviYPvTLteCyZE', 87.58, '2023-05-04');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (9, 60, 'Janky Promoters, The', 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum.', 'eUuLpqKZMFWzAVw', 27.59, '2023-06-09');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (10, 93, 'Godzilla vs. Biollante (Gojira vs. Biorante) ', 'Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 'sdlsURPuqGrAneI', 57.4, '2023-04-18');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (11, 48, 'Ice Bound', 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 'SYrunBZrJFTELnz', 15.78, '2023-09-09');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (12, 34, 'Blackballed: The Bobby Dukes Story', 'Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 'OujbkfHGCCywaEg', 27.69, '2023-04-22');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (13, 83, 'Naked Man, The', 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis.', 'HsUTptqTWrWhAjG', 46.72, '2024-01-10');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (14, 82, 'Leif', 'Etiam justo.', 'bJUlKLLLhvQdHKY', 10.71, '2023-04-12');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (15, 74, 'Cold Showers (Douches froides)', 'Duis mattis egestas metus. Aenean fermentum.', 'qdlSHaDUiLfVetn', 40.19, '2023-09-05');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (16, 32, 'Jumpin'' Jack Flash', 'Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 'pIOOjIIyYGGFApc', 98.32, '2023-05-09');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (17, 11, 'Play Time (a.k.a. Playtime)', 'Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla.', 'RWicTeGrCYLcdNB', 23.83, '2023-06-25');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (18, 59, 'Miracles - Mr. Canton and Lady Rose', 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 'NwLdrTMlUXbLmCc', 83.66, '2023-07-21');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (19, 54, 'Moontide', 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet.', 'SNtnlweDhYyKaaC', 59.21, '2023-08-06');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (20, 71, 'Eye of the Needle', 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor.', 'edYQzTkgDFDnVde', 85.31, '2023-06-19');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (21, 47, 'The Legend of Mor''du', 'Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue.', 'SLFefgfmVVNdQSj', 10.2, '2024-02-14');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (22, 8, 'Hard to Be a God', 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis.', 'nraJViRtazRsQhh', 78.74, '2023-04-19');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (23, 49, 'Pulgasari', null, 'ZCLjUuzvKTeWonq', 41.08, '2023-04-12');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (24, 16, 'Kokowääh', 'Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 'aOJVbFCeWjkixRl', 70.64, '2023-09-17');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (25, 5, 'Labor Day', null, 'StySuyaHiwlFXZx', 96.61, '2023-06-27');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (26, 97, 'As You Like It', 'Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 'meJEpvHkqkPyyeF', 34.11, '2023-12-24');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (27, 81, 'Phantom of the Rue Morgue', 'Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio.', 'MzpLtHLshGqmUBt', 34.88, '2023-10-27');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (28, 18, 'Grave Secrets (Silent Screams)', 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat.', 'TyYhAmFKOrFOOjN', 78.25, '2023-11-17');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (29, 29, 'Private Property (Nue propriété)', null, 'rDsWcPiisjXSSGL', 73.22, '2023-12-20');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (30, 25, 'Dark Blue World (Tmavomodrý svet)', 'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros.', 'mHdkifHFyGoNPmm', 93.48, '2024-02-07');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (31, 40, 'The Pirates of Blood River', null, 'SfFxecRKYwfysLA', 78.54, '2023-09-03');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (32, 21, 'Kathleen', null, 'OgdivhSSEmLadPo', 81.8, '2023-12-07');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (33, 68, 'Once Upon a Warrior (Anaganaga O Dheerudu)', null, 'aBeTMazZmlAnvkJ', 47.99, '2024-02-15');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (34, 3, 'Three Kingdoms: Resurrection of the Dragon (Saam gwok dzi gin lung se gap)', 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', 'BYqyGpysoOJuDjK', 60.47, '2023-09-14');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (35, 24, 'Nekromantik 2', 'Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 'rHmJUXjVBqlQuGp', 8.34, '2024-01-25');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (36, 95, 'Mission Congo', 'Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla.', 'DrxKvPSEQlNubLZ', 54.74, '2023-06-02');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (37, 3, 'Hollywoodland', 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est.', 'hYvCgXWvLHbIhUT', 90.42, '2023-05-15');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (38, 99, 'Knuckleball!', 'Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 'EcAMKhqNVbWSEix', 95.82, '2023-12-06');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (39, 61, 'Riot in Cell Block 11', 'Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 'hzIfnnCsiOWCOYW', 40.99, '2023-09-26');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (40, 10, 'Private Fears in Public Places (Coeurs)', 'In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum.', 'ChCzBAqnZXmkZxF', 68.66, '2024-02-09');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (41, 71, 'House on Sorority Row, The', 'Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 'MjaFLojoeinEVmC', 33.53, '2023-09-12');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (42, 74, 'Last Tycoon, The', 'In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula.', 'KIrDOgKGoBZopLk', 49.03, '2023-04-18');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (43, 27, '633 Squadron', 'Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa.', 'wFtpQPaImwkZHia', 24.0, '2023-12-18');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (44, 47, 'My Letter to George (Mesmerized)', null, 'RnmysfzloQaOjge', 44.08, '2023-04-28');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (45, 91, 'Battle in Seattle', 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 'UmPwrYjUiBzqEHb', 24.82, '2023-11-27');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (46, 74, 'The Third Reich: The Rise & Fall', null, 'lAwBxCXThwvCVOT', 84.59, '2023-07-03');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (47, 2, 'Mixed Nuts', 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', 'szqmDzwqneGNpMC', 54.16, '2023-05-20');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (48, 55, 'Pandorum', null, 'iQMOCVfxGHPwfEw', 70.86, '2023-09-21');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (49, 86, 'Liquidator, The', 'Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 'xcJucNZljbpeqjn', 17.06, '2023-08-24');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (50, 88, 'Raiders of Atlantis, The', 'Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque.', 'kiVeNjwLQotRCvs', 98.36, '2023-09-02');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (51, 75, 'Ring Two, The', 'Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 'SthFZlADZgFlWhZ', 40.15, '2023-08-30');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (52, 89, 'Playing from the Plate (Grajacy z talerza)', null, 'btsQvtCOIyQflWE', 86.54, '2024-03-05');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (53, 24, 'Red and the White, The (Csillagosok, katonák)', 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet.', 'zspPmFgycBUKqhn', 64.73, '2023-09-20');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (54, 63, 'New Year''s Eve', null, 'TpwjJjMKWoJtiEv', 49.06, '2023-08-03');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (55, 97, 'Rack, The', null, 'YdAmSxrNWcepJem', 5.7, '2023-05-11');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (56, 77, 'Tea and Sympathy', 'Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit.', 'luBSWMroURAFJYw', 61.26, '2023-03-30');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (57, 33, 'Dilettante, La', 'Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus.', 'pPVwlGIagZQRsMy', 91.09, '2023-04-11');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (58, 66, 'On the Run', 'Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci.', 'MtoTBDHliiGkIYU', 35.6, '2023-09-18');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (59, 54, 'Phantom Carriage, The (Körkarlen)', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 'IMdVDmPwmCNYlSd', 95.73, '2023-11-08');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (60, 51, 'Airplane!', 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet.', 'WApCGOmACMocLEc', 63.08, '2023-09-17');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (61, 22, 'Commitments, The', 'Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 'bDgWKqrwYkTxiPl', 102.57, '2023-10-06');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (62, 95, 'Oh, God! Book II', 'Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus.', 'IzxZZeqDchLjapB', 11.69, '2024-01-26');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (63, 66, 'Wind with the Gone (El viento se llevó lo qué)', 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla.', 'UQSXJvwWJcTZBrB', 86.06, '2023-08-17');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (64, 58, 'Sincerely Yours', 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum.', 'JLOfuiIfpWGsvdp', 94.52, '2023-11-04');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (65, 36, 'Loco Love (Mi Casa, Su Casa)', 'Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', 'UWTyFxECpwHyfJO', 84.0, '2023-10-13');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (66, 73, 'Narco Cultura', 'Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue.', 'JIciwSYeYzKPgYh', 66.74, '2023-04-09');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (67, 87, 'Chinese Puzzle (Casse-tête chinois)', null, 'EoGKzPolQusibEl', 56.11, '2024-01-02');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (68, 88, '27 Dresses', 'Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus.', 'vEEsUkBvVdyGNCY', 28.23, '2023-07-28');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (69, 48, 'Life and Death of Peter Sellers, The', 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 'zAEAgdUErjriZsf', 92.47, '2024-01-05');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (70, 68, 'Alligator', 'Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst.', 'PCmgPJgjrsxKOOd', 66.59, '2023-10-01');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (71, 27, 'Spawn', 'Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo.', 'ZYzDdLxypWlvzEK', 63.12, '2024-01-19');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (72, 54, 'A Pistol For Ringo', null, 'BMVKOawkdFsWhBi', 95.08, '2023-08-29');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (73, 27, 'Indian in the Cupboard, The', 'Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla.', 'DxmKrBkopAmefUM', 46.62, '2023-11-09');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (74, 96, 'Misfits, The', 'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla.', 'TQfqZIayxHthjxe', 82.29, '2023-12-09');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (75, 66, 'Misérables, Les', null, 'oyNwDvdvoPtgzKA', 32.25, '2024-02-07');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (76, 63, 'Cold Moon (Lune froide)', null, 'wzfnFoOZRSqPVyf', 8.81, '2023-11-09');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (77, 39, 'Getting to Know You', 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 'zfFGnjTCBurUHJF', 94.93, '2023-04-06');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (78, 41, 'Jingle All the Way', 'Donec ut dolor.', 'IbeyJRzUplWnHpn', 69.61, '2023-08-23');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (79, 74, 'Life of Another, The (La vie d''une autre)', null, 'RLYmXfMLcLYIAJr', 58.31, '2023-05-12');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (80, 98, 'Four-Faced Liar, The', 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum.', 'hyUreYeKWkcCAsF', 70.1, '2023-11-04');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (81, 44, 'Berlin Alexanderplatz', 'Nam nulla.', 'VOkETcdlNyYqRta', 73.03, '2024-01-29');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (82, 70, 'Graceland', 'Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam.', 'qrGpKJISWKKsrsc', 33.77, '2024-03-08');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (83, 77, 'Private Lives of Elizabeth and Essex, The', null, 'DAyONzRlifgDtdB', 73.51, '2024-03-22');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (84, 33, 'Mulholland Drive', 'Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis.', 'KcewBdhBzSCWRQh', 21.97, '2024-03-03');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (85, 71, 'Mondo Hollywood', 'Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum.', 'ZKxfricIawiBVJr', 59.91, '2023-10-24');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (86, 48, 'You Killed Me First', 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue.', 'IMRMAAyfQBtBKaq', 68.44, '2023-08-06');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (87, 33, 'Magnificent Yankee, The', 'Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam. Nam tristique tortor eu pede.', 'aaPhvGcNzsKsXrM', 81.02, '2023-10-10');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (88, 55, 'Innocent, The', 'Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis.', 'DQsuQlklKqmJDSU', 19.85, '2024-01-31');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (89, 57, 'Queen: Days of Our Lives', 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum.', 'yJhykdEPFVFDZHo', 20.13, '2023-04-27');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (90, 13, 'Goalie''s Anxiety at the Penalty Kick, The (Die Angst des Tormanns beim Elfmeter)', 'Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem.', 'UUTOxKQBnrZlZpP', 82.3, '2023-11-10');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (91, 33, 'Killer, The (Die xue shuang xiong)', null, 'COQkvoIlHFzruwb', 80.51, '2023-12-26');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (92, 30, 'Letter, The', null, 'LTqSqIobkhWyxgy', 44.32, '2023-06-04');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (93, 53, 'Chosen, The', null, 'knKgdlMdMqDgOUC', 22.14, '2023-06-22');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (94, 8, 'Michael Clayton', 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum.', 'vdiAnAFaqxZhvuG', 8.57, '2023-06-25');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (95, 59, 'Devil''s Doorway', 'Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 'RMJFfbYcieVwoTx', 86.81, '2023-08-20');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (96, 67, 'You, the Living (Du levande)', 'Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero.', 'XPPVvuMUTizskNz', 79.65, '2024-02-04');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (97, 58, 'Confidentially Connie', null, 'UXUeqLJQYPKhybx', 61.3, '2023-07-10');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (98, 62, 'Tarzan Finds a Son!', 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 'yuVxvRtJfTYuiEy', 31.09, '2023-07-20');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (99, 15, 'Perils of Pauline, The', 'Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat.', 'fxsBnFkbsmgJqgf', 65.99, '2024-02-27');
insert into books (id, author_id, title, description, serial_number, price, publish_date) values (100, 83, 'Comrades', null, 'dDRgZiaojgIwloW', 103.7, '2023-09-12');

insert into users (id, first_name, last_name, gender, email, address) values (1, 'Caitrin', 'Blick', null, 'cblick0@amazon.com', 'Apt 1314');
insert into users (id, first_name, last_name, gender, email, address) values (2, 'Charlotte', 'Filyashin', null, 'cfilyashin1@acquirethisname.com', '19th Floor');
insert into users (id, first_name, last_name, gender, email, address) values (3, 'Moyra', 'Ewer', null, null, '1st Floor');
insert into users (id, first_name, last_name, gender, email, address) values (4, 'Karlotte', 'Benadette', 'F', 'kbenadette3@google.es', 'PO Box 28918');
insert into users (id, first_name, last_name, gender, email, address) values (5, 'Morgen', 'Stonman', 'M', null, 'Suite 4');
insert into users (id, first_name, last_name, gender, email, address) values (6, 'Tallulah', 'Churchward', null, 'tchurchward5@phpbb.com', '19th Floor');
insert into users (id, first_name, last_name, gender, email, address) values (7, 'Liva', 'Magson', 'F', 'lmagson6@multiply.com', 'Room 1364');
insert into users (id, first_name, last_name, gender, email, address) values (8, 'Kary', 'Necolds', 'F', 'knecolds7@storify.com', 'Room 691');
insert into users (id, first_name, last_name, gender, email, address) values (9, 'Chalmers', 'Hagstone', 'M', 'chagstone8@admin.ch', 'PO Box 2598');
insert into users (id, first_name, last_name, gender, email, address) values (10, 'Renie', 'Kayley', 'F', null, '12th Floor');
insert into users (id, first_name, last_name, gender, email, address) values (11, 'Haley', 'Paulusch', 'M', 'hpauluscha@wikimedia.org', '8th Floor');
insert into users (id, first_name, last_name, gender, email, address) values (12, 'Paige', 'O''Crigan', 'M', 'pocriganb@domainmarket.com', 'PO Box 80410');
insert into users (id, first_name, last_name, gender, email, address) values (13, 'Tremayne', 'Mulqueeny', 'M', 'tmulqueenyc@chron.com', 'Room 848');
insert into users (id, first_name, last_name, gender, email, address) values (14, 'Jude', 'Portinari', null, 'jportinarid@state.tx.us', 'PO Box 32735');
insert into users (id, first_name, last_name, gender, email, address) values (15, 'Drusie', 'Llewelly', null, 'dllewellye@berkeley.edu', 'Apt 498');
insert into users (id, first_name, last_name, gender, email, address) values (16, 'Jason', 'Pogg', 'M', 'jpoggf@abc.net.au', 'Room 181');
insert into users (id, first_name, last_name, gender, email, address) values (17, 'Emmy', 'Esbrook', 'M', 'eesbrookg@godaddy.com', 'Room 597');
insert into users (id, first_name, last_name, gender, email, address) values (18, 'Shane', 'Duchateau', 'F', null, 'Apt 1725');
insert into users (id, first_name, last_name, gender, email, address) values (19, 'Salmon', 'Lund', null, 'slundi@timesonline.co.uk', 'Room 266');
insert into users (id, first_name, last_name, gender, email, address) values (20, 'Mano', 'Ruane', null, null, 'Apt 417');
insert into users (id, first_name, last_name, gender, email, address) values (21, 'Prescott', 'Lawling', 'M', null, 'PO Box 23082');
insert into users (id, first_name, last_name, gender, email, address) values (22, 'Garreth', 'Kaveney', null, 'gkaveneyl@microsoft.com', 'PO Box 20175');
insert into users (id, first_name, last_name, gender, email, address) values (23, 'Rory', 'Debell', null, 'rdebellm@shutterfly.com', 'Apt 567');
insert into users (id, first_name, last_name, gender, email, address) values (24, 'Carlota', 'Gullick', 'F', null, '10th Floor');
insert into users (id, first_name, last_name, gender, email, address) values (25, 'Carney', 'Godleman', null, 'cgodlemano@bbb.org', 'Room 387');
insert into users (id, first_name, last_name, gender, email, address) values (26, 'Sherline', 'Roseman', null, 'srosemanp@taobao.com', '19th Floor');
insert into users (id, first_name, last_name, gender, email, address) values (27, 'Merill', 'Lowry', 'M', 'mlowryq@tiny.cc', 'Apt 746');
insert into users (id, first_name, last_name, gender, email, address) values (28, 'Marrissa', 'Denman', null, null, 'Suite 8');
insert into users (id, first_name, last_name, gender, email, address) values (29, 'Correy', 'Heims', 'F', 'cheimss@tinypic.com', 'Room 748');
insert into users (id, first_name, last_name, gender, email, address) values (30, 'Kristos', 'Londsdale', 'M', null, 'Room 1664');
insert into users (id, first_name, last_name, gender, email, address) values (31, 'Aubrey', 'Burkert', null, 'aburkertu@purevolume.com', 'Suite 59');
insert into users (id, first_name, last_name, gender, email, address) values (32, 'Daniele', 'Western', null, 'dwesternv@about.com', 'PO Box 11456');
insert into users (id, first_name, last_name, gender, email, address) values (33, 'Karissa', 'Crowd', null, 'kcrowdw@miitbeian.gov.cn', '1st Floor');
insert into users (id, first_name, last_name, gender, email, address) values (34, 'Regine', 'Sandells', null, 'rsandellsx@twitpic.com', 'Suite 32');
insert into users (id, first_name, last_name, gender, email, address) values (35, 'Geoffry', 'Wolland', 'M', 'gwollandy@go.com', 'PO Box 32497');
insert into users (id, first_name, last_name, gender, email, address) values (36, 'Cindee', 'O''Crevy', null, 'cocrevyz@si.edu', '10th Floor');
insert into users (id, first_name, last_name, gender, email, address) values (37, 'Brewer', 'Rowson', null, 'browson10@wix.com', 'PO Box 11514');
insert into users (id, first_name, last_name, gender, email, address) values (38, 'Ashly', 'Beaten', null, null, '17th Floor');
insert into users (id, first_name, last_name, gender, email, address) values (39, 'Jeanne', 'Lemerle', 'F', 'jlemerle12@un.org', 'Room 992');
insert into users (id, first_name, last_name, gender, email, address) values (40, 'Millicent', 'Bartosik', null, null, 'Apt 1838');
insert into users (id, first_name, last_name, gender, email, address) values (41, 'Thorvald', 'Siuda', 'M', 'tsiuda14@1und1.de', 'PO Box 78272');
insert into users (id, first_name, last_name, gender, email, address) values (42, 'Karry', 'Romke', 'F', 'kromke15@ted.com', 'Suite 58');
insert into users (id, first_name, last_name, gender, email, address) values (43, 'Fanechka', 'Lutty', null, 'flutty16@last.fm', 'Apt 307');
insert into users (id, first_name, last_name, gender, email, address) values (44, 'Letty', 'Woffinden', null, 'lwoffinden17@meetup.com', 'Apt 1981');
insert into users (id, first_name, last_name, gender, email, address) values (45, 'Gavin', 'Danell', null, 'gdanell18@google.pl', '11th Floor');
insert into users (id, first_name, last_name, gender, email, address) values (46, 'Daron', 'Cannop', 'M', 'dcannop19@vkontakte.ru', '12th Floor');
insert into users (id, first_name, last_name, gender, email, address) values (47, 'Kile', 'Carmody', 'M', 'kcarmody1a@phoca.cz', '1st Floor');
insert into users (id, first_name, last_name, gender, email, address) values (48, 'Ethelbert', 'Crippell', 'M', 'ecrippell1b@intel.com', 'PO Box 60032');
insert into users (id, first_name, last_name, gender, email, address) values (49, 'Iver', 'Mainston', null, 'imainston1c@telegraph.co.uk', 'Suite 44');
insert into users (id, first_name, last_name, gender, email, address) values (50, 'Laurice', 'Dicker', null, 'ldicker1d@ft.com', 'Apt 81');
insert into users (id, first_name, last_name, gender, email, address) values (51, 'Udell', 'Punch', null, null, 'PO Box 43915');
insert into users (id, first_name, last_name, gender, email, address) values (52, 'Haley', 'Gravet', null, 'hgravet1f@aol.com', '19th Floor');
insert into users (id, first_name, last_name, gender, email, address) values (53, 'Kathryne', 'Lacy', null, 'klacy1g@webmd.com', 'Apt 1472');
insert into users (id, first_name, last_name, gender, email, address) values (54, 'Trueman', 'Huzzey', 'M', 'thuzzey1h@clickbank.net', 'Apt 663');
insert into users (id, first_name, last_name, gender, email, address) values (55, 'Judith', 'Guilloneau', 'F', 'jguilloneau1i@drupal.org', 'Suite 29');
insert into users (id, first_name, last_name, gender, email, address) values (56, 'Amalia', 'Spawell', 'F', 'aspawell1j@pen.io', '7th Floor');
insert into users (id, first_name, last_name, gender, email, address) values (57, 'Revkah', 'Moralee', 'F', 'rmoralee1k@goo.ne.jp', 'Apt 1574');
insert into users (id, first_name, last_name, gender, email, address) values (58, 'Madlin', 'Langhorne', 'F', 'mlanghorne1l@omniture.com', '13th Floor');
insert into users (id, first_name, last_name, gender, email, address) values (59, 'Early', 'Martello', null, 'emartello1m@w3.org', '4th Floor');
insert into users (id, first_name, last_name, gender, email, address) values (60, 'Scarlett', 'Dupoy', null, 'sdupoy1n@stanford.edu', 'Suite 95');
insert into users (id, first_name, last_name, gender, email, address) values (61, 'Ronna', 'Sebright', 'F', 'rsebright1o@php.net', 'Suite 73');
insert into users (id, first_name, last_name, gender, email, address) values (62, 'Augustin', 'Greated', null, 'agreated1p@woothemes.com', 'Suite 69');
insert into users (id, first_name, last_name, gender, email, address) values (63, 'Kalle', 'Bache', 'M', null, '10th Floor');
insert into users (id, first_name, last_name, gender, email, address) values (64, 'Rickard', 'Patillo', null, 'rpatillo1r@chronoengine.com', 'Room 517');
insert into users (id, first_name, last_name, gender, email, address) values (65, 'Hale', 'Guiett', null, 'hguiett1s@lycos.com', '13th Floor');
insert into users (id, first_name, last_name, gender, email, address) values (66, 'Sue', 'Nardi', null, null, 'Room 528');
insert into users (id, first_name, last_name, gender, email, address) values (67, 'Tersina', 'Corner', null, 'tcorner1u@amazon.co.jp', 'Room 1116');
insert into users (id, first_name, last_name, gender, email, address) values (68, 'Eugene', 'Hubbard', null, null, '12th Floor');
insert into users (id, first_name, last_name, gender, email, address) values (69, 'Andre', 'Adao', 'M', 'aadao1w@washington.edu', 'Apt 965');
insert into users (id, first_name, last_name, gender, email, address) values (70, 'Vanny', 'Ruselin', 'F', 'vruselin1x@etsy.com', 'PO Box 95174');
insert into users (id, first_name, last_name, gender, email, address) values (71, 'Ringo', 'Gallop', 'M', null, 'Apt 581');
insert into users (id, first_name, last_name, gender, email, address) values (72, 'Augustina', 'Maren', null, 'amaren1z@toplist.cz', 'Apt 351');
insert into users (id, first_name, last_name, gender, email, address) values (73, 'Wyatt', 'Lackey', null, 'wlackey20@pbs.org', 'Suite 67');
insert into users (id, first_name, last_name, gender, email, address) values (74, 'Gisele', 'Abbes', null, 'gabbes21@symantec.com', 'PO Box 20002');
insert into users (id, first_name, last_name, gender, email, address) values (75, 'Jethro', 'Wandrich', 'M', 'jwandrich22@kickstarter.com', 'PO Box 17828');
insert into users (id, first_name, last_name, gender, email, address) values (76, 'Grace', 'Bagwell', null, 'gbagwell23@mac.com', 'Apt 73');
insert into users (id, first_name, last_name, gender, email, address) values (77, 'Ravi', 'Antyukhin', null, 'rantyukhin24@soundcloud.com', '7th Floor');
insert into users (id, first_name, last_name, gender, email, address) values (78, 'Allie', 'Shrimpton', null, 'ashrimpton25@vimeo.com', '13th Floor');
insert into users (id, first_name, last_name, gender, email, address) values (79, 'Ebenezer', 'Aslam', 'M', 'easlam26@mashable.com', 'Apt 1811');
insert into users (id, first_name, last_name, gender, email, address) values (80, 'Whitaker', 'Harriot', 'M', 'wharriot27@reddit.com', 'Room 817');
insert into users (id, first_name, last_name, gender, email, address) values (81, 'Nathalia', 'Saveall', null, 'nsaveall28@ifeng.com', 'Suite 58');
insert into users (id, first_name, last_name, gender, email, address) values (82, 'Kurt', 'Vivian', null, 'kvivian29@ask.com', 'Room 956');
insert into users (id, first_name, last_name, gender, email, address) values (83, 'Kendra', 'Rushbrooke', 'F', 'krushbrooke2a@imdb.com', 'Apt 823');
insert into users (id, first_name, last_name, gender, email, address) values (84, 'Darlene', 'Ranfield', null, 'dranfield2b@arstechnica.com', 'PO Box 96477');
insert into users (id, first_name, last_name, gender, email, address) values (85, 'Eula', 'Meace', null, 'emeace2c@eepurl.com', 'Apt 1693');
insert into users (id, first_name, last_name, gender, email, address) values (86, 'Aubrette', 'Houndsom', 'F', 'ahoundsom2d@discovery.com', 'PO Box 47232');
insert into users (id, first_name, last_name, gender, email, address) values (87, 'Wade', 'Cromleholme', 'M', 'wcromleholme2e@wisc.edu', '6th Floor');
insert into users (id, first_name, last_name, gender, email, address) values (88, 'Davide', 'Weir', null, 'dweir2f@tripadvisor.com', 'Room 114');
insert into users (id, first_name, last_name, gender, email, address) values (89, 'Cayla', 'Wehner', null, 'cwehner2g@addthis.com', '8th Floor');
insert into users (id, first_name, last_name, gender, email, address) values (90, 'Heriberto', 'Haughey', 'M', 'hhaughey2h@geocities.jp', 'Suite 50');
insert into users (id, first_name, last_name, gender, email, address) values (91, 'El', 'Hawkslee', 'M', 'ehawkslee2i@drupal.org', 'PO Box 53810');
insert into users (id, first_name, last_name, gender, email, address) values (92, 'Elvis', 'Skacel', 'M', 'eskacel2j@indiegogo.com', 'Apt 1206');
insert into users (id, first_name, last_name, gender, email, address) values (93, 'Idelle', 'Vlach', null, 'ivlach2k@fastcompany.com', 'Room 176');
insert into users (id, first_name, last_name, gender, email, address) values (94, 'Simone', 'Willoughley', 'M', null, 'Apt 630');
insert into users (id, first_name, last_name, gender, email, address) values (95, 'Cecilla', 'Rumbold', null, 'crumbold2m@mashable.com', 'Suite 4');
insert into users (id, first_name, last_name, gender, email, address) values (96, 'Solomon', 'Instrell', 'M', null, 'Suite 51');
insert into users (id, first_name, last_name, gender, email, address) values (97, 'Trista', 'Kolakovic', null, 'tkolakovic2o@squarespace.com', 'Apt 57');
insert into users (id, first_name, last_name, gender, email, address) values (98, 'Olva', 'Tichner', 'F', 'otichner2p@nymag.com', 'Room 781');
insert into users (id, first_name, last_name, gender, email, address) values (99, 'Nevins', 'Barles', 'M', 'nbarles2q@e-recht24.de', '12th Floor');
insert into users (id, first_name, last_name, gender, email, address) values (100, 'Benedikta', 'Cowoppe', null, null, 'PO Box 63214');

insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (1, 19, 97, '2023-08-11', '2023-11-27');
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (2, 82, 20, '2023-08-20', '2024-01-19');
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (3, 33, 89, '2023-09-21', '2023-11-22');
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (4, 9, 98, '2023-10-03', '2023-03-31');
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (5, 78, 100, null, '2023-05-30');
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (6, 60, 49, '2023-09-11', '2023-07-05');
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (7, 12, 74, '2023-05-28', '2023-06-26');
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (8, 20, 20, '2023-10-17', '2023-06-06');
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (9, 98, 69, '2023-11-08', null);
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (10, 68, 2, '2023-11-07', '2023-07-21');
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (11, 36, 77, '2023-09-11', '2024-01-05');
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (12, 2, 98, '2024-03-03', '2024-01-01');
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (13, 48, 6, '2024-01-05', '2023-05-28');
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (14, 81, 76, '2024-01-13', null);
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (15, 27, 39, '2023-11-23', '2024-02-10');
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (16, 80, 17, '2023-11-06', null);
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (17, 92, 70, '2023-05-03', '2023-04-23');
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (18, 32, 63, '2023-08-15', '2023-08-05');
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (19, 61, 39, '2023-12-04', null);
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (20, 53, 91, '2023-07-16', '2023-08-27');
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (21, 56, 27, '2023-09-17', '2023-06-23');
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (22, 97, 27, '2023-07-30', '2023-10-15');
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (23, 80, 97, '2023-04-30', '2023-04-28');
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (24, 24, 12, '2024-03-06', '2023-07-04');
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (25, 13, 41, null, '2023-08-04');
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (26, 60, 23, '2024-03-24', null);
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (27, 38, 73, null, '2023-04-23');
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (28, 56, 10, '2024-01-26', '2023-08-30');
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (29, 95, 50, '2023-07-30', '2023-05-17');
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (30, 5, 6, '2023-10-04', '2024-03-05');
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (31, 42, 36, '2023-05-09', null);
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (32, 68, 98, null, null);
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (33, 77, 84, '2023-11-16', '2023-09-20');
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (34, 43, 81, '2023-08-07', '2024-01-23');
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (35, 36, 78, '2023-06-29', '2023-11-01');
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (36, 64, 11, null, '2024-02-21');
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (37, 62, 35, null, '2024-03-18');
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (38, 53, 46, '2023-11-23', '2023-12-27');
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (39, 93, 73, '2023-06-19', '2024-03-23');
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (40, 10, 44, null, '2023-05-11');
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (41, 85, 51, '2023-10-09', '2024-03-05');
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (42, 48, 52, '2023-12-02', '2024-01-18');
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (43, 66, 24, '2023-08-14', '2023-08-24');
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (44, 44, 28, null, '2024-03-24');
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (45, 58, 21, '2024-01-02', '2024-03-03');
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (46, 75, 17, '2023-09-21', null);
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (47, 6, 25, '2023-12-02', '2023-10-06');
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (48, 15, 94, '2023-09-12', '2023-08-31');
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (49, 20, 3, '2023-07-09', '2023-12-18');
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (50, 10, 53, '2023-10-22', '2024-01-30');
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (51, 15, 76, '2023-10-26', '2023-07-05');
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (52, 80, 85, null, '2023-11-11');
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (53, 66, 5, '2023-05-04', '2023-09-14');
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (54, 71, 2, null, '2023-07-08');
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (55, 39, 41, '2023-05-03', '2023-08-14');
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (56, 79, 77, '2023-07-03', '2023-05-18');
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (57, 94, 57, null, '2024-01-03');
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (58, 12, 87, '2024-02-08', '2024-01-30');
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (59, 2, 4, '2023-10-15', '2023-08-27');
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (60, 48, 82, null, '2023-06-07');
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (61, 96, 44, '2023-06-30', '2023-10-28');
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (62, 29, 98, '2023-08-16', '2024-02-16');
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (63, 21, 15, '2023-05-18', '2023-10-03');
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (64, 68, 88, '2024-03-01', '2023-07-19');
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (65, 49, 50, null, '2024-03-06');
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (66, 4, 39, null, null);
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (67, 36, 31, null, null);
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (68, 60, 11, '2023-12-24', '2023-07-26');
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (69, 100, 30, '2024-02-25', null);
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (70, 85, 29, '2023-09-11', null);
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (71, 72, 35, '2023-09-28', '2023-05-09');
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (72, 76, 25, '2023-06-05', '2023-09-05');
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (73, 35, 70, '2023-11-01', '2023-06-05');
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (74, 11, 84, null, '2023-12-14');
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (75, 53, 1, '2023-06-17', '2024-01-22');
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (76, 53, 46, null, '2024-01-22');
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (77, 11, 11, '2023-04-20', '2024-01-21');
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (78, 30, 82, '2023-10-16', '2023-11-29');
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (79, 89, 25, '2023-07-19', '2023-04-12');
insert into borrowed_books (id, user_id, book_id, borrow_date, return_date) values (80, 6, 87, '2023-11-22', '2023-10-25');

insert into book_authors (author_id, book_id) values (43, 14);
insert into book_authors (author_id, book_id) values (8, 6);
insert into book_authors (author_id, book_id) values (7, 17);
insert into book_authors (author_id, book_id) values (10, 4);
insert into book_authors (author_id, book_id) values (27, 13);
insert into book_authors (author_id, book_id) values (16, 19);
insert into book_authors (author_id, book_id) values (36, 20);
insert into book_authors (author_id, book_id) values (7, 45);
insert into book_authors (author_id, book_id) values (16, 3);
insert into book_authors (author_id, book_id) values (31, 32);
insert into book_authors (author_id, book_id) values (46, 28);
insert into book_authors (author_id, book_id) values (44, 14);
insert into book_authors (author_id, book_id) values (14, 7);
insert into book_authors (author_id, book_id) values (50, 27);
insert into book_authors (author_id, book_id) values (39, 16);
insert into book_authors (author_id, book_id) values (41, 46);
insert into book_authors (author_id, book_id) values (7, 1);
insert into book_authors (author_id, book_id) values (45, 24);
insert into book_authors (author_id, book_id) values (13, 49);
insert into book_authors (author_id, book_id) values (20, 27);
insert into book_authors (author_id, book_id) values (3, 33);
insert into book_authors (author_id, book_id) values (8, 13);
insert into book_authors (author_id, book_id) values (41, 1);
insert into book_authors (author_id, book_id) values (29, 7);
insert into book_authors (author_id, book_id) values (27, 18);
insert into book_authors (author_id, book_id) values (23, 39);
insert into book_authors (author_id, book_id) values (49, 11);
insert into book_authors (author_id, book_id) values (25, 14);
insert into book_authors (author_id, book_id) values (5, 24);
insert into book_authors (author_id, book_id) values (39, 4);
insert into book_authors (author_id, book_id) values (23, 14);
insert into book_authors (author_id, book_id) values (21, 34);
insert into book_authors (author_id, book_id) values (10, 39);
insert into book_authors (author_id, book_id) values (32, 37);
insert into book_authors (author_id, book_id) values (37, 13);
insert into book_authors (author_id, book_id) values (18, 40);
insert into book_authors (author_id, book_id) values (49, 16);
insert into book_authors (author_id, book_id) values (13, 23);
insert into book_authors (author_id, book_id) values (35, 47);
insert into book_authors (author_id, book_id) values (2, 1);
insert into book_authors (author_id, book_id) values (16, 19);
insert into book_authors (author_id, book_id) values (34, 33);
insert into book_authors (author_id, book_id) values (27, 11);
insert into book_authors (author_id, book_id) values (32, 17);
insert into book_authors (author_id, book_id) values (4, 41);
insert into book_authors (author_id, book_id) values (30, 48);
insert into book_authors (author_id, book_id) values (47, 39);
insert into book_authors (author_id, book_id) values (37, 1);
insert into book_authors (author_id, book_id) values (8, 38);
insert into book_authors (author_id, book_id) values (39, 14);
insert into book_authors (author_id, book_id) values (44, 31);
insert into book_authors (author_id, book_id) values (22, 38);
insert into book_authors (author_id, book_id) values (29, 8);
insert into book_authors (author_id, book_id) values (36, 34);
insert into book_authors (author_id, book_id) values (30, 38);
insert into book_authors (author_id, book_id) values (4, 48);
insert into book_authors (author_id, book_id) values (44, 46);
insert into book_authors (author_id, book_id) values (30, 46);
insert into book_authors (author_id, book_id) values (32, 42);
insert into book_authors (author_id, book_id) values (19, 34);
insert into book_authors (author_id, book_id) values (12, 35);
insert into book_authors (author_id, book_id) values (10, 28);
insert into book_authors (author_id, book_id) values (25, 44);
insert into book_authors (author_id, book_id) values (12, 26);
insert into book_authors (author_id, book_id) values (9, 28);
insert into book_authors (author_id, book_id) values (15, 22);
insert into book_authors (author_id, book_id) values (3, 46);
insert into book_authors (author_id, book_id) values (47, 8);
insert into book_authors (author_id, book_id) values (8, 47);
insert into book_authors (author_id, book_id) values (18, 7);
insert into book_authors (author_id, book_id) values (14, 18);
insert into book_authors (author_id, book_id) values (31, 27);
insert into book_authors (author_id, book_id) values (35, 44);
insert into book_authors (author_id, book_id) values (17, 48);
insert into book_authors (author_id, book_id) values (43, 14);
insert into book_authors (author_id, book_id) values (10, 42);
insert into book_authors (author_id, book_id) values (26, 31);
insert into book_authors (author_id, book_id) values (22, 45);
insert into book_authors (author_id, book_id) values (39, 22);
insert into book_authors (author_id, book_id) values (29, 7);

-- authors
SELECT 
	CONCAT_WS(' ', first_name, last_name) AS full_name
FROM 
	authors
WHERE 
	nationality = 'China'
ORDER BY 
	full_name;

SELECT 
	nationality,
	COUNT(is_active)
FROM 
	authors
WHERE 
	is_active = true
GROUP BY 
	nationality;

SELECT 
	nationality,
	COUNT(*) AS total
FROM 
	authors
GROUP BY 
	nationality
HAVING 
	total > 2
ORDER BY
	total DESC;

-- books
SELECT 
	title,
    price,
    publish_date
FROM 
	books
WHERE 
	publish_date > '2024-01-01'
ORDER BY 
	price,
    title;

SELECT 
	AVG(price) AS avg_price
FROM
	books;
    
SELECT 
	MAX(price) AS max_price
FROM
	books;
    
SELECT
	SUM(price) AS total_price
FROM 
	books;

-- users
SELECT 
	CONCAT_WS(' ', first_name, last_name) AS full_name,
    address 
FROM
	users 
WHERE 
	gender <> 'M'
ORDER BY
	full_name;
    
SELECT 
	gender,
    COUNT(*) AS total_count
FROM
	users
GROUP BY 
	gender;
    
-- borrowed_books
SELECT 
	user_id,
	book_id
FROM
	borrowed_books
WHERE
	borrow_date BETWEEN '2023-10-01' AND '2023-12-31';
    
SELECT 
	user_id,
	book_id
FROM
	borrowed_books
WHERE
	borrow_date > '2023-10-01' AND 
	return_date < '2023-12-31';

-- joins
SELECT 
	CONCAT_WS(' ', a.first_name, a.last_name) AS full_name,
    a.nationality,
    b.title,
    b.description,
    b.publish_date
FROM
	authors a 
INNER JOIN books b ON
	a.id = b.author_id
WHERE
	a.nationality IS NOT NULL AND b.publish_date IS NOT NULL
ORDER BY 
	b.publish_date DESC,
    full_name;

SELECT 	
	a.nationality,
    SUM(b.price) AS total_price
FROM
	authors a
INNER JOIN books b ON
	a.id = b.author_id
WHERE
	a.is_active = true AND
    a.nationality IS NOT NULL
GROUP BY 
	a.nationality
ORDER BY 
	total_price DESC;
	
SELECT 
	CONCAT_WS(' ', u.first_name, u.last_name) AS user_full_name,
    u.address,
    b.title,
    ROUND(b.price) AS book_price,
    bb.borrow_date,
    bb.return_date,
    CONCAT_WS(' ', a.first_name, a.last_name) AS author_full_name
FROM 	
	users u
LEFT JOIN borrowed_books bb ON
	u.id = bb.user_id
LEFT JOIN books b ON
	bb.book_id = b.id
LEFT JOIN authors a ON
	b.author_id = a.id
WHERE
	b.price > 12.50 AND
    bb.borrow_date BETWEEN '2024-01-01' AND '2024-03-15'
ORDER BY 
	b.price DESC,
    user_full_name,
    b.title;

SELECT 
	u.gender,
    ROUND(AVG(b.price), 2) AS avg_price
FROM
	users u
INNER JOIN borrowed_books bb ON
	u.id = bb.user_id
INNER JOIN  books b ON
	bb.book_id = b.id
GROUP BY 
	u.gender
HAVING 
	gender = 'M';

SELECT 
	CONCAT_WS(' ', a.first_name, a.last_name) AS full_name,
    COUNT(b.author_id) AS total_books
FROM
	authors a 
INNER JOIN books b ON
	a.id = b.author_id
GROUP BY
	full_name
HAVING
	total_books > 1
ORDER BY 
	total_books DESC;

-- views
CREATE VIEW view_books_info AS 
SELECT 
	id,
    title,
    serial_number,
    price
FROM
	books
WHERE 
	title LIKE 'M%'
ORDER BY
	price DESC;
    
SELECT * FROM view_books_info;

CREATE VIEW view_general_library_info AS
SELECT 
	CONCAT_WS(' ', a.first_name, a.last_name) AS author_full_name,
    b.title,
    b.serial_number,
    CONCAT_WS(' ', u.first_name, u.last_name) AS user_full_name,
    u.address,
    bb.borrow_date
FROM 
	authors a
INNER JOIN books b ON
	a.id = b.author_id
INNER JOIN borrowed_books bb ON
	b.id = bb.book_id
INNER JOIN users u ON
	bb.user_id = u.id
ORDER BY 
	author_full_name,
    user_full_name
LIMIT 30;

SELECT * FROM view_general_library_info;