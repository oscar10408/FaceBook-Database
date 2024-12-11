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

## Team Requirement

The project was completed in a **team of 2 students**. We worked together to design and implement the solution. Both team members received the same score based on the highest submission.

## Submission Deadline

The project was due on **September 24th at 11:45 PM EST**.

## Honor Code

I adhered to the Honor Code by not sharing answers with others and working independently with my teammate. I consulted publicly available resources and Piazza for clarification, but did not seek unauthorized aid.

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

## Team Instructions

1. Created the team on the Autograder before submitting.
2. Followed project guidelines and adhered to the Honor Code.
3. Focused on designing a clean, accurate ER diagram and implementing it effectively with SQL scripts.
