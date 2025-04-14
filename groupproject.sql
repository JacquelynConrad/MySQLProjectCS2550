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
(1),("-")), -- so it"s always 1
((2), ("Anonymous") -- so it"s always 2
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
