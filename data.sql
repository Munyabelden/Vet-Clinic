
INSERT INTO animals (name, date_of_birth, escape_attemps, neutered, weight_kg ) 
VALUES ('Agumon', '3 Feb 2020', 0, TRUE, 10.23);

INSERT INTO animals (name, date_of_birth, escape_attemps, neutered, weight_kg ) 
VALUES ('Gabumon', '15 Nov 2018', 2, TRUE, 8);

INSERT INTO animals (name, date_of_birth, escape_attemps, neutered, weight_kg ) 
VALUES ('Pikachu', '7 Jan 2021', 1, FALSE, 8);

INSERT INTO animals (name, date_of_birth, escape_attemps, neutered, weight_kg ) 
VALUES ('Devimon', '12 May 2017', 2, TRUE, 8);

INSERT INTO animals (name, date_of_birth, escape_attemps, neutered, weight_kg )
VALUES ('Charmander', '8 Feb 2020', 0, FALSE, 11);

INSERT INTO animals (name, date_of_birth, escape_attemps, neutered, weight_kg )
VALUES ('Plantmon', '15 Nov 2021', 2, TRUE, 5.7);

INSERT INTO animals (name, date_of_birth, escape_attemps, neutered, weight_kg )
VALUES ('Squirtile', '2 April 1993', 3, FALSE, 12.3);

INSERT INTO animals (name, date_of_birth, escape_attemps, neutered, weight_kg )
VALUES ('Angemon', '12 Jun 2005', 1, TRUE, 45);

INSERT INTO animals (name, date_of_birth, escape_attemps, neutered, weight_kg )
VALUES ('Boarmon', '7 Jun 2005', 7, TRUE, 20.4);

INSERT INTO animals (name, date_of_birth, escape_attemps, neutered, weight_kg ) 
VALUES ('Blossom', '13 Oct 1998', 3, TRUE, 17);

INSERT INTO animals (name, date_of_birth, escape_attemps, neutered, weight_kg ) 
VALUES ('Ditti', '14 May 2022', 4, TRUE, 22);

BEGIN;
UPDATE animals SET species = 'unspecified';
ROLLBACK;

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
COMMIT;

BEGIN;
DELETE FROM animals;
ROLLBACK;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT ditti;
UPDATE animals SET weight_kg = -1 * weight_kg;
ROLLBACK TO ditti;
UPDATE animals SET weight_kg = -1 * weight_kg WHERE weight_kg < 0;
COMMIT;

INSERT INTO owners (full_name, age) 
VALUES 
  ('Sam Smith', 34), 
  ('Jennifer Orwell', 19), 
  ('Bob', 45), 
  ('Melody Pond', 77), 
  ('Dean Winchester', 14), 
  ('Jodie Wittaker', 38);


INSERT INTO species ( name) 
VALUES
  ('digimon'),
  ('pokemon');

UPDATE animals
SET species_id = CASE
    WHEN name LIKE '%mon' THEN 1
    ELSE 2
END;

UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';

UPDATE animals
SET owners_id = CASE
  WHEN name = 'Gabumon' THEN 2
  WHEN name = 'Pikachu' THEN 2
  ELSE owners_id
END
WHERE name IN ('Gabumon', 'Pikachu');

UPDATE animals
SET owners_id = CASE
  WHEN name = 'Devimon' THEN 3
  WHEN name = 'Plantmon' THEN 3
  ELSE owners_id
END
WHERE name IN ('Devimon', 'Plantmon');

UPDATE animals
SET owners_id = CASE
  WHEN name = 'Gabumon' THEN 2
  WHEN name = 'Pikachu' THEN 2
  ELSE owners_id
END
WHERE name IN ('Gabumon', 'Pikachu');

UPDATE animals
SET owners_id = CASE
  WHEN name = 'Chamander' THEN 4
  WHEN name = 'Squirtile' THEN 4
  WHEN name = 'Blossom' THEN 4
  ELSE owners_id
END
WHERE name IN ('Chamander', 'Squirtile', 'Blossom');

UPDATE animals
SET owners_id = CASE
  WHEN name = 'Boarmon' THEN 5
  WHEN name = 'Angemon' THEN 5
  ELSE owners_id
END
WHERE name IN ('Boarmon', 'Angemon');

INSERT INTO vets (name, age, date_of_graduation)
VALUES
  ('William Tatcher', 45, '23 April 2000'),
  ('Maisy Smith', 26, '17 Jan 2019'),
  ('Stephanie Mendez', 64, '4 May 1981'),
  ('Jack Harkness', 38, 'June 18, 2008');

INSERT INTO specializations (vet_id, species_id)
VALUES
   (1, 2),
   (3, 1),
   (3, 2),
   (4, 1);

INSERT INTO visits (vets_id, animal_id, date_of_visit)
 VALUES
   (1, 1, '24 May 2020'),
   (3, 1, '22 Jul 2020'),
   (4, 2, '2 Feb 2021'),
   (2, 3, '5 Jan 2020'),
   (2, 3, '8 Mar 2020'),
   (2, 3, '14 May 2020'),
   (3, 4, '4 May 2021'),
   (4, 5, '24 Feb 2021'),
   (2, 6, '21 Dec 2019'),
   (1, 6, '10 Aug 2020'),
   (2, 6, '7 April 2021'),
   (3, 7, '29 Sep 2019'),
   (4, 8, '3 Oct 2020'),
   (4, 8, '4 Nov 2020'),
   (2, 9, '24 Jan 2019'),
   (2, 9, '15 May 2019'),
   (2, 9, '27 Feb 2020'),
   (2, 9, '7 Aug 2020'),
   (3, 10, '24 May 2020'),
   (1, 10, '11 Jan 2021');

M
 INSERT INTO visits (animal_id, vets_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

 insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';