  -- CREATING ADMIN USER
DROP USER IF EXISTS 'youtunes_user'@'localhost';
CREATE USER 'youtunes_user'@'localhost' IDENTIFIED WITH mysql_native_password BY 'MySQL8IsGreat!';
GRANT ALL PRIVILEGES ON youtunes.* TO'youtunes_user'@'localhost';

  -- CREATING TABLES
DROP TABLE IF EXISTS artist;
DROP TABLE IF EXISTS album;

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
INSERT INTO album(title, price, genre, artist_id)
    VALUES('Sesame Street', 4.5, 'Fun', (SELECT artist_id FROM artist WHERE first_name = 'Cookie'));
INSERT INTO album(title, price, genre, artist_id)
    VALUES('Sesame Street', 4.5, 'Educational', (SELECT artist_id FROM artist WHERE first_name = 'Kermet'));
INSERT INTO album(title, price, genre, artist_id)
    VALUES('Sesame Street', 4.5, 'Family', (SELECT artist_id FROM artist WHERE first_name = 'Big'));


    