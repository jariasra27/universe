    -- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Galaxy" (
    "galaxy_id" Serial   NOT NULL,
    "name" Varchar(40)   NOT NULL,
    "color" Varchar(30)   NOT NULL,
    "size" Int   NOT NULL,
    "is_active" Boolean   NOT NULL,
    "galaxy_type_id" Int   NOT NULL,
    CONSTRAINT "pk_Galaxy" PRIMARY KEY (
        "galaxy_id"
     ),
    CONSTRAINT "uc_Galaxy_name" UNIQUE (
        "name"
    )
);

CREATE TABLE "Galaxy_type" (
    "galaxy_type_id" Serial   NOT NULL,
    "type" Text   NOT NULL,
    "name" Varchar(30)   NOT NULL,
    "description" Varchar(50)   NOT NULL,
    CONSTRAINT "pk_Galaxy_type" PRIMARY KEY (
        "galaxy_type_id"
     ),
    CONSTRAINT "uc_Galaxy_type_type" UNIQUE (
        "type"
    )
);

CREATE TABLE "Star" (
    "star_id" Serial   NOT NULL,
    "name" Varchar(30)   NOT NULL,
    "color" Varchar(30)   NOT NULL,
    "star_clasification_id" Int   NOT NULL,
    "galaxy_id" Int   NOT NULL,
    CONSTRAINT "pk_Star" PRIMARY KEY (
        "star_id"
     ),
    CONSTRAINT "uc_Star_name" UNIQUE (
        "name"
    )
);

CREATE TABLE "Star_clasification" (
    "star_clasification_id" Serial   NOT NULL,
    "clase" Text   NOT NULL,
    "description" Varchar(100)   NOT NULL,
    CONSTRAINT "pk_Star_clasification" PRIMARY KEY (
        "star_clasification_id"
     ),
    CONSTRAINT "uc_Star_clasification_clase" UNIQUE (
        "clase"
    )
);

CREATE TABLE "Planet" (
    "planet_id" Serial   NOT NULL,
    "name" Varchar(30)   NOT NULL,
    "size" Int   NOT NULL,
    "Gravity" Numeric   NOT NULL,
    "has_life" Boolean   NOT NULL,
    "star_id" Int   NOT NULL,
    CONSTRAINT "pk_Planet" PRIMARY KEY (
        "planet_id"
     ),
    CONSTRAINT "uc_Planet_name" UNIQUE (
        "name"
    )
);

CREATE TABLE "Moon" (
    "moon_id" Serial   NOT NULL,
    "name" Varchar(30)   NOT NULL,
    "size" Int   NOT NULL,
    "density" Int   NOT NULL,
    "volumen" Int   NOT NULL,
    "planet_id" Int   NOT NULL,
    CONSTRAINT "pk_Moon" PRIMARY KEY (
        "moon_id"
     ),
    CONSTRAINT "uc_Moon_name" UNIQUE (
        "name"
    )
);

ALTER TABLE "Galaxy" ADD CONSTRAINT "fk_Galaxy_galaxy_type_id" FOREIGN KEY("galaxy_type_id")
REFERENCES "Galaxy_type" ("galaxy_type_id");

ALTER TABLE "Star" ADD CONSTRAINT "fk_Star_star_clasification_id" FOREIGN KEY("star_clasification_id")
REFERENCES "Star_clasification" ("star_clasification_id");

ALTER TABLE "Star" ADD CONSTRAINT "fk_Star_galaxy_id" FOREIGN KEY("galaxy_id")
REFERENCES "Galaxy" ("galaxy_id");

ALTER TABLE "Planet" ADD CONSTRAINT "fk_Planet_star_id" FOREIGN KEY("star_id")
REFERENCES "Star" ("star_id");

ALTER TABLE "Moon" ADD CONSTRAINT "fk_Moon_planet_id" FOREIGN KEY("planet_id")
REFERENCES "Planet" ("planet_id");

-- Datos de la tabla tipo de galaxia
INSERT INTO Galaxy_type(type, name, description)
VALUES ('E','Eliptica','Tiene forma de elipse.'),
       ('SO','Lenticulares','Tienen un nucleo casi esferico.'),
       ('S','Espiral','Tienen un nucleo de estrellas viejas, con un disco rotante.'),
       ('SB','Espiral barrada','No tienen ninguna estructura, ni simetria definida.')

INSERT INTO Galaxy(name, color, size, is_active, galaxy_type_id)
VALUES ('Via Lactea','Cosmico',100000,True,3),
       ('Andromeda','Azul, Verde, Rojo',220000,True,3),
       ('Nube de Magallanes','Rojo, Verde',35000,True,4),
       ('Palo de Hockey','Azul, Rojo', 0,False,4),
       ('NGC 2500','Azul, Rojo',25000,False,4),
       ('Messier 87','Negro',1000000,False,1),
       ('Del Sombrero','Rojo, Verde, Azul', 50000,True,2)

INSERT INTO Star_clasification(clase, description)
VALUES ('O','Lineas de helio,oxigeno y nitrogeno.'),
       ('B','Lineas de helio alcanzan la maxima intensidad en B2'),
       ('A','Comprende las llamdas estrellas de hidrogeno'),
       ('F','Destacan las lineas H y K del calcio'),
       ('G','Lineas H y K y lineas de hidrogeno menos fuertes'),
       ('K','Lineas de calcio y otros metales'),
       ('M','Bandas que indican la precencia de oxidos metalicos')

INSERT INTO Star(name,color,star_clasification_id,galaxy_id)
VALUES ('BC Cygni','Rojo-naranja',7,4),
       ('UY Scuti','Roja', 3,2),
       ('RW Cephei','Roja',5,3),
       ('S Persei','Roja',1,6),
       ('S Orionis','Amarillo',7,5),
       ('PI Puppis','Azul',6,3),
       ('NO Aurigae','Amariilo-Naranja',7,7)

INSERT INTO Planet(name,size,gravity,has_life,star_id)
VALUES ('Tierra',12756,9.80,True,1),
       ('Marte',6794,3.71,False,2),
       ('Venus',12104,8.87,False,3),
       ('Mercurio',4878,3.7,False,4),
       ('Jupiter',142984,24.79,False,5),
       ('Neptuno',49572,11.15,False,6),
       ('Saturno',10872,10.44,False,7),
       ('Urano',51118,8.7,False,1),
       ('Haumea',310,0.08,False,2),
       ('Eris',2400,0.19,False,3),
       ('Sedna',995,1.12,False,4),
       ('Goblin',300,0.86,False,5),
       ('Makemake',175,0.5,False,6)

INSERT INTO Moon(name,size,density,volumen,planet_id)
VALUES ('Luna',3496,3,219,1),
       ('Deimos',1900,5,185,2),
       ('Fobos',27,14,201,2),
       ('Amaltea',166,1,207,5),
       ('Calisto',3496,2,114,5),
       ('Europa',3100,3,202,5),
       ('Ganimedes',5262,2,215,5),
       ('lo',3476,3,186,5),
       ('Dione',1800,8,219,7),
       ('Encelado',500,3,209,7),
       ('Mimas',395,9,130,7),
       ('Febe',220,4,215,7),
       ('Rea',650,6,188,7),
       ('Ariel',1158,2,115,8),
       ('Miranda',1760,5,245,8),
       ('Titania',1579,3,312,8),
       ('Nereida',340,3,115,6),
       ('Triton',2700,2,115,6),
       ('Titan',5150,2,312,7),
       ('Tethys',1062,4,236,7),
       ('Umbriel',1169,1,345,8)