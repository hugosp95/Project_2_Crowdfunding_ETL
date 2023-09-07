-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.
drop table "CONTACTS";
DROP TABLE "CAMPAIGN";
DROP TABLE "CATEGORY";
DROP TABLE "SUBCATEGORY";

CREATE TABLE "CAMPAIGN" (
    "cf_id" INT   NOT NULL,
    "contact_id" INT   NOT NULL,
    "company_name" VARCHAR(60)   NOT NULL,
    "description" VARCHAR(360)   NOT NULL,
    "goal" FLOAT   NOT NULL,
    "pledged" FLOAT   NOT NULL,
    "outcome" VARCHAR(30)   NOT NULL,
    "backers_count" INT   NOT NULL,
    "country" VARCHAR(20)   NOT NULL,
    "currency" VARCHAR(10)   NOT NULL,
    "launched_date" DATE   NOT NULL,
    "end_date" DATE   NOT NULL,
    "category_id" VARCHAR(30)   NOT NULL,
    "subcategory_id" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_CAMPAIGN" PRIMARY KEY (
        "contact_id"
     )
);

CREATE TABLE "CONTACTS" (
    "contact_id" INT   NOT NULL,
    "first_name" VARCHAR(30)   NOT NULL,
    "last_name" VARCHAR(30)   NOT NULL,
    "email" VARCHAR(60)   NOT NULL
);

CREATE TABLE "CATEGORY" (
    "category_id" VARCHAR(30)   NOT NULL,
    "category" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_CATEGORY" PRIMARY KEY (
        "category_id"
     )
);

CREATE TABLE "SUBCATEGORY" (
    "subcategory_id" VARCHAR(30)   NOT NULL,
    "subcategory" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_SUBCATEGORY" PRIMARY KEY (
        "subcategory_id"
     )
);

ALTER TABLE "CAMPAIGN" ADD CONSTRAINT "fk_CAMPAIGN_category_id" FOREIGN KEY("category_id")
REFERENCES "CATEGORY" ("category_id");

ALTER TABLE "CAMPAIGN" ADD CONSTRAINT "fk_CAMPAIGN_subcategory_id" FOREIGN KEY("subcategory_id")
REFERENCES "SUBCATEGORY" ("subcategory_id");

ALTER TABLE "CONTACTS" ADD CONSTRAINT "fk_CONTACTS_contact_id" FOREIGN KEY("contact_id")
REFERENCES "CAMPAIGN" ("contact_id");


COPY "CATEGORY"(category_id,category)
FROM 'C:\Users\husaavedrapacheco\Documents\GitHub\Project-2\Project_2_Crowdfunding_ETL\Resources\category.csv' DELIMITER ',' CSV HEADER;

COPY "SUBCATEGORY"(subcategory_id,subcategory)
FROM 'C:\Users\husaavedrapacheco\Documents\GitHub\Project-2\Project_2_Crowdfunding_ETL\Resources\subcategory.csv' DELIMITER ',' CSV HEADER;

COPY "CAMPAIGN"(cf_id,contact_id,company_name,description,goal,pledged,outcome,backers_count,country,currency,launched_date,end_date,category_id,subcategory_id)
FROM 'C:\Users\husaavedrapacheco\Documents\GitHub\Project-2\Project_2_Crowdfunding_ETL\Resources\campaign.csv' DELIMITER ',' CSV HEADER;

COPY "CONTACTS"(contact_id, first_name,last_name,email)
FROM 'C:\Users\husaavedrapacheco\Documents\GitHub\Project-2\Project_2_Crowdfunding_ETL\Resources\contacts.csv' DELIMITER ',' CSV HEADER;

SELECT * FROM "CAMPAIGN"
LIMIT 3;

SELECT * FROM "CONTACTS"
LIMIT 3;

SELECT * FROM "CATEGORY"
LIMIT 3;

SELECT * FROM "SUBCATEGORY"
LIMIT 3;

