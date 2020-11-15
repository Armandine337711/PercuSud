# MLD

page(id SERIAL, titre TEXT NOT NULL, descriptif TEXT NOT NULL)

article(id SERIAL, titre TEXT NOT NULL, contenu TEXT NOT NULL, #page(id) INT)

people(id SERIAL, identite TEXT NOT NULL, photo TEXT, presentation TEXT, role TEXT NOT NULL, #role(id))
role(id SERIAL, role TEXT NOT NULL)
formule(id SERIAL, formule TEXT NOT NULL, price INT NOT NULL)

student(id SERIAL, nom TEXT NOT NULL, prenom TEXT NOT NULL, date_naissance DATENOT NULL, adresse TEXT NOT NULL, adresse2 TEXT, code_postal INTEGER NOT NULL, ville TEXT NOT NULL, téléphone INT NOT NULL, __mail TEXT NOT NULL__, #formule(id) INT NOT NULL, created_at TIMESTAMP)

parent(id SERIAl, nom TEXT NOT NULL, prenom TEXT NOT NULL, __mail TEXT NOT NULL__)

student_has_parent(student(#eleve(id), #parent(id))

## Notes

dans la table student : le mail doit être unique
