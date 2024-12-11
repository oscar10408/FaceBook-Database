INSERT INTO Users (user_id, first_name, last_name, year_of_birth, month_of_birth, day_of_birth, gender)
SELECT DISTINCT user_id, first_name, last_name, year_of_birth, month_of_birth, day_of_birth, gender
FROM project1.Public_User_Information;

/* Check if there is already the same pair in the table*/
INSERT INTO Friends (user1_id, user2_id)
SELECT user1_id, user2_id
FROM project1.Public_Are_Friends
WHERE NOT EXISTS (
    SELECT 1 
    FROM project1.Public_Are_Friends PF
    WHERE user1_id = PF.user2_id AND user2_id = PF.user1_id);

INSERT INTO Cities (city_name, state_name, country_name)
SELECT DISTINCT current_city, current_state, current_country
FROM project1.Public_User_Information;

INSERT INTO Cities (city_name, state_name, country_name)
(SELECT DISTINCT hometown_city, hometown_state, hometown_country FROM project1.Public_User_Information)
MINUS
(SELECT DISTINCT current_city, current_state, current_country FROM project1.Public_User_Information);

INSERT INTO User_Current_Cities (user_id, current_city_id)
SELECT DISTINCT U.user_id, C.city_id
FROM project1.Public_User_Information PU
JOIN Users U ON U.user_id = PU.user_id
JOIN Cities C ON C.city_name = PU.current_city AND C.state_name = PU.current_state AND C.country_name = PU.current_country;

INSERT INTO User_Hometown_Cities (user_id, hometown_city_id)
SELECT DISTINCT U.user_id, C.city_id
FROM project1.Public_User_Information PU
JOIN Users U ON U.user_id = PU.user_id
JOIN Cities C ON C.city_name = PU.hometown_city AND C.state_name = PU.hometown_state AND C.country_name = PU.hometown_country;

INSERT INTO Programs (institution, concentration, degree)
SELECT DISTINCT institution_name, program_concentration, program_degree
FROM project1.Public_User_Information
WHERE institution_name IS NOT NULL;

INSERT INTO Education (user_id, program_id, program_year)
SELECT U.user_id, P.program_id, PU.program_year
FROM project1.Public_User_Information PU
JOIN Users U ON U.user_id = PU.user_id
JOIN Programs P ON P.institution = PU.institution_name AND P.concentration = PU.program_concentration AND P.degree = PU.program_degree;

INSERT INTO User_Events (event_id, event_creator_id, event_name, event_tagline, event_description, event_host, event_type, event_subtype, event_address, event_city_id, event_start_time, event_end_time)
SELECT PE.event_id, U.user_id, PE.event_name, PE.event_tagline, PE.event_description, PE.event_host, PE.event_type, PE.event_subtype, PE.event_address, C.city_id, PE.event_start_time, PE.event_end_time
FROM project1.Public_Event_Information PE
JOIN Users U ON PE.event_creator_id = U.user_id
JOIN Cities C ON C.city_name = PE.event_city AND C.state_name = PE.event_state AND C.country_name = PE.event_country;

/* Manually commit the following two inserts*/
SET AUTOCOMMIT OFF;

INSERT INTO Albums (album_id, album_owner_id, album_name, album_created_time, album_modified_time, album_link, album_visibility, cover_photo_id)
SELECT DISTINCT album_id, owner_id, album_name, album_created_time, album_modified_time, album_link, album_visibility, cover_photo_id
FROM project1.Public_Photo_Information;

INSERT INTO Photos (photo_id, album_id, photo_caption, photo_created_time, photo_modified_time, photo_link)
SELECT photo_id, album_id, photo_caption, photo_created_time, photo_modified_time, photo_link
FROM project1.Public_Photo_Information;

COMMIT;

SET AUTOCOMMIT ON;

INSERT INTO Tags (tag_photo_id, tag_subject_id, tag_created_time, tag_x, tag_y)
SELECT photo_id, tag_subject_id, tag_created_time, tag_x_coordinate, tag_y_coordinate
FROM project1.Public_Tag_Information;