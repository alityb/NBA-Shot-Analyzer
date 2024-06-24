DELIMITER //

CREATE PROCEDURE GetPlayerHotZones(IN p_player_name VARCHAR(100), IN p_season INT)
BEGIN
    SELECT zone_name, 
           COUNT(*) as total_shots,
           SUM(shot_made) as made_shots,
           (SUM(shot_made) / COUNT(*)) * 100 as accuracy_percentage
    FROM data1
    WHERE player_name = p_player_name AND season_1 = p_season
    GROUP BY zone_name
    ORDER BY accuracy_percentage DESC;
END //

DELIMITER ;

CALL GetPlayerHotZones('LeBron James', 2023);

DELIMITER //

DROP PROCEDURE PlayerShootingTrend;

CREATE PROCEDURE PlayerShootingTrend(IN p_player_name VARCHAR(100))
BEGIN
    SELECT season_2, 
           COUNT(*) as total_shots,
           SUM(shot_made) as made_shots,
           (SUM(shot_made) / COUNT(*)) * 100 as accuracy_percentage
    FROM data1
    WHERE player_name = p_player_name
    GROUP BY season_2
    ORDER BY season_2;
END //

DELIMITER ;

CALL PlayerShootingTrend('Stephen Curry');

DELIMITER //
DROP PROCEDURE TeamBestShooters;

CREATE PROCEDURE TeamBestShooters(IN p_team_name VARCHAR(50), IN p_season INT)
BEGIN
    SELECT player_name, 
           COUNT(*) as total_shots,
           SUM(shot_made) as made_shots,
           (SUM(shot_made) / COUNT(*)) * 100 as accuracy_percentage
    FROM data1
    WHERE team_name = p_team_name AND season_2 = p_season
    GROUP BY player_name
    HAVING total_shots > 100
    ORDER BY accuracy_percentage DESC
    LIMIT 5;
END //

DELIMITER ;

CALL TeamBestShooters('Los Angeles Lakers', 2023);