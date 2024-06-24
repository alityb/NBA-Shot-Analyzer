USE shotanalysis;

CREATE TEMPORARY TABLE players_with_enough_shots AS
SELECT player_id, player_name
FROM data1
GROUP BY player_id, player_name
HAVING COUNT(*) >= 100;

DELETE FROM data1
WHERE player_id NOT IN (SELECT player_id FROM players_with_enough_shots);
OPTIMIZE TABLE data1;

DROP TEMPORARY TABLE IF EXISTS players_with_enough_shots;

SELECT COUNT(DISTINCT player_id) AS remaining_players,
       COUNT(*) AS remaining_shots
FROM data1;
