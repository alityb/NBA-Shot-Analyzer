SELECT player_name, 
       COUNT(*) as total_shots,
       SUM(shot_made) as made_shots,
       (SUM(shot_made) / COUNT(*)) * 100 as accuracy_percentage
FROM data1
GROUP BY player_id, player_name
ORDER BY accuracy_percentage DESC;

SELECT season_1, team_name, 
       COUNT(*) as total_shots,
       SUM(shot_made) as made_shots,
       (SUM(shot_made) / COUNT(*)) * 100 as accuracy_percentage
FROM data1
GROUP BY season_1, team_id, team_name
ORDER BY season_1, accuracy_percentage DESC;