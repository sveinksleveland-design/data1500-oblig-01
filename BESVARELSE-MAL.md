# Besvarelse - Refleksjon og Analyse

**Student:** Svein Kåre Sleveland

**Studentnummer:** svsle1859

**Dato:** [Innleveringsdato]

---

## Del 1: Datamodellering

### Oppgave 1.1: Entiteter og attributter

**Identifiserte entiteter:**

[Skriv ditt svar her - list opp alle entitetene du har identifisert]

sykkelstasjoner
sykler
kunde
lås
utleie

**Attributter for hver entitet:**

[Skriv ditt svar her - list opp attributtene for hver entitet]
sykkelstasjoner: stasjon_id, parkering_plass, lås_id
sykler: sykel_id, stasjon_id
kunde: kunde_id, mobilnummer, epost, fornavn, etternavn
lås: lås_id, stasjon_id
utleie: utleie_id, kunde_id, sykkel_id, TIMESTAMP start_tid, TIMESTAMP slutt_tid

---

### Oppgave 1.2: Datatyper og `CHECK`-constraints

**Valgte datatyper og begrunnelser:**

[Skriv ditt svar her - forklar hvilke datatyper du har valgt for hver attributt og hvorfor]
For id er varchar valgt pga id er ikke matematisk, trenger ikke regne på den. Tekst i varchar er bedre for mobilnummer, epost, fornavn og etternavn for enkelt å kunne redigere dem(legge til/fjerne karakterer osv) For mobil lar dette oss skrive for eksempel +47 og mellomrom. For lås og parkering er INTEGER valgt pga dette er et tall vi vil kunne regne med, for eks kunne lett finne ut av kapasitet, summering av antall ledige/leid, sammenligning mellom stasjoner osv. Utleie/levering er satt som TIMESTAMP for å finne tid sykkelen er brukt.


**`CHECK`-constraints:**

[Skriv ditt svar her - list opp alle CHECK-constraints du har lagt til og forklar hvorfor de er nødvendige]
kunde_id, sykel_id og stasjon_id vil ha constraint primary key, for de kan ikke være NULL og kan ikke ha duplicates.

**ER-diagram:**

[Legg inn mermaid-kode eller eventuelt en bildefil fra `mermaid.live` her]
https://mermaid.live/edit#pako:eNqdU9tO4zAQ_RVrnrZSqeykKa3fEBSEKhDa7ROKVBnitiGOHTk2Ako-Z7-EH8Np0iokQUj4xZdzZub4jL2DRxVxoMD1Rcw2mqWhRG4kVkYc7apNOZ6Zftwy_YdgPKjQVRyhu0WXMR2gVD3EQto05bqLe8F4gHimctODueRrpSV7lj2lAxdnDG_ARVgv8tck4SI3LH9Skut-5QNUE9rSr2-X86v5X5QxnXAdy80qEyzPuwTx8T93wd3ior9meZ9K2ndutVRdLlq5rRE8_tKJg5YK-T5vs0-Xi5-0NRnL65v5v-XZzV2pTJuVOdy4BQprGmBRTaVFfXJr635lQru77-_o5ASp3cF5ilyWH6h7XQ1i9cKPcO0zReWkv_S1y3nQNuHuNqGEIWx0HAE12vIhuAefsnILewdCMFue8hCoW0Z8zawwIYSycGEZk_dKpYdIrexmC3TNRO52NouY4fWPPJ5q7iTrc2WlAUq8Gd5nAbqDF6Cej0djEvjEP_XwKfaJN4RXd4xHwYT4QRDM8NQrj4shvO0L49FsPPGmZDKZYeJPPTIuPgGMDTwQ
---

### Oppgave 1.3: Primærnøkler

**Valgte primærnøkler og begrunnelser:**

[Skriv ditt svar her - forklar hvilke primærnøkler du har valgt for hver entitet og hvorfor]
kunde_id, hver kunde må være unik. mobil og epost kan endres av bruker men id må være konstant. Stasjons_id må være unik for at man skal kunne vite nøyaktig hvor en sykkel er/blir lånt/blir levert.
Sykkel id må være unik for å vite hvilken sykkel leies, hvilken som er ledig og se hver sykkel sin historikk.

**Naturlige vs. surrogatnøkler:**

