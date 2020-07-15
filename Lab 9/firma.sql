BEGIN;

DROP SCHEMA IF EXISTS firma CASCADE;
CREATE SCHEMA IF NOT EXISTS firma;

CREATE TABLE firma.dzialy(
	iddzialu char(5) PRIMARY KEY,
	nazwa varchar(32) NOT NULL,
	lokalizacja varchar(24) NOT NULL,
	kierownik integer
);

CREATE TABLE firma.pracownicy(
	idpracownika integer PRIMARY KEY,
	nazwisko varchar(32) NOT NULL,
	imie varchar(16) NOT NULL,
	dataUrodzenia date NOT NULL,
	dzial char(5) NOT NULL REFERENCES firma.dzialy(iddzialu),
	stanowisko varchar(24),
	pobory numeric(10,2)
);

ALTER TABLE firma.dzialy ADD CONSTRAINT dzial_fk FOREIGN KEY(kierownik) REFERENCES firma.pracownicy(idpracownika) ON UPDATE CASCADE DEFERRABLE;
COMMIT;