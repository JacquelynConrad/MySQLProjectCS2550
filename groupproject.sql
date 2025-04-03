CREATE DATABASE GroupProject;
USE GroupProject;

CREATE TABLE Authors (
Author_ID INT AUTO_INCREMENT NOT NULL,
Last_name VARCHAR (30) NOT NULL,
First_name VARCHAR (20) DEFAULT NULL,
PRIMARY KEY (Author_ID)
);

CREATE TABLE LibrariesFormatsApps(
Library VARCHAR(12) NOT NULL,
Format_App VARCHAR(20) NOT NULL,
ID VARCHAR(3),
PRIMARY KEY (ID),
CHECK (ID = WPB OR ID = WPA OR ID = DPB OR ID = DPA OR ID = WHB OR ID = WHA OR ID = DHB OR ID = DHA OR ID = BLB OR ID = BLA)
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

CREATE TABLE Reviews (
Book_ID INT,
Rating	INT,
Written_Review VARCHAR (50),
FOREIGN KEY (Book_ID) REFERENCES Titles(Book_ID)
);

CREATE TABLE BookDetails (
Book_ID INT,
Price  DECIMAL (5, 2),
ISBN   INT,
Series VARCHAR (20),
Release_Date	DATE,
FOREIGN KEY (Book_ID) REFERENCES Titles(Book_ID),
CHECK (ISBN > 999999999999),
CHECK (ISBN < 10000000000000)		-- ISBNs are 13 digits, the checks make sure of that
);

CREATE TABLE Genres (
Book_ID INT, 
Genre VARCHAR (30) NOT NULL,
FOREIGN KEY (Book_ID) REFERENCES Titles(Book_ID)
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

INSERT INTO Authors (Last_Name)
VALUES ( 
("Avi") -- so it starts where the other authors are, but doesn't need a first name
);

INSERT INTO Authors (Last_name, First_name)
VALUES (
("Wilson"), ("ND")),
(("Montgomery"), ("L.M.")),
(("Colfer"), ("Eoin")),
(("Shannon"), ("David")),
(("Yolen"), ("Jane")), 
(("Cooper"), ("Susan")),
(("Springer"), ("Nancy")),
(("Vernon"), ("Ursula")),
(("Lewis"), ("C.S.")),
(("Stroud"), ("Jonathan")),
(("Justus"), ("Rob")),
(("Funke"), ("Cornelia")),
(("Sutherland"), ("Tui T")),
(("Levine"), ("Gail Carson")),
(("Twain"), ("Mark")),
(("Meyers"), ("Stephanie")),
(("Han"), ("Jenny")),
(("Armstrong"), ("Kelley")),
(("Schow"), ("Betsy")),
(("Carriger"), ("Gail")),
(("Garcia"), ("Kami")),
(("Stohl"), ("Margaret")),
(("Harper"), ("Molly")),
(("Hawkins"), ("Rachel")),
(("Howard"), ("A.G.")),
(("Jones"), ("Diana Wynne")),
(("Levenseller"), ("Tricia")),
(("Livingston"), ("Lesley")),
(("Paolini"), ("Christopher")),
(("Pierce"), ("Tamora")),
(("Rhodes"), ("Morgan")),
(("Sanderson"), ("Brandon")),
(("Scott"), ("Michael")),
(("Stiefvater"), ("Maggie")),
(("Taylor"), ("Laini")),
(("Ritter"), ("William")),
(("Wrede"), ("Patricia C.")),
(("Cremer"), ("Andrea")),
(("Nix"), ("Garth")),
(("Walden"), ("Mark")),
(("Meyer"), ("L.A.")),
(("Burns"), ("Olive Ann")),
(("Cameron"), ("Sharon")),
(("Lee"), ("Stacey")),
(("Carter"), ("Ally")),
(("Watase"), ("Yuu")),
(("Watterson"), ("Bill")),
(("Yang"), ("Gene Luen")),
(("Hicks"), ("Faith")),
(("Marie"), ("Annette")),
(("Briggs"), ("Patricia")),
(("Resnick"), ("Laura")),
(("Kenyon"), ("Sherrilyn")),
(("Love"), ("Dianna")),
(("Allen"), ("Nancy Campbell")),
(("Shalvis"), ("Jill")),
(("James"), ("Julie")),
(("Metzger"), ("Barbara")),
(("Heath"), ("Lorraine")),
(("Galen"), ("Shana")),
(("Turano"), ("Jen")),
(("Feehan"), ("Christine")),
(("Laurens"), ("Stephanie")),
(("Dare"), ("Tessa")),
(("Beverley"), ("Jo")),
(("Frost"), ("Jeaniene")),
(("Gracie"), ("Anne")),
(("Jeffries"), ("Sabrina")),
(("Evanovich"), ("Janet")),
(("Quinn"), ("Julia")),
(("Jones"), ("Darynda")),
(("Thomas"), ("Sherry")),
(("Forsyth"), ("Kate")),
(("Aiken"), ("G.A.")),
(("MacLean"), ("Sarah")),
(("Maxwell"), ("Cathy")),
(("Dunmore"), ("Evie")),
(("Adams"), ("Lyssa Kay")),
(("Anstey"), ("Cindy")),
(("Kleypas"), ("Lisa")),
(("Raybourn"), ("Deanna")),
(("McMaster"), ("Bec")),
(("Kilpack"), ("Josi S.")),
(("Hunter"), ("Madeline")),
(("McQuiston"), ("Jennifer")),
(("Sparks"), ("Kerrelyn")),
(("Berne"), ("Lisa")),
(("Sands"), ("Lynsay")),
(("Nix"), ("Susannah")),
(("Freeman"), ("Dianne")),
(("Davidson"), ("MaryJanice")),
(("Langlais"), ("Eve")),
(("Flint"), ("Jentry")),
(("Brown"), ("Eli")),
(("Peters"), ("Elizabeth")),
(("Ashley"), ("Jennifer")),
(("Galchen"), ("Rivka")),
(("Butcher"), ("Jim")),
(("Moore"), ("Scotto")),
(("Harris"), ("Charlaine")),
(("Bradbury"), ("Ray")),
(("Long"), ("Meg")),
(("Organ"), ("Emily")),
(("Perry"), ("Anne")),
(("Lee"), ("Y.S.")),
(("Bailey"), ("Elizabeth")),
(("Simpson"), ("Lea Donna")),
(("Hamilton"), ("Victoria")),
(("Schellman"), ("Katharine")),
(("Cliff"), ("Tony")),
(("Goldberg"), ("Lee")),
(("Evanovich"), ("Peter")),
(("Hamilton"), ("Steve")),
(("Jacobsen"), ("Rob")),
(("Harris"), ("Robert J.")
);



