  -- CREATING ADMIN USER
USE youtunes;
DROP USER IF EXISTS 'youtunes_user'@'localhost';
CREATE USER 'youtunes_user'@'localhost' IDENTIFIED WITH mysql_native_password BY 'MySQL8IsGreat!';
GRANT ALL PRIVILEGES ON youtunes.* TO'youtunes_user'@'localhost';

  -- CREATING TABLES
DROP TABLE IF EXISTS album;
DROP TABLE IF EXISTS artist;


CREATE TABLE artist (
    artist_id    INT           NOT NULL    AUTO_INCREMENT,
    first_name	 VARCHAR(500)  NOT NULL,
    last_name	 VARCHAR(500)  NOT NULL,
    PRIMARY KEY(artist_id)
);
CREATE TABLE album (
    album_id    INT            NOT NULL    AUTO_INCREMENT,
    title  		VARCHAR(200)   NOT NULL,
    price    	DOUBLE		   NOT NULL,
    genre     	VARCHAR(200)   NOT NULL,
    img_url 	VARCHAR(200),  
    artist_id   INT            NOT NULL,    
    PRIMARY KEY (album_id),
    FOREIGN KEY(artist_id)
        REFERENCES artist(artist_id)
);

INSERT INTO artist(first_name, last_name)
    VALUES('Cookie', 'Monster');
INSERT INTO artist(first_name, last_name)
    VALUES('Kermet', 'The Frog');
INSERT INTO artist(first_name, last_name)
    VALUES('Big', 'Bird');    
INSERT INTO album(title, price, genre, img_url, artist_id)
    VALUES('Sesame Street', 6.5, 'Classical', 'https://imgix.ranker.com/user_node_img/20/389037/original/abby-cadabby-film-characters-photo-u2?auto=format&q=60&fit=crop&fm=pjpg&dpr=2&crop=faces&h=144&w=144', (SELECT artist_id FROM artist WHERE first_name = 'Cookie'));
INSERT INTO album(title, price, genre, img_url, artist_id)
    VALUES('Counting', 4.5, 'Rock', 'https://imgix.ranker.com/user_node_img/29/572611/original/bert-tv-characters-photo-u1?auto=format&q=60&fit=crop&fm=pjpg&dpr=2&crop=faces&h=144&w=144', (SELECT artist_id FROM artist WHERE first_name = 'Kermet'));
INSERT INTO album(title, price, genre, img_url, artist_id)
    VALUES('Writing', 5.5, 'Jazz', 'https://imgix.ranker.com/node_img/56/1107058/original/grover-tv-characters-photo-1?auto=format&q=60&fit=crop&fm=pjpg&dpr=2&crop=faces&h=144&w=144', (SELECT artist_id FROM artist WHERE first_name = 'Big'));
INSERT INTO album(title, price, genre, img_url, artist_id)
    VALUES('Math', 7.5, 'Blues', 'https://imgix.ranker.com/node_img/23/440039/original/aloysius-snuffleupagus-tv-characters-photo-1?auto=format&q=60&fit=crop&fm=pjpg&dpr=2&crop=faces&h=144&w=144', (SELECT artist_id FROM artist WHERE first_name = 'Cookie'));
INSERT INTO album(title, price, genre, img_url, artist_id)
    VALUES('Reading', 8.5, 'Classical', 'https://imgix.ranker.com/node_img/47/931132/original/elmo-people-in-tv-photo-1?auto=format&q=60&fit=crop&fm=pjpg&dpr=2&crop=faces&h=144&w=144', (SELECT artist_id FROM artist WHERE first_name = 'Kermet'));
INSERT INTO album(title, price, genre, img_url, artist_id)
    VALUES('Computers', 9.5, 'Rock', 'https://imgix.ranker.com/user_node_img/48/952238/original/ernie-tv-characters-photo-u1?auto=format&q=60&fit=crop&fm=pjpg&dpr=2&crop=faces&h=144&w=144', (SELECT artist_id FROM artist WHERE first_name = 'Big'));


    