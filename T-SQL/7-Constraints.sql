-- 1. Primary Key
CREATE TABLE Musteriler
(
	ID int PRIMARY KEY IDENTITY(1,1) not null, 
	Ad varchar(50),
	Soyad Varchar(50),
	Yas int, 
	Cinsiyet varchar(2)
)

--drop table Musteriler

ALTER TABLE Musteriler
Add constraint PK_ID Primary key (ID)

--2. Foreign Key
CREATE TABLE MusteriIletisim
(
	ID int Primary KEy Identity(1,1),
	IletisimTuru varchar(50),
	IletisimBilgisi varchar(250),
	MusteriID int FOREIGN  KEY REFERENCES Musteriler(ID)
)

DROP TABLE MusteriIletisim



CREATE TABLE MusteriIletisim
(
	ID int Primary KEy Identity(1,1),
	IletisimTuru varchar(50),
	IletisimBilgisi varchar(250),
	MusteriID int
)

ALTER TABLE MusteriIletisim
ADD CONSTRAINT FK_MusteriID FOREIGN KEY (MusteriID) REFERENCES Musteriler(ID);
 -- Foreign Key Contraint Drop 
ALTER TABLE MusteriIletisim
DROP CONSTRAINT  FK_MusteriID;

-- 3. Unique Constraint
ALTER TABLE MusteriIletisim
WITH NOCHECK ADD CONSTRAINT CONS_ILETISIM UNIQUE (IletisimTuru,IletisimBilgisi)


-- 4. Check Constraint
ALTER TABLE Musteriler
ADD CONSTRAINT CONS_Yas CHECK (Yas > 12)

The ALTER TABLE statement conflicted with the CHECK constraint "CONS_Yas". The conflict occurred in database "Deneme", table "dbo.Musteriler", column 'Yas'


-- 5. Default Constraint
ALTER TABLE Musteriler
ADD CONSTRAINT CONS_Cinsiyet DEFAULT 'NK' FOR Cinsiyet


-- 6. NOT NULL Constraint
ALTER Table MusteriIletisim 
ALTER COLUMN IletisimBilgisi varchar(250) NOT NULL


