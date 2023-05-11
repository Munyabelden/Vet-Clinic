CREATE DATABASE vet_clinic

CREATE TABLE animals (
  id SERIAL PRIMARY KEY,
  name VARCHAR (50), 
  date_of_birth DATE NOT NULL,
  escape_attemps INT,
  neutered BOOLEAN NOT NULL,
  weight_kg DECIMAL(10,2) NOT NULL
);


ALTER TABLE animals ADD COLUMN species VARCHAR(50);

CREATE TABLE owners (
  id SERIAL PRIMARY KEY, 
  full_name VARCHAR(255), 
  age INTEGER
);

CREATE TABLE specis (
  id SERIAL PRIMARY KEY, 
  name VARCHAR(50),
);

ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals
ADD COLUMN species_id INTEGER REFERENCES species(id),
ADD COLUMN owner_id INTEGER REFERENCES owners(id);

CREATE TABLE vets (
  id SERIAL PRIMARY KEY, 
  name VARCHAR(255), 
  age INTEGER, 
  date_of_graduation DATE 
);

CREATE TABLE specializations (
  id SERIAL PRIMARY KEY,
  vet_id INTEGER NOT NULL REFERENCES vets(id),
  species_id INTEGER NOT NULL REFERENCES species(id)
);

CREATE TABLE visits ( 
  vets_id INTEGER NOT NULL REFERENCES vets(id), 
  animal_id INTEGER NOT NULL REFERENCES animals(id),
  date_of_visit DATE,
);
