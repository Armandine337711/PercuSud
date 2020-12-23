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
    "page_id" INT REFERENCES "page"("id"),
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
INSERT INTO "page"("title") VALUES
    ('Portraits de Profs'),
    ('Les Invités de l''Académie');

INSERT INTO "role"("role") VALUES 
('prof'),
('visiteur');

INSERT INTO "people" ("firstname", "lastname", "photo", "presentation","page_id", "role_id") VALUES
('Laurence', 'Meisterlin', 'laurence_meisterlin.jpg', 'Actuellement Professeur au Conservatoire à Rayonnement Régional de Toulouse et à l’Institut Supérieur des Arts de Toulouse.% Elle a étudié dans la classe de Michel Cerutti au CNSM de Paris entre 2005 et 2009 puis au CNSM de Lyon entre 2010 et 2012, dans le cadre de la formation diplomante au Certificat d’Aptitude.%
Elle collabore avec les compagnies de spectacle vivant « l’Embellie Musculaire » et « les Mécaniques Vivantes ».%
Membre du Paris Percussion Group.', 1, 1),
('Minh-Tam', 'Nguyen', 'minh_tam_nguyen.jpg', 'Soliste international, directeur artistique et musicien des Percussions de Strasbourg.%
Après avoir suivi des études au CRR de Nice, il intègre la classe de Jean Geoffroy au CNSM de Lyon. Il obtient un premier prix avec le Trio Yarn au International Percussion Competition du Luxembourg ainsi qu’un second Prix au concours international de Vibraphone Claude Giot.%
Artiste éclectique, son parcours musical l''amène à la croisée de divers univers (compagnie de danse Arcosm, Quatuor de Nuevo Tango la Grinta, Percussions de Strasbourg...)%
Très investi dans la transmission et la pédagogie, il enseigne successivement au CRR de Nice, au CRC de  Limeil-Brévannes, au CRR de Toulon puis au CNSMD-Lyon.
Il donne par ailleurs régulièrement des Masterclass en France et à l''étranger.%
http://www.percussionsdestrasbourg.com/%
http://minhtamnguyen.com/%
', 1, 1),
('Sébastien', 'Gisbert', 'sebastien_gisbert.jpg', 'Directeur de Percu''Sud Académie de Percussions de Limoux.%
Musicien Free-lance, professeur de percussions de l''école de musique AACT (Toulouse), percussionniste accompagnateur au pôle danse de l''ISDAT (Toulouse).%
A étudié au conservatoire de Béziers puis au CRR de Toulouse dans la classe de Michel Ventula, avant d’intégrer l’ISDAT (pôle supérieur de Toulouse) et d’obtenir le DNSPM d''artiste musicien.%
Parallèlement à son parcours classique, il développe, à travers différents voyages ou rencontres, son intérêt pour les percussions ethniques ainsi que pour la création sonore dans le milieu théâtral.%
Il évolue dans plusieurs formations musicales d''univers très éclectiques:%
Daltin Trio, l''Orchestre National du Capitole de Toulouse, le Toulouse Wind Orchestra, les Saqueboutiers de Toulouse, l''Orchestre Symphonique Tunisien, Funky Style Brass, Mister Team, Loud Cloud...%
Il travaille actuellement sur sa création solo "CHUT" pour la saison (2019/2020) en collaboration avec la Scène Nationale d''Albi.%
http://www.sebastiengisbert.com/', 1, 1),
('Florent', 'Tisseyre', 'florent_tisseyre.jpg', 'Musicien free-lance, accompagnateur des classes de danse du CRR de Toulouse et de l’Isdat (Toulouse)%
Après des études musicales au CRR de Toulouse ponctuées par l’obtention d’un 1er prix mention très bien, il obtient le diplôme d’état d’accompagnateur option danse.%
En parallèle, il suit une formation aux percussions latines (notamment afro-cubaines) auprès de G. Maldonaldo et JC Martinez.%
En tant qu’interprète, il mène un parcours très éclectique allant de la musique ancienne (ensemble Les Sacqueboutiers) au jazz (Initiative H, Headbangers, Big band...), en passant par le funk, la musique classique (Orchestre National du Capitole de Toulouse), la musique latine (Mecanica loca, Caña brava) ou encore l’électro (Reco-reco).%
http://www.les-sacqueboutiers.com%', 1, 1),
('Emilien', 'Prodhomme', 'emilien_prodhomme.jpg', 'Timbalier solo de l’orchestre national du capitole de Toulouse, Professeur à l’Isdat (Toulouse).%
Originaire de Rennes (35), son apprentissage des percussions l’amène à cotoyer plusieurs pédagogues reconnus parmi lesquels Olivier Fiard (CRR Rennes), Francis Brana (ENM Créteil) et Jean Geoffroy (CNSM de Lyon).%
Il obtient en 2010 le diplôme de Master d’interprétation (Mention TB à l’unanimité).%
Passionné par les répertoires symphonique et lyrique, il collabore depuis 2003 avec différents orchestres français.%
Après avoir occupé pendant quelque mois le poste de percussionniste au sein de l’orchestre symphonique de Saint-Etienne, il est recruté en tant que percussioniste solo (2009) puis timbalier solo (2014) de l’orchestre national du capitole de Toulouse.%
Par ailleurs, il porte un grand intérêt à la musique de chambre et à la création d’oeuvres nouvelles pour différentes formations.%
Depuis 2010, il enseigne les timbales et le répertoire orchestral pour percussions au pôle supérieur de Toulouse.%', 1, 1),
('Thibault', 'Buchaillet', 'thibault_buchaillet.jpg', 'Percussionniste solo de l’orchestre national du Capitole de Toulouse.%
Professeur à l’Isdat (pôle supéreur de Toulouse)%
Né en 1985, Thibault Buchaillet commence la percussion à l’âge de 10 ans au CNR de Nantes dans laclasse d’Hédy Réjiba où il obtiendra son DEM en
2003.%
Après deux années d’études avec Francis Brana à l’ENM de Créteil, il intègre la classe de Jean Geoffroy au CNSMD de Lyon en 2005.%
En parallèle, il joue régulièrement en tant que musicien supplémentaire dans différents orchestres (Orchestre et Opéra National de Lyon, Orchestre
National des Pays de la Loire, Orchestre symphonique de St-Etienne...).%
Il obtient son master de percussion en juin 2010.%
Percussionniste au sein de la musique des Equipages de la flotte de Brest puis de Toulon entre 2008 et 2012, il occupe actuellement le poste de
percussion solo à l’Orchestre National du Capitole de Toulouse.%
Thibault Buchaillet est également professeur à l''Isdat de Toulouse depuis 2015 et participe à l''académie de cuivres et percussions de Larmor.', 2, 1),
('Nicolas', 'Lamothe', 'nicolas_lamothe.jpg', 'Second percussionniste solo de l''Orchestre Philharmonique de Radio-France, Professeur au conservatoire du 17ème arrondissement de Paris.%
Né en 1983 dans le sud-ouest de la France, il a étudié les percussions au CNSMDP dans la classe de Michel Cerutti.%
Il débute sa carrière de musicien au sein de l''Orchestre national de Montpellier, au poste de claviers solo jouant les timbales.%
Nicolas est par ailleurs membre du Paris Percussion Group, et représente la marque Zildjian en tant qu''artiste associé.%
https://paris-percussion-group.com/%', 1, 1),
('Aurélien', 'Hadyniak', 'aurelien_hadyniak.jpg', 'professeur au Conservatoire de Pau, musicien free-lance.%
Né en 1985, Aurélien Hadyniak débute les percussions à l’âge de 10 ans et suit les enseignements de Jean-Louis Delbarre et Jean-Louis Raison dans le Nord de la France. Il se perfectionne par la suite avec Francis Brana (ENM Créteil), puis intègre la classe de Jean Geoffroy au CNSM de Lyon.%
Après l’obtention du DNSPM en 2008, il poursuit son parcours avec le cursus Master de la MusicHochschule de Stuttgart dans la classe de Marta Klimasara.%
Passionné de musique orchestrale, il joue régulièrement en tant que musicien supplémentaire dans différents orchestres (Orchestre du Capitole de Toulouse, Orchestre National Bordeaux Aquitaine, Orchestre Pau Pays de Béarn, Opéra de Limoges, Orchestre National de Lille…)%
Il a fait parti de différents ensembles de percussions (Tactus, trio Ackronick, l’ensemble de percussion de  Stuttgart) et a ainsi pu explorer un large répertoire allant de la musique contemporaine aux transcriptions (sonates en trio de Jean Sébastien Bach) mais aussi le travail de création avec compositeur ou chorégraphe. Il participe à l’élaboration du spectacle DEMOCRACY.%
Son activité de direction d’orchestre et autour du Sound Painting l’amène à diriger dans divers projets et festivals (Les Arts Franchis, Festival Peaux à Pau, assistant au Toulouse Wind Orchestra )%
Aurélien Hadyniak est par ailleurs organisateur et coordinateur des festivals Peaux à Pau éditions 2016 et 2018.%', 1, 1);



COMMIT TRANSACTION;

