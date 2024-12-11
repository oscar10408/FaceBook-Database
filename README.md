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

## Part 2: Creating the Data Tables

## Overview
For the second task of Project 1, I am required to write SQL DDL (Data Definition Language) statements to create and drop data tables that reflect the Fakebook specifications. I need to write two SQL scripts:

1. **createTables.sql**: This script will create the necessary data tables.
2. **dropTables.sql**: This script will drop (destroy) the data tables.

These scripts should also create and drop any necessary constraints, sequences, and triggers required to enforce the rules defined in the Fakebook specification.

## Steps

### 1. Writing the SQL Scripts
Create two SQL scripts:

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

##  Desired Schema
# Fakebook Database Schema

## Users Table

| Column           | Type        | Required |
|------------------|-------------|----------|
| user_id          | INTEGER     | yes      |
| first_name       | VARCHAR2(100)| yes      |
| last_name        | VARCHAR2(100)| yes      |
| year_of_birth    | INTEGER     | yes      |
| month_of_birth   | INTEGER     | yes      |
| day_of_birth     | INTEGER     | yes      |
| gender           | VARCHAR2(100)| yes      |

## Friends Table

| Column     | Type    | Required |
|------------|---------|----------|
| user1_id   | INTEGER | yes      |
| user2_id   | INTEGER | yes      |

**Important**: This table should not allow duplicate friendships. The combination `(user1_id, user2_id)` and `(user2_id, user1_id)` should be treated as the same.

## Cities Table

| Column       | Type        | Required |
|--------------|-------------|----------|
| city_id      | INTEGER     | yes      |
| city_name    | VARCHAR2(100)| yes      |
| state_name   | VARCHAR2(100)| yes      |
| country_name | VARCHAR2(100)| yes      |

## User_Current_Cities Table

| Column        | Type    | Required |
|---------------|---------|----------|
| user_id       | INTEGER | yes      |
| current_city_id | INTEGER | yes    |

## User_Hometown_Cities Table

| Column           | Type    | Required |
|------------------|---------|----------|
| user_id          | INTEGER | yes      |
| hometown_city_id | INTEGER | yes      |

## Messages Table

| Column          | Type        | Required |
|-----------------|-------------|----------|
| message_id      | INTEGER     | yes      |
| sender_id       | INTEGER     | yes      |
| receiver_id     | INTEGER     | yes      |
| message_content | VARCHAR2(2000)| yes    |
| sent_time       | TIMESTAMP   | yes      |

## Programs Table

| Column         | Type        | Required |
|----------------|-------------|----------|
| program_id     | INTEGER     | yes      |
| institution    | VARCHAR2(100)| yes     |
| concentration  | VARCHAR2(100)| yes     |
| degree         | VARCHAR2(100)| yes     |

## Education Table

| Column       | Type        | Required |
|--------------|-------------|----------|
| user_id      | INTEGER     | yes      |
| program_id   | INTEGER     | yes      |
| program_year | INTEGER     | yes      |

## User_Events Table

| Column           | Type        | Required |
|------------------|-------------|----------|
| event_id         | INTEGER     | yes      |
| event_creator_id | INTEGER     | yes      |
| event_name       | VARCHAR2(100)| yes     |
| event_tagline    | VARCHAR2(100)| no      |
| event_description| VARCHAR2(100)| no      |
| event_host       | VARCHAR2(100)| no      |
| event_type       | VARCHAR2(100)| no      |
| event_subtype    | VARCHAR2(100)| no      |
| event_address    | VARCHAR2(2000)| no     |
| event_city_id    | INTEGER     | yes      |
| event_start_time | TIMESTAMP   | no      |
| event_end_time   | TIMESTAMP   | no      |

## Participants Table

| Column        | Type        | Required |
|---------------|-------------|----------|
| event_id      | INTEGER     | yes      |
| user_id       | INTEGER     | yes      |
| confirmation  | VARCHAR2(100)| yes     |

**Important**: The value of `confirmation` must be one of the following: `Attending`, `Unsure`, `Declines`, `Not_Replied`.

## Albums Table

| Column             | Type        | Required |
|--------------------|-------------|----------|
| album_id           | INTEGER     | yes      |
| album_owner_id     | INTEGER     | yes      |
| album_name         | VARCHAR2(100)| yes     |
| album_created_time | TIMESTAMP   | yes      |
| album_modified_time| TIMESTAMP   | no      |
| album_link         | VARCHAR2(2000)| yes    |
| album_visibility   | VARCHAR2(100)| yes     |
| cover_photo_id     | INTEGER     | yes      |

