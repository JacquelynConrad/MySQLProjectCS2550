/*Group Members: Jacquelyn Conrad, Sarah Allmendinger, Reagan Asher
Project: Book Database
*/
CREATE DATABASE GroupProject;
USE GroupProject;

CREATE TABLE Authors (
Author_ID INT AUTO_INCREMENT NOT NULL,
Last_name VARCHAR (30) NOT NULL,
First_name VARCHAR (20) DEFAULT NULL,
PRIMARY KEY (Author_ID)
);

CREATE TABLE Titles (
Author_ID INT NOT NULL,
Author_ID_2 INT DEFAULT 1,
Book_ID INT NOT NULL AUTO_INCREMENT,
Title VARCHAR (40) NOT NULL,
Subtitle VARCHAR (40) DEFAULT NULL,
PRIMARY KEY (Book_ID),
FOREIGN KEY (Author_ID) REFERENCES Authors(Author_ID),
FOREIGN KEY (Author_ID_2) REFERENCES Authors (Author_ID)
);

CREATE TABLE Genres (
Genre_ID VARCHAR (2), 
Genre VARCHAR (30) NOT NULL,
Primary Key (Genre_ID)
);

CREATE TABLE BookDetails (
Book_ID INT,
Price  DECIMAL (5, 2),
Genre_ID VarChar(2),
ISBN   BIGINT,
Series VARCHAR (30),
Release_Date	DATE,
FOREIGN KEY (Book_ID) REFERENCES Titles(Book_ID),
CHECK (ISBN > 999999999999),
CHECK (ISBN < 10000000000000)		-- ISBNs are 13 digits, the checks make sure of that
);

/*current library options (Davis, Weber)
  current format options physical book, physical Audiobook, Digital book, Digital Audiobook
  W = weber, D= davis, I = Digital, A = Audiobook, B= Print, E =  every format, M=minus. S = Print book & eAudiobook*/

CREATE TABLE LibrariesFormatsApps(
ID VARCHAR(5),
Library VARCHAR(7) NOT NULL,
Format_App VARCHAR(60) NOT NULL,
PRIMARY KEY (ID) 
);

CREATE TABLE Availability (
Book_ID INT, 
Library_ID VARCHAR(5) DEFAULT (NULL),
PRIMARY KEY (Book_ID),
FOREIGN KEY (Book_ID) REFERENCES Titles(Book_ID),
FOREIGN KEY (Library_ID) REFERENCES LibrariesFormatsApps(ID)
);

INSERT INTO Authors (Author_ID, Last_Name)
VALUES ( 
(1), ("Anonymous") -- so it"s always 2
);

INSERT INTO Authors (Last_name, First_name)
VALUES (
("Montgomery"), ("L.M.")),
(("Yolen"), ("Jane")), 
(("Stroud"), ("Jonathan")),
(("Levine"), ("Gail Carson")),
(("Jones"), ("Diana Wynne")),
(("Sanderson"), ("Brandon")),
(("Wrede"), ("Patricia C.")),
(("Evanovich"), ("Janet")),
(("Raybourn"), ("Deanna")),
(("Flint"), ("Jentry")),
(("Bradbury"), ("Ray")),
(("Goldberg"), ("Lee")),
(("Harris"), ("Robert J.")
);

INSERT INTO Authors (Last_Name, First_Name)
VALUES ( 
("King"), ("Stephen") 
);

INSERT INTO Authors (Last_Name, First_Name)
VALUES ( 
("Stevermer"), ("Caroline") 
);

INSERT INTO Titles (Author_ID, Author_ID_2, Book_ID, Title)
VALUES (
(4), (NULL), (1), ('Dark Lord of Derkholm')), 
((6), (NULL), (2), ('Dealing with Dragons')), 
((5), (NULL), (3), ('Steelheart')), 
((1), (NULL), (4), ('Anne of Green Gables')), 
((1), (NULL), (5), ('Anne of Avonlea')), 
((1), (NULL), (6), ('Anne of The Island')), 
((1), (NULL), (7), ('Anne of Windy Poplars')), 
((2), (12), (8), ('Queens Own Fool')), 
((10), (NULL), (9), ('Fahrenheit 451')), 
((8), (NULL), (10), ('A Curious Beginning')),
((7), (11), (11), ('The Heist')),
((14), (NULL), (12), ('The Screaming Staircase')), 
((14), (NULL), (13), ('The Whispering Skull')), 
((14), (NULL), (14), ('The Hollow Boy')), 
((14), (NULL), (15), ('The Creeping Shadow')), 
((14), (NULL), (16), ('The Empty Grave')), 
((3), (NULL), (17), ('Ella Enchanted')), 
((9), (NULL), (18), ('Games in the Ballroom')), 
((13),( NULL), (19), ('IT'));

