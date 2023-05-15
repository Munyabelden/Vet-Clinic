SELECT * FROM animals WHERE name LIKE '%mon';

SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

SELECT name FROM animals WHERE neutered = TRUE AND escape_attemps < 3;

SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');

SELECT name, escape_attemps FROM animals WHERE weight_kg > 10.5;

SELECT * FROM animals WHERE neutered = TRUE;

SELECT * FROM animals WHERE name IN ('Gabumon');

SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attemps = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, SUM(escape_attemps) AS total_escapes FROM animals GROUP BY neutered;
SELECT species, MIN(weight_kg) AS min_weight, MAX(weight_kg) AS max_weight FROM animals GROUP BY species;
SELECT species, AVG(escape_attemps) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;

SELECT animals.name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Melody Pond';
SELECT animals.name FROM animals JOIN species ON animals.species_id = species.id WHERE species.name = 'pokemon';
SELECT owners.full_name, animals.name FROM owners LEFT JOIN animals ON owners.id = animals.owners_id ORDER BY owners.full_name;
SELECT o.full_name, a.name as animal_name FROM owners o LEFT JOIN animals a ON o.id = a.owners_id;
SELECT s.name as species_name, COUNT(*) as num_animals FROM animals a JOIN species s ON a.species_id = s.id GROUP BY s.name;
SELECT a.name as digimon_name FROM owners o JOIN animals a ON o.id = a.owners_id WHERE o.full_name = 'Jennifer Orwell' AND a.species_id = 1;
SELECT a.name as animal_name FROM owners o JOIN animals a ON o.id = a.owners_id WHERE o.full_name = 'Dean Winchester' AND a.escape_attemps = 0;
SELECT o.full_name, COUNT(*) as num_animals FROM animals a JOIN owners o ON a.owners_id = o.id GROUP BY a.owners_id, o.full_name ORDER BY num_animals DESC LIMIT 1;

SELECT species_id, COUNT(*) AS visit_count
FROM visits
JOIN animals ON visits.animal_id = animals.id
WHERE visits.vets_id = 2
GROUP BY species_id
ORDER BY visit_count DESC
LIMIT 1;

SELECT a.name AS animal_name, v.date_of_visit
FROM visits v
JOIN animals a ON v.animal_id = a.id
WHERE v.vets_id = 1
ORDER BY v.date_of_visit DESC
LIMIT 1;

SELECT COUNT(DISTINCT animal_id) AS num_animals
FROM visits
JOIN vets ON visits.vets_id = vets.id
JOIN animals ON visits.animal_id = animals.id
WHERE vets.name = 'Stephanie Mendez';

SELECT vets.name, species.name AS specialty
FROM vets
LEFT JOIN specializations ON vets.id = specializations.vet_id
LEFT JOIN species ON specializations.species_id = species.id
ORDER BY vets.name;

SELECT animals.name, animals.date_of_birth, animals.neutered, animals.weight_kg
FROM visits
JOIN vets ON visits.vets_id = vets.id
JOIN animals ON visits.animal_id = animals.id
WHERE vets.name = 'Stephanie Mendez'
AND visits.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';

SELECT animals.*, num_visits
 FROM animals
 JOIN (
   SELECT animal_id, COUNT(*) as num_visits
   FROM visits
   GROUP BY animal_id
   ORDER BY num_visits DESC
   LIMIT 1
 ) AS visits_count
 ON animals.id = visits_count.animal_id;

SELECT animals.name AS animal_name, visits.date_of_visit
FROM visits
JOIN animals ON visits.animal_id = animals.id
WHERE visits.vets_id = 2
ORDER BY visits.date_of_visit ASC
LIMIT 1;

SELECT animals.name AS animal_name, vets.name AS vet_name, visits.date_of_visit
FROM visits
JOIN animals ON visits.animal_id = animals.id
JOIN vets ON visits.vets_id = vets.id
ORDER BY visits.date_of_visit DESC
LIMIT 1;

SELECT species.name, COUNT(*) AS visit_count
FROM visits
JOIN animals ON visits.animal_id = animals.id
JOIN species ON animals.species_id = species.id
WHERE visits.vets_id = 2
GROUP BY species.id, species.name
ORDER BY visit_count DESC
LIMIT 1;

SELECT vets.name, species.name AS specialty
FROM vets
LEFT JOIN specializations ON vets.id = specializations.vet_id
LEFT JOIN species ON specializations.species_id = species.id
ORDER BY vets.name;

SELECT animals.name, animals.date_of_birth, animals.neutered, animals.weight_kg
FROM visits
JOIN vets ON visits.vets_id = vets.id
JOIN animals ON visits.animal_id = animals.id
WHERE vets.name = 'Stephanie Mendez'
AND visits.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';

SELECT COUNT(*) AS num_visits
FROM visits
JOIN animals ON visits.animal_id = animals.id
JOIN vets ON visits.vets_id = vets.id
LEFT JOIN specializations ON vets.id = specializations.vet_id AND animals.species_id = specializations.species_id
WHERE specializations.vet_id IS NULL;


EXPLAIN ANALYZE SELECT COUNT(*) FROM visits WHERE animal_id = 4;
EXPLAIN ANALYZE SELECT * FROM visits where vets_id = 2;
EXPLAIN ANALYZE SELECT * FROM owners where email = 'owner_18327@mail.com';