**Important**: The value of `album_visibility` must be one of the following: `Everyone`, `Friends`, `Friends_Of_Friends`, or `Myself`.

## Photos Table

| Column             | Type        | Required |
|--------------------|-------------|----------|
| photo_id           | INTEGER     | yes      |
| album_id           | INTEGER     | yes      |
| photo_caption      | VARCHAR2(2000)| no     |
| photo_created_time | TIMESTAMP   | yes      |
| photo_modified_time| TIMESTAMP   | no      |
| photo_link         | VARCHAR2(2000)| yes    |

## Tags Table

| Column           | Type        | Required |
|------------------|-------------|----------|
| tag_photo_id     | INTEGER     | yes      |
| tag_subject_id   | INTEGER     | yes      |
| tag_created_time | TIMESTAMP   | yes      |
| tag_x            | NUMBER      | yes      |
| tag_y            | NUMBER      | yes      |

## Friends Trigger
Triggers are used in SQL to automatically execute code when certain events occur, such as inserting or updating data in a table. For this project, I will use a trigger to enforce the uniqueness constraint on the FRIENDS table. Specifically, the trigger will ensure that any pair of friend IDs is sorted, maintaining consistency and preventing duplicate entries. This way, regardless of the order in which the friend IDs are inserted, the trigger will sort them to preserve uniqueness in the relationship. This prevents duplicate entries like **(1, 9)** and **(9, 1)**.
The DDL to create this trigger should be included in createTables.sql script. Here’s the full syntax for the trigger:
```sql
CREATE TRIGGER Order_Friend_Pairs
    BEFORE INSERT ON Friends
    FOR EACH ROW
        DECLARE temp INTEGER;
        BEGIN
            IF :NEW.user1_id > :NEW.user2_id THEN
                temp := :NEW.user2_id;
                :NEW.user2_id := :NEW.user1_id;
                :NEW.user1_id := temp;
            END IF;
        END;
```

## Part 3: Populating Database
### Overview
The third part of Project 1 requires me to load data from the public dataset (a poorly designed database) into the well-designed tables I created. To do this, I need to write SQL DML (Data Manipulation Language) statements that SELECT the appropriate data from the public dataset and INSERT it into the tables I’ve set up.

May also need to use SQL statements like:

- **DISTINCT**
- **JOIN**
- **WHERE**
- **INTERSECT**
- **UNION**
- **MINUS**

These will help to manipulate and filter the data as required during the insertion process.

### Loading Fakebook Friends
When loading the **Fakebook friends** data, I must handle the fact that friendship is **reciprocal**. This means if the public dataset contains both `(2, 7)` and `(7, 2)`, only one of them should be loaded into your `Friends` table. It doesn’t matter which one I choose, as long as I only load one pair.

The **Friends Trigger** will automatically ensure the direction of friendship is preserved. However, I must ensure that only one directional pair of friends is selected from the public dataset.

### The Public Dataset

The public dataset is divided into five tables, each containing a series of data fields. These fields may have additional business rules or constraints that define the allowable values for each entry. When referring to these tables in SQL scripts, you must use the **fully-qualified table name** by prepending `project1.` (including the period) to the table name. This is required when working with the dataset, as shown in Part 4: Creating External Views.

Here is an overview of the public dataset. All table names and field names are case-insensitive:
### Public_User_Information

| Column               | Required | Description                                                                 |
|----------------------|----------|-----------------------------------------------------------------------------|
| user_id              | yes      | The unique Fakebook ID of a user                                            |
| first_name           | yes      | The user’s first name                                                       |
| last_name            | yes      | The user’s last name                                                        |
| year_of_birth        | yes      | The year in which the user was born                                         |
| month_of_birth       | yes      | The month (as an integer) in which the user was born                        |
| day_of_birth         | yes      | The day on which the user was born                                          |
| gender               | yes      | The user’s gender                                                           |
| current_city         | yes      | The user’s current city                                                     |
| current_state        | yes      | The user’s current state                                                    |
| current_country      | yes      | The user’s current country                                                  |
| hometown_city        | yes      | The user’s hometown city                                                   |
| hometown_state       | yes      | The user’s hometown state                                                  |
| hometown_country     | yes      | The user’s hometown country                                                |
| institution_name     | no       | The name of a college, university, or school that the user attended          |
| program_year         | no       | The year in which the user graduated from some college, university, or school|
| program_concentration| no       | The field in which the user studied at some college, university, or school  |
| program_degree       | no       | The degree the user earned from some college, university, or school         |

