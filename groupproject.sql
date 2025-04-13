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
ISBN   INT,
Series VARCHAR (20),
Release_Date	DATE,
FOREIGN KEY (Book_ID) REFERENCES Titles(Book_ID),
CHECK (ISBN > 999999999999),
CHECK (ISBN < 10000000000000)		-- ISBNs are 13 digits, the checks make sure of that
);




/*current ID OPTIONS(ID = WPB OR ID = WPA OR ID = DPB OR ID = DPA OR ID = WHB OR ID = WHA OR ID = DHB OR ID = DHA OR ID = BLB OR ID = BLA)*/
/*current library options (Davis, Weber, Beehive Consortium)
  current format options physical book, physical audiobook, hoopla book, hoopla audiobook, libby book, libby audiobook)*/

CREATE TABLE LibrariesFormatsApps(
Library VARCHAR(12) NOT NULL,
Format_App VARCHAR(20) NOT NULL,
ID VARCHAR(3),
PRIMARY KEY (ID) 
);

CREATE TABLE Availability (
Book_ID INT, 
Library_ID VARCHAR(3) DEFAULT (NULL),
PRIMARY KEY (Book_ID),
FOREIGN KEY (Book_ID) REFERENCES Titles(Book_ID),
FOREIGN KEY (Library_ID) REFERENCES LibrariesFormatsApps(ID)
);

INSERT INTO Authors (Author_ID, Last_Name)
VALUES ( 
(1),("-")), -- so it's always 1
((2), ("Anonymous") -- so it's always 2
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

select *
From authors;

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