UPDATE titles
SET Author_ID = Author_ID + 1
WHERE Author_ID >= 3;

UPDATE titles
SET Author_ID_2 = Author_ID_2 + 1
WHERE Author_ID_2 > 2;

UPDATE Titles
SET Author_ID = Author_ID + 1
WHERE Author_ID > 0 AND Author_ID < 3;


INSERT INTO Genres (Genre_ID, Genre)
VALUES (
	("Ro"), ("Romance")),
	(("F"), ("Fantasy")),
	(("S"), ("Sci-fi")),
	(("H"), ("Historical Fiction")),
	(("R"), ("Realistic Fiction")),
	(("M"), ("Mystery")),
	(("Ho"), ("Horror")),
	(("D"), ("Dystopian")),
	(("Ac"), ("Action")
);

INSERT INTO LibrariesFormatsApps (ID, Library, Format_App)
VALUES (
	("D"), ("Davis"), ("Audiobook & Print Book at Davis County only")),
	(("W"), ("Weber"), ("Audiobook & Print Book at Weber County only")),
	(("A"), ("All"), ("Audiobooks on CD only")),
	(("B"), ("All"), ("Print books only")),
	(("I"), ("Digital"), ("Digital Audiobook & Print versions only")),
	(("E"), ("All"), ("All versions available")),
	(("S"), ("All"), ("Print book version and Digital Audiobook version")),
	(("IDB"), ("All"), ("All Digital versions & Print version at Davis County")),
	(("IWB"), ("All"), ("All Digital versions & Print version at Weber County")),
	(("WB"), ("Weber"), ("Print version at Weber only")),
	(("DB"), ("Davis"), ("Print version at Davis only")),
	(("WA"), ("Weber"), ("Audiobook version at Weber only")),
	(("DA"), ("Davis"), ("Audiobook version at Davis only")),
	(("EMIB"), ("All"), ("Every format except Digital Print versions")),
	(("EMIA"), ("All"), ("Every format except Digital Audiobook versions")), 
	(("DEWS"), ("All"), ("Davis all formats, Weber Print book and Digital Audiobook")),
	(("WEDS"), ("All"), ("Weber all formats, Davis Print book and Digital Audiobook")),
	(("EMWIB"), ("All"), ("Everything, but a Digital Print version at Weber")),
	(("EMDIB"), ("All"), ("Everything, but a Digital Print version at Davis")),
	(("EMA"), ("All"), ("Everything, but Physical Audiobook books")	
    );

INSERT INTO BookDetails (Book_ID, Genre_ID, Price, ISBN, Series, Release_Date)
VALUES (
	(1), ("F"), (8.99), (9780575075368), ("Derkholm"), ("2003-08-01")),
	((2), ("F"), (7.99), (9780152045661), ("Enchanted Forest Chronicles"), ("1990-09-18")),
	((3), ("H"), (7.99), (9781442490000), ("Anne of Green Gables"), ("1908-01-01")),
	((4), ("H"), (7.99), (9780553213140), ("Anne of Green Gables"), ("1909-01-14")),
	((5), ("H"), (7.99), (9780553213171), ("Anne of Green Gables"), ("1915-11-01")),
	((6), ("H"), (7.99), (9780808516965), ("Anne of Green Gables"), ("1936-06-28")),
	((7), ("H"), (12.99), (9780698119185), ("Stuart Quartet"), ("2001-11-12")),
	((8), ("D"), (28.00), (9781451673319), (NULL), ("1953-10-19")),
	((9), ("M"), (19.00), (9780451476029), ("Veronica Speedwell"), ("2015-09-01")),
	((10), ("M"), (9.99), (9780345543066), ("Fox and O-Hare"), ("2013-06-18")),
	((11), ("F"), (9.99), (9780857532015), ("Lockwood & Co."), ("2013-08-29")),
	((12), ("F"), (9.99), (9781423164920), ("Lockwood & Co."), ("2014-09-16")),
	((13), ("F"), (9.99), (9781484709689), ("Lockwood & Co."), ("2015-09-15")),
	((14), ("F"), (9.99), (9781484709672), ("Lockwood & Co."), ("2016-09-13")),
	((15), ("F"), (9.99), (9781484798577), ("Lockwood & Co."), ("2017-09-12")),
	((16), ("Ro"), (9.99), (9780064407052), ("Ella Enchanted"), ("2024-08-01")),
	((17), ("Ro"), (15.99), (9798200928552), (NULL), ("2022-05-03")),
	((18), ("Ho"), (12.99), (9780450411434), (NULL), ("1986-09-15")
);

INSERT 

select *
From authors;

SELECT *
FROM Titles;

SELECT * 
FROM LibrariesFormatsApps;

SELECT * 
FROM Genres;

SELECT * 
FROM bookDetails;
