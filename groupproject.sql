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
FOREIGN KEY (Genre_ID) REFERENCES Genres(Genre_ID),
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
(6), (NULL), (1), ('Dark Lord of Derkholm')), 
((8), (NULL), (2), ('Dealing with Dragons')), 
((7), (NULL), (3), ('Steelheart')), 
((2), (NULL), (4), ('Anne of Green Gables')), 
((2), (NULL), (5), ('Anne of Avonlea')), 
((2), (NULL), (6), ('Anne of The Island')), 
((2), (NULL), (7), ('Anne of Windy Poplars')), 
((3), (14), (8), ("Queen's Own Fool")), 
((12), (NULL), (9), ('Fahrenheit 451')), 
((10), (NULL), (10), ('A Curious Beginning')),
((7), (13), (11), ('The Heist')),
((4), (NULL), (12), ('The Screaming Staircase')), 
((4), (NULL), (13), ('The Whispering Skull')), 
((4), (NULL), (14), ('The Hollow Boy')), 
((4), (NULL), (15), ('The Creeping Shadow')), 
((4), (NULL), (16), ('The Empty Grave')), 
((5), (NULL), (17), ('Ella Enchanted')), 
((11), (NULL), (18), ('Games in the Ballroom')), 
((14),( NULL), (19), ('IT'));

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
    ((3), ("S"), (16.46), (9780385743563), ("The Reckoners"), ("2013-08-24")),
	((4), ("H"), (7.99), (9781442490000), ("Anne of Green Gables"), ("1908-01-01")),
	((5), ("H"), (7.99), (9780553213140), ("Anne of Green Gables"), ("1909-01-14")),
	((6), ("H"), (7.99), (9780553213171), ("Anne of Green Gables"), ("1915-11-01")),
	((7), ("H"), (7.99), (9780808516965), ("Anne of Green Gables"), ("1936-06-28")),
	((8), ("H"), (12.99), (9780698119185), ("Stuart Quartet"), ("2001-11-12")),
	((9), ("D"), (28.00), (9781451673319), (NULL), ("1953-10-19")),
	((10), ("M"), (19.00), (9780451476029), ("Veronica Speedwell"), ("2015-09-01")),
	((11), ("M"), (9.99), (9780345543066), ("Fox and O-Hare"), ("2013-06-18")),
	((12), ("F"), (9.99), (9780857532015), ("Lockwood & Co."), ("2013-08-29")),
	((13), ("F"), (9.99), (9781423164920), ("Lockwood & Co."), ("2014-09-16")),
	((14), ("F"), (9.99), (9781484709689), ("Lockwood & Co."), ("2015-09-15")),
	((15), ("F"), (9.99), (9781484709672), ("Lockwood & Co."), ("2016-09-13")),
	((16), ("F"), (9.99), (9781484798577), ("Lockwood & Co."), ("2017-09-12")),
	((17), ("Ro"), (9.99), (9780064407052), ("Ella Enchanted"), ("2024-08-01")),
	((18), ("Ro"), (15.99), (9798200928552), (NULL), ("2022-05-03")),
	((19), ("Ho"), (12.99), (9780450411434), (NULL), ("1986-09-15")
);

INSERT INTO Availability (Book_ID, Library_ID)
VALUES (
	(1), ("IDB")),
	((2), ("E")),
	((3), ("EMIA")),
	((4), ("E")),
	((5), ("E")),
	((6), ("E")),
	((7), ("E")),
	((8), ("WB")),
	((9), ("E")),
	((10), ("E")),
	((11), ("E")),
	((12), ("E")),
	((13), ("EMIB")),
	((14), ("EMWIB")),
	((15), ("DEWS")),
	((16), ("EMIB")),
	((17), ("E")),
	((18), ("E")),
	((19), ("EMA")
	);


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

SELECT * 
FROM Availability;

/*Single Table Query- Presents the books with multiple authors*/
SELECT (Book_ID, Title)
FROM Titles
WHERE Author_ID_2 > 1;

/*Group By Query - Finds the number of books that are fantasy*/
SELECT  COUNT(*), Genre_ID
FROM BookDetails
GROUP BY Genre_ID
HAVING Genre_ID = “F”;

/*Self Join Query- shows which authors write together and contribute to the feeling of a book, or can be searched for, for the rest of the series.*/
SELECT A.Author_ID, B.Author_ID_2
FROM Titles A
INNER JOIN Titles B
ON A.Book_ID = B.Book_ID AND B.Author_ID_2 > 1;

SELECT B.Last_Name, B.First_Name, A.Title, C.Genre_ID, C.Series, C.ISBN, D.Library_ID, E.Format_App
FROM Titles A
JOIN Authors B
ON A.Author_ID = B.Author_ID 
JOIN BookDetails C
ON A.Book_ID = C.Book_ID
JOIN Availability D
ON A.Book_ID = D.Book_ID
JOIN LibrariesFormatsApps E
ON D.Library_ID = E.ID
ORDER BY B.Last_Name, A.Title;
