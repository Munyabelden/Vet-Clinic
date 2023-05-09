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


