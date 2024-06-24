CREATE DATABASE IF NOT EXISTS shotanalysis;

USE shotanalysis;

CREATE TABLE IF NOT EXISTS data1 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    season_1 INT,
    season_2 INT,
    team_id INT,
    team_name VARCHAR(50),
    player_id INT,
    player_name VARCHAR(100),
    position_group VARCHAR(20),
    position VARCHAR(20),
    game_date DATE,
    game_id VARCHAR(20),
    home_team VARCHAR(50),
    away_team VARCHAR(50),
    event_type VARCHAR(50),
    shot_made BOOLEAN,
    action_type VARCHAR(50),
    shot_type VARCHAR(50),
    basic_zone VARCHAR(50),
    zone_name VARCHAR(50),
    zone_abb VARCHAR(10),
    zone_range VARCHAR(50),
    loc_x FLOAT,
    loc_y FLOAT,
    shot_distance FLOAT,
    quarter INT,
    mins_left INT,
    secs_left INT
);
CREATE INDEX idx_player_id ON data1(player_id);
CREATE INDEX idx_team_id ON data1(team_id);
CREATE INDEX idx_game_date ON data1(game_date);
CREATE INDEX idx_shot_made ON data1(shot_made);

