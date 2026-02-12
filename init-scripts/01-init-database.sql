-- ============================================================================
-- DATA1500 - Oblig 1: Arbeidskrav I våren 2026
-- Initialiserings-skript for PostgreSQL
-- ============================================================================

-- Opprett grunnleggende tabeller
CREATE TABLE kunde (
    kunde_id VARCHAR(100) PRIMARY KEY,
    mobilnummer VARCHAR(11)
        CHECK (mobilnummer ~ '^\+47[0-9]{8}$'),
    epost VARCHAR(254),
    fornavn VARCHAR(20),
    etternavn VARCHAR(15)
);

CREATE TABLE sykkelstasjoner (
    stasjon_id VARCHAR(10) PRIMARY KEY,
    parkering_plass INTEGER,
    stasjon_navn VARCHAR(50)
);

CREATE TABLE lås (
    las_id INTEGER PRIMARY KEY,
    stasjon_id VARCHAR(10),
    FOREIGN KEY (stasjon_id)
        REFERENCES sykkelstasjoner(stasjon_id)
);

CREATE TABLE sykler (
    sykkel_id VARCHAR(20) PRIMARY KEY,
    stasjon_id VARCHAR(10),
    modell VARCHAR(50),
    FOREIGN KEY (stasjon_id) REFERENCES sykkelstasjoner(stasjon_id)
);

CREATE TABLE utleie (
    utleie_id SERIAL PRIMARY KEY,
    kunde_id VARCHAR(100),
    sykkel_id VARCHAR(20),
    start_stasjon_id VARCHAR(10),
    slutt_stasjon_id VARCHAR(10),
    start_tid TIMESTAMP NOT NULL,
    slutt_tid TIMESTAMP NOT NULL,
    FOREIGN KEY (kunde_id) REFERENCES kunde(kunde_id),
    FOREIGN KEY (sykkel_id) REFERENCES sykler(sykkel_id),
    FOREIGN KEY (start_stasjon_id) REFERENCES sykkelstasjoner(stasjon_id),
    FOREIGN KEY (slutt_stasjon_id) REFERENCES sykkelstasjoner(stasjon_id)
);



-- Sett inn testdata
-- kunde table:
INSERT INTO kunde VALUES
('k001','12345678','ola@test.no','Ola','Nordmann'),
('k002','87654321','kari@test.no','Kari','Hansen'),
('k003','11223344','Per@test.no','Per','Johansen'),
('k004','99887766','Anne@test.no','Anne','Berg'),
('k005','55667788','Lars@test.no','Lars','Olsen');

-- sykkelstasjoner:
INSERT INTO sykkelstasjoner VALUES
('S01',20),
('S02',20),
('S03',20),
('S04',20),
('S05',20);

-- 100 låser, 20 per stasjon
INSERT INTO lås
SELECT i,
       CONCAT('S0', ((i-1)/20)+1)
FROM generate_series(1,100) AS i;

-- 100 sykler
INSERT INTO sykler
SELECT CONCAT('B', LPAD(i::text,3,'0')),
       CONCAT('S0', ((i-1)/20)+1)
FROM generate_series(1,100) AS i;

-- DBA setninger (rolle: kunde, bruker: kunde_1)
CREATE ROLE kunde;
GRANT SELECT ON sykler TO kunde;
GRANT SELECT ON sykkelstasjoner TO kunde;
GRANT SELECT, INSERT ON utleie TO kunde;

CREATE USER kunde_1 WITH PASSWORD 'passord123';
GRANT kunde TO kunde_1;


-- Eventuelt: Opprett indekser for ytelse



-- Vis at initialisering er fullført (kan se i loggen fra "docker-compose log"
SELECT 'Database initialisert!' as status;

oblig01=# SELECT 'Database initialisert!' as status;
         status
------------------------
 Database initialisert!
(1 row)

oblig01=#
