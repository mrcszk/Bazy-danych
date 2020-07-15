-- zadanie 9.6

-- 1. Wyświetla nazwisko, wiek oraz roczne pobory pracownika posortowane 
-- wg poborów oraz nazwiska (pole pobory w tabeli pracownicy określa pobory miesięczne).

SELECT 
	nazwisko,
	(DATE_PART('year',NOW())-DATE_PART('year', dataurodzenia)) AS Wiek, 
	12*pobory AS Pobory  
		FROM firma.pracownicy 
			ORDER BY 3,1;
			
-- 2. Wyświetla nazwisko, imię, datę urodzenia, stanowisko, dział i pobory pracownika, 
-- który pracuje na stanowisku robotnik lub analityk i zarabia więcej niż 2000 miesięcznie.

SELECT 
	nazwisko,
	imie,
	dataurodzenia,
	stanowisko,
	pobory  
		FROM firma.pracownicy 
			WHERE stanowisko IN ('robotnik','analityk') 
				AND pobory > 2000;
				
-- 3. Wyświetla nazwiska i imiona pracowników, którzy zarabiają więcej niż zarabia Adam Kowalik.			
SELECT 
	nazwisko,
	imie 
		FROM firma.pracownicy 
			WHERE pobory > (SELECT pobory 
						FROM firma.pracownicy 
							WHERE nazwisko = 'Kowalik' 
								AND imie = 'Adam');
							
-- 4. Podnosi zarobki o 10% na stanowisku robotnik.
UPDATE firma.pracownicy 
	SET pobory = 1.1 * pobory 
		WHERE stanowisko = 'robotnik';
		
-- 5. Oblicza średnie zarobki oraz ilość pracowników na poszczególnych stanowiskach 
--	z wyłączeniem stanowisk kierownik.

SELECT
	stanowisko, 
	round(AVG(pobory), 2) AS "Srednie zarobki", 
	COUNT(*) AS ilosc 
		FROM firma.pracownicy 
			WHERE stanowisko != 'kierownik' 
				GROUP BY stanowisko;