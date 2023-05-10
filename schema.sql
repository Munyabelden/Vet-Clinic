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

ALTER TABLE vet_clinic
DROP COLUMN species;

ALTER TABLE vet_clinic
ADD COLUMN species_id INTEGER REFERENCES species(id),
ADD COLUMN owner_id INTEGER REFERENCES owners(id);

