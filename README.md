# Facebook Database Project

## Overview

In **Project 1**, I designed a relational database for the fictional social media platform **Fakebook**. The project involved creating an ER diagram based on the provided business rules and implementing SQL scripts to create, load, and drop database objects.

## Key Features

- **Users**: I modeled user profiles, including personal information, educational history, and friendships.
- **Messages**: I tracked messages between users, including sender and receiver details.
- **Photos and Albums**: I handled photo uploads into albums, with user tagging and album metadata.
- **Events**: I modeled events, event participation, and related metadata such as time and location.

## Objectives

1. **ER Diagram**: I created an ER diagram representing the business rules of the Fakebook platform.
2. **SQL Scripts**: I wrote SQL scripts to create, load, and drop database objects according to the ER diagram.


## Part 1: Creating an ER Diagram

For this part, I designed an ER diagram that accurately reflects the key features of Fakebook:

1. **Users**: 
   - Each user has a profile with personal info, educational history, and a list of friends. The friends are modeled using a "Requester" and "Requestee" relationship.
2. **Messages**: 
   - Each message has a unique ID, and tracks the sender and receiver along with the message content and timestamp.
3. **Photos and Albums**: 
   - Photos are part of albums, with metadata such as timestamps, captions, and tagged users. Users can be tagged in photos at specific coordinates.
4. **Events**: 
   - Events are created by users, and I tracked participants with their confirmation status, as well as event details like location and time.

## Deliverables

- **ER Diagram**: A diagram that clearly depicts entities, attributes, relationships, and constraints.
- **SQL Scripts**: Scripts to create the database schema, load data, and manage objects.

## Notes

- I ensured that the ER diagram accurately represented the required relationships and constraints.
- While some constraints couldn’t be directly modeled in the ER diagram, I implemented them later through SQL scripts.

## Part 2: SQL DDL Statements for Fakebook Database

## Overview
For the second task of Project 1, you are required to write SQL DDL (Data Definition Language) statements to create and drop data tables that reflect the **Fakebook** specifications. You will need to write two SQL scripts:

1. **createTables.sql**: This script will create the necessary data tables.
2. **dropTables.sql**: This script will drop (destroy) the data tables.

These scripts should also create and drop any necessary constraints, sequences, and triggers required to enforce the rules defined in the Fakebook specification.

## Steps

### 1. Writing the SQL Scripts
You should create two SQL scripts:

- **createTables.sql**: This script will:
  - Create all the necessary tables.
  - Create any required constraints (such as foreign keys).
  - Create sequences and triggers needed to enforce database rules.

- **dropTables.sql**: This script will:
  - Drop all the tables created in `createTables.sql`.
  - Drop the corresponding constraints, sequences, and triggers.

### 2. Running the Scripts
Once you have written the two SQL scripts, follow the steps below to run them using SQL*Plus on your Linux machine.
   ```sql
   SQL> @createTables
   SQL> @dropTables
   ```