[Skriv ditt svar her - diskuter om du har brukt naturlige eller surrogatnøkler og hvorfor]
id er surrogatnøkler, er kunstig data laget for å ha unike verdier som vi kan identifisere og som ikke endres. Naturlige nøkler som mobilnr kan endres.

**Oppdatert ER-diagram:**

[Legg inn mermaid-kode eller eventuelt en bildefil fra `mermaid.live` her]
https://mermaid.live/edit#pako:eNqdU9tO4zAQ_RVrnrZSqeykKa3fEBSEKhDa7ROKVBnitiGOHTk2Ako-Z7-EH8Np0iokQUj4xZdzZub4jL2DRxVxoMD1Rcw2mqWhRG4kVkYc7apNOZ6Zftwy_YdgPKjQVRyhu0WXMR2gVD3EQto05bqLe8F4gHimctODueRrpSV7lj2lAxdnDG_ARVgv8tck4SI3LH9Skut-5QNUE9rSr2-X86v5X5QxnXAdy80qEyzPuwTx8T93wd3ior9meZ9K2ndutVRdLlq5rRE8_tKJg5YK-T5vs0-Xi5-0NRnL65v5v-XZzV2pTJuVOdy4BQprGmBRTaVFfXJr635lQru77-_o5ASp3cF5ilyWH6h7XQ1i9cKPcO0zReWkv_S1y3nQNuHuNqGEIWx0HAE12vIhuAefsnILewdCMFue8hCoW0Z8zawwIYSycGEZk_dKpYdIrexmC3TNRO52NouY4fWPPJ5q7iTrc2WlAUq8Gd5nAbqDF6Cej0djEvjEP_XwKfaJN4RXd4xHwYT4QRDM8NQrj4shvO0L49FsPPGmZDKZYeJPPTIuPgGMDTwQ---

### Oppgave 1.4: Forhold og fremmednøkler

**Identifiserte forhold og kardinalitet:**

