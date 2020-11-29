BEGIN TRANSACTION;

DROP TABLE IF EXISTS "page", "article", "people", "role", "formule", "student", "parent";

CREATE TABLE IF NOT EXISTS "page"(
    "id" SERIAL PRIMARY KEY,
    "title" TEXT NOT NULL,
    "subtitle"TEXT,
    "created_at" TIMESTAMP NOT NULL DEFAULT NOW(),
    "updated_at" TIMESTAMP NOT NULL DEFAULT NOW(),
    "published" BOOLEAN
);

CREATE TABLE IF NOT EXISTS "article"(
    "id" SERIAL PRIMARY KEY,
    "title" TEXT NOT NULL,
    "content" TEXT NOT NULL,
    "created_at" TIMESTAMP NOT NULL DEFAULT NOW(),
    "updated_at" TIMESTAMP NOT NULL DEFAULT NOW(),
    "published" BOOLEAN,
    "page_id" INT REFERENCES "page"("id")
);

CREATE TABLE IF NOT EXISTS "role"(
    "id" SERIAL PRIMARY KEY,
    "role" TEXT NOT NULL,
    "created_at" TIMESTAMP NOT NULL DEFAULT NOW(),
    "updated_at" TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS "people"(
    "id" SERIAL PRIMARY KEY,
    "firstname" TEXT NOT NULL,
    "lastname" TEXT NOT NULL,
    "photo" TEXT,
    "presentation" TEXT,
    "role_id" INT NOT NULL,
    "created_at" TIMESTAMP NOT NULL DEFAULT NOW(),
    "updated_at" TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS "formule"(
    "id" SERIAL PRIMARY KEY,
    "title" TEXT NOT NULL,
    "price" DECIMAL NOT NULL,
    CHECK ("price" > 0),
    "created_at" TIMESTAMP NOT NULL DEFAULT NOW(),
    "updated_at" TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS "parent"(
    "id" SERIAL PRIMARY KEY,
    "firstname" TEXT NOT NULL,
    "lastname" TEXT NOT NULL,
    "birth_date" DATE NOT NULL,
    "adress" TEXT NOT NULL,
    "adress2" TEXT,
    "zip" INT NOT NULL,
    "city" TEXT NOT NULL,
    "phone" INT NOT NULL,
    "mail" TEXT UNIQUE NOT NULL,
    "created_at" TIMESTAMP NOT NULL DEFAULT NOW(),
    "updated_at" TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS "student"(
    "id" SERIAL PRIMARY KEY,
    "firstname" TEXT NOT NULL,
    "lastname" TEXT NOT NULL,
    "birth_date" DATE NOT NULL,
    "adress" TEXT NOT NULL,
    "adress2" TEXT,
    "zip" INT NOT NULL,
    "city" TEXT NOT NULL,
    "phone" INT NOT NULL,
    "mail" TEXT UNIQUE NOT NULL,
    "formule_id" INT NOT NULL REFERENCES "formule"("id"),
    "parent_id" INT REFERENCES "parent"("id"),
    "created_at" TIMESTAMP NOT NULL DEFAULT NOW(),
    "updated_at" TIMESTAMP NOT NULL DEFAULT NOW()
);

/* Remplissage des tables */
INSERT INTO "role"("role") VALUES 
('prof'),
('visiteur');

INSERT INTO "people" ("firstname", "lastname", "photo", "presentation", "role_id") VALUES
('Laurence', 'Meisterlin', 'laurence_meisterlin.jpg', 'Actuellement Professeur au Conservatoire à Rayonnement Régional de Toulouse et à l’Institut Supérieur des Arts de Toulouse.
A étudié dans la classe de Michel Cerutti au CNSM de Paris entre 2005 et 2009 puis au CNSM de Lyon entre 2010 et 2012, dans le cadre de la formation diplomante au Certificat d’Aptitude.
Collabore avec les compagnies de spectacle vivant « l’Embellie Musculaire » et « les Mécaniques Vivantes ».
Membre du Paris Percussion Group.', 1),
('Minh-Tam', 'Nguyen', 'minh_tam_nguyen.jpg', 'Soliste international, directeur artistique et musicien des Percussions de Strasbourg.
Après avoir suivi des études au CRR de Nice, il intègre la classe de Jean Geoffroy au CNSM de Lyon. Il obtient un premier prix avec le Trio Yarn au International Percussion Competition du Luxembourg ainsi qu’un second Prix au concours international de Vibraphone Claude Giot.
Artiste éclectique, son parcours musical l''amène à la croisée de divers univers (compagnie de danse Arcosm, Quatuor de Nuevo Tango la Grinta, Percussions de Strasbourg...)
Très investi dans la transmission et la pédagogie, il enseigne successivement au CRR de Nice, au CRC de  Limeil-Brévannes, au CRR de Toulon puis au CNSMD-Lyon.
Il donne par ailleurs régulièrement des Masterclass en France et à l''étranger.
http://www.percussionsdestrasbourg.com/
http://minhtamnguyen.com/
', 1),
('Sébastien', 'Gisbert', 'sebastien_gisbert.jpg', 'Directeur de Percu''Sud Académie de Percussions de Limoux.
Musicien Free-lance, professeur de percussions de l''école de musique AACT (Toulouse), percussionniste accompagnateur au pôle danse de l''ISDAT (Toulouse).
A étudié au conservatoire de Béziers puis au CRR de Toulouse dans la classe de Michel Ventula, avant d’intégrer l’ISDAT (pôle supérieur de Toulouse) et d’obtenir le DNSPM d''artiste musicien.
Parallèlement à son parcours classique, il développe, à travers différents voyages ou rencontres, son intérêt pour les percussions ethniques ainsi que pour la création sonore dans le milieu théâtral.
Il évolue dans plusieurs formations musicales d''univers très éclectiques:
Daltin Trio, l''Orchestre National du Capitole de Toulouse, le Toulouse Wind Orchestra, les Saqueboutiers de Toulouse, l''Orchestre Symphonique Tunisien, Funky Style Brass, Mister Team, Loud Cloud...
Il travaille actuellement sur sa création solo "CHUT" pour la saison (2019/2020) en collaboration avec la Scène Nationale d''Albi.
http://www.sebastiengisbert.com/', 1);



COMMIT TRANSACTION;

