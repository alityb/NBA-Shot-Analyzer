USE shotanalysis;
SET GLOBAL local_infile = 1;
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.4\\Uploads\\NBA_Shots_Parts_11.csv'
INTO TABLE data1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(season_1, season_2, team_id, team_name, player_id, player_name, 
position_group, position, @game_date, game_id, home_team, away_team, 
event_type, @shot_made, action_type, shot_type, basic_zone, zone_name, 
zone_abb, zone_range, loc_x, loc_y, shot_distance, quarter, mins_left, secs_left)
SET 
    game_date = STR_TO_DATE(@game_date, '%m-%d-%Y'),
    shot_made = IF(@shot_made = 'true', 1, 0);
SELECT COUNT(*) FROM data1;