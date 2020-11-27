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
    "role_id" INT NOT NULL REFERENCES "role"("id"),
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
COMMIT TRANSACTION;