[Skriv ditt svar her - list opp alle forholdene mellom entitetene og angi kardinalitet]
    sykkelstasjoner || -- o{ sykler : en stasjon har ingen eller mange sykler, en til mange
    kunde || -- o{ utleie : en kunde leier ingen eller flere sykler, en til mange
    sykler || -- o{ utleie : 

**Fremmednøkler:**

[Skriv ditt svar her - list opp alle fremmednøklene og forklar hvordan de implementerer forholdene]
sykler.stasjon_id
Hver sykkel peker på en stasjon, forholdet de implenterer er en til mange, én stasjon -- mange sykler, én sykkel -- kun én stasjon

utleie.kunde_id
Hver utleie må tilhøre én eksisterende kunde.
Forholdet de implementerer er også en til mange, én kunde -- mange utleier, én utleie -- kun én kunde

utleie.sykkel_id                                                                                                                      
Hver utleie må gjelde én bestemt sykkel. Forholdet implemtert er en til mange. én sykkel -- mange utleier (ikke samtidig men historikk). én utleie -- én sykkel.

**Oppdatert ER-diagram:**

[Legg inn mermaid-kode eller eventuelt en bildefil fra `mermaid.live` her]
https://mermaid.live/edit#pako:eNqdU9tO4zAQ_RVrnrZSqeykKa3fEBSEKhDa7ROKVBnitiGOHTk2Ako-Z7-EH8Np0iokQUj4xZdzZub4jL2DRxVxoMD1Rcw2mqWhRG4kVkYc7apNOZ6Zftwy_YdgPKjQVRyhu0WXMR2gVD3EQto05bqLe8F4gHimctODueRrpSV7lj2lAxdnDG_ARVgv8tck4SI3LH9Skut-5QNUE9rSr2-X86v5X5QxnXAdy80qEyzPuwTx8T93wd3ior9meZ9K2ndutVRdLlq5rRE8_tKJg5YK-T5vs0-Xi5-0NRnL65v5v-XZzV2pTJuVOdy4BQprGmBRTaVFfXJr635lQru77-_o5ASp3cF5ilyWH6h7XQ1i9cKPcO0zReWkv_S1y3nQNuHuNqGEIWx0HAE12vIhuAefsnILewdCMFue8hCoW0Z8zawwIYSycGEZk_dKpYdIrexmC3TNRO52NouY4fWPPJ5q7iTrc2WlAUq8Gd5nAbqDF6Cej0djEvjEP_XwKfaJN4RXd4xHwYT4QRDM8NQrj4shvO0L49FsPPGmZDKZYeJPPTIuPgGMDTwQ
---

### Oppgave 1.5: Normalisering

**Vurdering av 1. normalform (1NF):**

[Skriv ditt svar her - forklar om datamodellen din tilfredsstiller 1NF og hvorfor]

**Vurdering av 2. normalform (2NF):**

[Skriv ditt svar her - forklar om datamodellen din tilfredsstiller 2NF og hvorfor]

**Vurdering av 3. normalform (3NF):**

[Skriv ditt svar her - forklar om datamodellen din tilfredsstiller 3NF og hvorfor]

**Eventuelle justeringer:**

[Skriv ditt svar her - hvis modellen ikke var på 3NF, forklar hvilke justeringer du har gjort]

---

## Del 2: Database-implementering

### Oppgave 2.1: SQL-skript for database-initialisering

**Plassering av SQL-skript:**

[Bekreft at du har lagt SQL-skriptet i `init-scripts/01-init-database.sql`]

**Antall testdata:**

- Kunder: [antall]
- Sykler: [antall]
- Sykkelstasjoner: [antall]
- Låser: [antall]
- Utleier: [antall]

---

### Oppgave 2.2: Kjøre initialiseringsskriptet

**Dokumentasjon av vellykket kjøring:**

[Skriv ditt svar her - f.eks. skjermbilder eller output fra terminalen som viser at databasen ble opprettet uten feil]
oblig01=# \dt
              List of relations
  Schema   |      Name       | Type  | Owner
-----------+-----------------+-------+-------
 public    | kunde           | table | admin
 public    | lås             | table | admin
 public    | sykkelstasjoner | table | admin
 public    | sykler          | table | admin
 public    | utleie          | table | admin
(5 rows)

oblig01=# \d kunde;
                         Table "public.kunde"
   Column    |          Type          | Collation | Nullable | Default
-------------+------------------------+-----------+----------+---------
 kunde_id    | character varying(100) |           | not null |
 mobilnummer | character varying(11)  |           |          |
 epost       | character varying(254) |           |          |
 fornavn     | character varying(20)  |           |          |
 etternavn   | character varying(15)  |           |          |
Indexes:
    "kunde_pkey" PRIMARY KEY, btree (kunde_id)
Check constraints:
    "kunde_mobilnummer_check" CHECK (mobilnummer::text ~ '^\+47[0-9]{8}$'::text)
Referenced by:
    TABLE "utleie" CONSTRAINT "utleie_kunde_id_fkey" FOREIGN KEY (kunde_id) REFERENCES kunde(kunde_id)

oblig01=# \d lås;
                         Table "public.lås"
   Column   |         Type          | Collation | Nullable | Default
------------+-----------------------+-----------+----------+---------
 las_id     | integer               |           | not null |
 stasjon_id | character varying(10) |           |          |
Indexes:
    "lås_pkey" PRIMARY KEY, btree (las_id)
Foreign-key constraints:
    "lås_stasjon_id_fkey" FOREIGN KEY (stasjon_id) REFERENCES sykkelstasjoner(stasjon_id)

oblig01=# \d sykkelstasjoner;
                      Table "public.sykkelstasjoner"
     Column      |         Type          | Collation | Nullable | Default
-----------------+-----------------------+-----------+----------+---------
 stasjon_id      | character varying(10) |           | not null |
 parkering_plass | integer               |           |          |
 stasjon_navn    | character varying(50) |           |          |
Indexes:
    "sykkelstasjoner_pkey" PRIMARY KEY, btree (stasjon_id)
Referenced by:
    TABLE ""lås"" CONSTRAINT "lås_stasjon_id_fkey" FOREIGN KEY (stasjon_id) REFERENCES sykkelstasjoner(stasjon_id)
    TABLE "sykler" CONSTRAINT "sykler_stasjon_id_fkey" FOREIGN KEY (stasjon_id) REFERENCES sykkelstasjoner(stasjon_id)
    TABLE "utleie" CONSTRAINT "utleie_slutt_stasjon_id_fkey" FOREIGN KEY (slutt_stasjon_id) REFERENCES sykkelstasjoner(stasjon_id)
    TABLE "utleie" CONSTRAINT "utleie_start_stasjon_id_fkey" FOREIGN KEY (start_stasjon_id) REFERENCES sykkelstasjoner(stasjon_id)

oblig01=# \d sykler;
                        Table "public.sykler"
   Column   |         Type          | Collation | Nullable | Default
------------+-----------------------+-----------+----------+---------
 sykkel_id  | character varying(20) |           | not null |
 stasjon_id | character varying(10) |           |          |
 modell     | character varying(50) |           |          |
Indexes:
    "sykler_pkey" PRIMARY KEY, btree (sykkel_id)
Foreign-key constraints:
    "sykler_stasjon_id_fkey" FOREIGN KEY (stasjon_id) REFERENCES sykkelstasjoner(stasjon_id)
Referenced by:
    TABLE "utleie" CONSTRAINT "utleie_sykkel_id_fkey" FOREIGN KEY (sykkel_id) REFERENCES sykler(sykkel_id)

oblig01=# \d utleie;
                                               Table "public.utleie"
      Column      |            Type             | Collation | Nullable |                  Default
------------------+-----------------------------+-----------+----------+-------------------------------------------
 utleie_id        | integer                     |           | not null | nextval('utleie_utleie_id_seq'::regclass)
 kunde_id         | character varying(100)      |           |          |
 sykkel_id        | character varying(20)       |           |          |
 start_stasjon_id | character varying(10)       |           |          |
 slutt_stasjon_id | character varying(10)       |           |          |
 start_tid        | timestamp without time zone |           | not null |
 slutt_tid        | timestamp without time zone |           | not null |
Indexes:
    "utleie_pkey" PRIMARY KEY, btree (utleie_id)
Foreign-key constraints:
    "utleie_kunde_id_fkey" FOREIGN KEY (kunde_id) REFERENCES kunde(kunde_id)
    "utleie_slutt_stasjon_id_fkey" FOREIGN KEY (slutt_stasjon_id) REFERENCES sykkelstasjoner(stasjon_id)
    "utleie_start_stasjon_id_fkey" FOREIGN KEY (start_stasjon_id) REFERENCES sykkelstasjoner(stasjon_id)
    "utleie_sykkel_id_fkey" FOREIGN KEY (sykkel_id) REFERENCES sykler(sykkel_id)

oblig01=# SELECT schemaname, tablename
oblig01-# FROM pg_catalog.pg_tables
oblig01-# WHERE schemaname = 'public';
 schemaname |    tablename
------------+-----------------
 public     | lås
 public     | sykler
 public     | sykkelstasjoner
 public     | utleie
 public     | kunde
(6 rows)

**Spørring mot systemkatalogen:**

```sql
SELECT table_name 
FROM information_schema.tables 
WHERE table_schema = 'public' 
  AND table_type = 'BASE TABLE'
ORDER BY table_name;
```

**Resultat:**

```
[Skriv resultatet av spørringen her - list opp alle tabellene som ble opprettet]
oblig01=# SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public'
  AND table_type = 'BASE TABLE'
ORDER BY table_name;
   table_name
-----------------
 kunde
 lås
 sykkelstasjoner
 sykler
 utleie
(5 rows)

oblig01=#
```

---

## Del 3: Tilgangskontroll

### Oppgave 3.1: Roller og brukere

**SQL for å opprette rolle:**

```sql
[Skriv din SQL-kode for å opprette rollen 'kunde' her]
```

**SQL for å opprette bruker:**

```sql
[Skriv din SQL-kode for å opprette brukeren 'kunde_1' her]
```

**SQL for å tildele rettigheter:**

```sql
[Skriv din SQL-kode for å tildele rettigheter til rollen her]
```

---

### Oppgave 3.2: Begrenset visning for kunder

**SQL for VIEW:**

```sql
[Skriv din SQL-kode for VIEW her]
```

**Ulempe med VIEW vs. POLICIES:**

[Skriv ditt svar her - diskuter minst én ulempe med å bruke VIEW for autorisasjon sammenlignet med POLICIES]

---

## Del 4: Analyse og Refleksjon

### Oppgave 4.1: Lagringskapasitet

**Gitte tall for utleierate:**

- Høysesong (mai-september): 20000 utleier/måned
- Mellomsesong (mars, april, oktober, november): 5000 utleier/måned
- Lavsesong (desember-februar): 500 utleier/måned

**Totalt antall utleier per år:**

[Skriv din utregning her]

**Estimat for lagringskapasitet:**

[Skriv din utregning her - vis hvordan du har beregnet lagringskapasiteten for hver tabell]

**Totalt for første år:**

[Skriv ditt estimat her]

---

### Oppgave 4.2: Flat fil vs. relasjonsdatabase

**Analyse av CSV-filen (`data/utleier.csv`):**

**Problem 1: Redundans**

[Skriv ditt svar her - gi konkrete eksempler fra CSV-filen som viser redundans]

**Problem 2: Inkonsistens**

[Skriv ditt svar her - forklar hvordan redundans kan føre til inkonsistens med eksempler]

**Problem 3: Oppdateringsanomalier**

[Skriv ditt svar her - diskuter slette-, innsettings- og oppdateringsanomalier]

**Fordeler med en indeks:**

[Skriv ditt svar her - forklar hvorfor en indeks ville gjort spørringen mer effektiv]

**Case 1: Indeks passer i RAM**

[Skriv ditt svar her - forklar hvordan indeksen fungerer når den passer i minnet]

**Case 2: Indeks passer ikke i RAM**

[Skriv ditt svar her - forklar hvordan flettesortering kan brukes]

**Datastrukturer i DBMS:**

[Skriv ditt svar her - diskuter B+-tre og hash-indekser]

---

### Oppgave 4.3: Datastrukturer for logging

**Foreslått datastruktur:**

[Skriv ditt svar her - f.eks. heap-fil, LSM-tree, eller annen egnet datastruktur]

**Begrunnelse:**

**Skrive-operasjoner:**

[Skriv ditt svar her - forklar hvorfor datastrukturen er egnet for mange skrive-operasjoner]

**Lese-operasjoner:**

[Skriv ditt svar her - forklar hvordan datastrukturen håndterer sjeldne lese-operasjoner]

---

### Oppgave 4.4: Validering i flerlags-systemer

**Hvor bør validering gjøres:**

[Skriv ditt svar her - argumenter for validering i ett eller flere lag]

**Validering i nettleseren:**

[Skriv ditt svar her - diskuter fordeler og ulemper]

**Validering i applikasjonslaget:**

[Skriv ditt svar her - diskuter fordeler og ulemper]

**Validering i databasen:**

[Skriv ditt svar her - diskuter fordeler og ulemper]

**Konklusjon:**

[Skriv ditt svar her - oppsummer hvor validering bør gjøres og hvorfor]

---

### Oppgave 4.5: Refleksjon over læringsutbytte

**Hva har du lært så langt i emnet:**

[Skriv din refleksjon her - diskuter sentrale konsepter du har lært]

**Hvordan har denne oppgaven bidratt til å oppnå læringsmålene:**

[Skriv din refleksjon her - koble oppgaven til læringsmålene i emnet]

Se oversikt over læringsmålene i en PDF-fil i Canvas https://oslomet.instructure.com/courses/33293/files/folder/Plan%20v%C3%A5ren%202026?preview=4370886

**Hva var mest utfordrende:**

[Skriv din refleksjon her - diskuter hvilke deler av oppgaven som var mest krevende]

**Hva har du lært om databasedesign:**

[Skriv din refleksjon her - reflekter over prosessen med å designe en database fra bunnen av]

---

## Del 5: SQL-spørringer og Automatisk Testing

**Plassering av SQL-spørringer:**

[Bekreft at du har lagt SQL-spørringene i `test-scripts/queries.sql`]


**Eventuelle feil og rettelser:**

[Skriv ditt svar her - hvis noen tester feilet, forklar hva som var feil og hvordan du rettet det]

---

## Del 6: Bonusoppgaver (Valgfri)

### Oppgave 6.1: Trigger for lagerbeholdning

**SQL for trigger:**

```sql
[Skriv din SQL-kode for trigger her, hvis du har løst denne oppgaven]
```

**Forklaring:**

[Skriv ditt svar her - forklar hvordan triggeren fungerer]

**Testing:**

[Skriv ditt svar her - vis hvordan du har testet at triggeren fungerer som forventet]

---

### Oppgave 6.2: Presentasjon

**Lenke til presentasjon:**

[Legg inn lenke til video eller presentasjonsfiler her, hvis du har løst denne oppgaven]

**Hovedpunkter i presentasjonen:**

[Skriv ditt svar her - oppsummer de viktigste punktene du dekket i presentasjonen]

---

**Slutt på besvarelse**
