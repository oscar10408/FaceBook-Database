CREATE OR REPLACE VIEW View_User_Information AS
SELECT 
    U.user_id, U.first_name, U.last_name, U.year_of_birth, U.month_of_birth, U.day_of_birth, U.gender, 
    C_curr.city_name AS current_city, C_curr.state_name AS current_state, C_curr.country_name AS current_country, 
    C_home.city_name AS hometown_city, C_home.state_name AS hometown_state, C_home.country_name AS hometown_country,
    P.institution AS institution_name, E.program_year, P.concentration AS program_concentration, P.degree AS program_degree
FROM 
    Users U 
    LEFT JOIN User_Current_Cities UC ON U.user_id = UC.user_id
    LEFT JOIN Cities C_curr ON UC.current_city_id = C_curr.city_id
    LEFT JOIN User_Hometown_Cities UH ON U.user_id = UH.user_id
    LEFT JOIN Cities C_home ON UH.hometown_city_id = C_home.city_id
    LEFT JOIN Education E ON U.user_id = E.user_id
    LEFT JOIN Programs P ON E.program_id = P.program_id;

CREATE VIEW View_Are_Friends AS
SELECT user1_id, user2_id FROM Friends;

CREATE VIEW View_Photo_Information AS
SELECT A.album_id, A.album_owner_id AS owner_id, A.cover_photo_id, A.album_name, A.album_created_time, A.album_modified_time, A.album_link, A.album_visibility,
P.photo_id, P.photo_caption, P.photo_created_time, P.photo_modified_time, P.photo_link
FROM Albums A, Photos P WHERE A.album_id = P.album_id;

CREATE VIEW View_Event_Information AS
SELECT UE.event_id, UE.event_creator_id, UE.event_name, UE.event_tagline, UE.event_description, UE.event_host, UE.event_type,
UE.event_subtype, UE.event_address, C.city_name AS event_city, C.state_name AS event_state, C.country_name AS event_country, UE.event_start_time, UE.event_end_time
FROM User_Events UE, Cities C WHERE UE.event_city_id = C.city_id;

CREATE VIEW View_Tag_Information AS
SELECT T.tag_photo_id AS photo_id, T.tag_subject_id, T.tag_created_time, T.tag_x AS tag_x_coordinate, T.tag_y AS cle
FROM Tags T;