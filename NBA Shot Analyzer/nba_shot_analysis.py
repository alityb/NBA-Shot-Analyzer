import mysql.connector
from tabulate import tabulate

db_config = {
    'host': 'localhost',
    'user': 'your_username',
    'password': 'your_password',
    'database': 'shotanalysis'
}

def create_connection():
    try:
        connection = mysql.connector.connect(**db_config)
        return connection
    except mysql.connector.Error as err:
        print(f"Error connecting to the database: {err}")
        return None

def execute_query(connection, query, params=None):
    try:
        if not connection.is_connected():
            connection.reconnect()
        
        cursor = connection.cursor(dictionary=True)
        if params:
            cursor.execute(query, params)
        else:
            cursor.execute(query)
        results = cursor.fetchall()
        cursor.close()
        return results
    except mysql.connector.Error as err:
        print(f"Error executing query: {err}")
        return None

def get_player_hot_zones(connection):
    player_name = input("Enter player name: ")
    season = input("Enter season year: ")
    query = "CALL GetPlayerHotZones(%s, %s)"
    params = (player_name, season)
    results = execute_query(connection, query, params)
    if results:
        print(tabulate(results, headers="keys", tablefmt="grid"))
    else:
        print("No data found or an error occurred.")

def get_player_shooting_trend(connection):
    player_name = input("Enter player name: ")
    query = "CALL PlayerShootingTrend(%s)"
    params = (player_name,)
    results = execute_query(connection, query, params)
    if results:
        print(tabulate(results, headers="keys", tablefmt="grid"))
    else:
        print("No data found or an error occurred.")

def get_team_best_shooters(connection):
    team_name = input("Enter team name: ")
    season = input("Enter season year: ")
    query = "CALL TeamBestShooters(%s, %s)"
    params = (team_name, season)
    results = execute_query(connection, query, params)
    if results:
        print(tabulate(results, headers="keys", tablefmt="grid"))
    else:
        print("No data found or an error occurred.")

def main_menu(connection):
    while True:
        print("\nNBA Shot Analysis System")
        print("1. Get Player Hot Zones")
        print("2. Get Player Shooting Trend")
        print("3. Get Team's Best Shooters")
        print("4. Exit")
        
        choice = input("Enter your choice (1-4): ")
        
        if choice == '1':
            get_player_hot_zones(connection)
        elif choice == '2':
            get_player_shooting_trend(connection)
        elif choice == '3':
            get_team_best_shooters(connection)
        elif choice == '4':
            print("Exiting the program. Goodbye!")
            break
        else:
            print("Invalid choice. Please try again.")

if __name__ == "__main__":
    connection = create_connection()
    if connection:
        try:
            main_menu(connection)
        finally:
            connection.close()
    else:
        print("Failed to connect to the database. Exiting.")