*Note:* If one of `institution_name`, `program_year`, `program_concentration`, or `program_degree` is provided, then all four columns will be provided. If none are provided, then all four columns will be empty.

---

### Public_Are_Friends

| Column    | Required | Description                                                      |
|-----------|----------|------------------------------------------------------------------|
| user1_id  | yes      | The ID of the first of two Fakebook users in a friendship         |
| user2_id  | yes      | The ID of the second of two Fakebook users in a friendship        |

---

### Public_Photo_Information

| Column                 | Required | Description                                                  |
|------------------------|----------|--------------------------------------------------------------|
| album_id               | yes      | The unique Fakebook ID of an album                           |
| owner_id               | yes      | The Fakebook ID of the user who owns the album               |
| cover_photo_id         | yes      | The Fakebook ID of the album’s cover photo                   |
| album_name             | yes      | The name of the album                                        |
| album_created_time     | yes      | The time at which the album was created                      |
| album_modified_time    | yes      | The time at which the album was last modified                |
| album_link             | yes      | The Fakebook URL of the album                                |
| album_visibility       | yes      | The visibility/privacy level for the album                   |
| photo_id               | yes      | The unique Fakebook ID of a photo in the album               |
| photo_caption          | yes      | The caption associated with the photo                        |
| photo_created_time     | yes      | The time at which the photo was created                       |
| photo_modified_time    | yes      | The time at which the photo was last modified                 |
| photo_link             | yes      | The Fakebook URL of the photo                                |

---

### Public_Tag_Information

| Column             | Required | Description                                                       |
|--------------------|----------|-------------------------------------------------------------------|
| photo_id           | yes      | The ID of a Fakebook photo                                        |
| tag_subject_id     | yes      | The ID of the Fakebook user being tagged in the photo             |
| tag_created_time   | yes      | The time at which the tag was created                             |
| tag_x_coordinate   | yes      | The x-coordinate of the location at which the subject was tagged |
| tag_y_coordinate   | yes      | The y-coordinate of the location at which the subject was tagged |

---

### Public_Event_Information

| Column               | Required | Description                                                       |
|----------------------|----------|-------------------------------------------------------------------|
| event_id             | yes      | The unique Fakebook ID of an event                                |
| event_creator_id     | yes      | The Fakebook ID of the user who created the event                 |
| event_name           | yes      | The name of the event                                             |
| event_tagline        | yes      | The tagline of the event                                          |
| event_description    | yes      | A description of the event                                        |
| event_host           | yes      | The host of the event, which does not need to identify a Fakebook user |
| event_type           | yes      | One of a predefined set of event types                            |
| event_subtype        | yes      | One of a predefined set of event subtypes based on the event’s type|
| event_address        | yes      | The street address at which the event is to be held               |
| event_city           | yes      | The city in which the event is to be held                         |
| event_state          | yes      | The state in which the event is to be held                        |
| event_country        | yes      | The country in which the event is to be held                      |
| event_start_time     | yes      | The time at which the event starts                                |
| event_end_time       | yes      | The time at which the event ends                                  |


## Part 4: Creating External Views

In the final part of Project 1, I am tasked with creating a set of external views to display the data that I have loaded into the data tables. The views must have the exact same schema as the public dataset, meaning the column names and data types must match precisely.

### Steps

I will write two SQL scripts for this part of the project:
1. **createViews.sql**: This script will create the views and load data into them.
2. **dropViews.sql**: This script will drop/destroy the views.

### Views to be Created

The five views I need to create are as follows:
1. **View_User_Information**: This view will display the public user information from the dataset.
2. **View_Are_Friends**: This view will display information about the friendships between users.
3. **View_Photo_Information**: This view will display information about photo albums and the associated photos.
4. **View_Event_Information**: This view will display details about events and their attributes.
5. **View_Tag_Information**: This view will display information about tags on photos.

### SQL Scripts

The following steps should allow me to execute the project sequentially without error:
```sql
1. SQL> @createTables
2. SQL> @loadData
3. SQL> @createViews
4. SQL> @dropViews
5. SQL> @dropTables
```

### Notes

- The views I create will use the exact schema from the public dataset to ensure compatibility with the dataset.
- I will need to be cautious when writing the `createViews.sql` and `dropViews.sql` files to ensure the commands execute smoothly in sequence.
- The goal is to be able to run the above commands multiple times without encountering errors.
