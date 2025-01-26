# NBA Shot Analyzer

This project analyzes NBA player and team shooting statistics from the 2019-2024 seasons.  It uses a MySQL database to store the data and provides a command-line interface for querying and analyzing the information.  Data is sourced from [DomSamangy](https://github.com/DomSamangy/NBA_Shots_04_24/blob/main/README.md).

## Features

* **Player Hot Zones:** Analyze a player's shooting efficiency across different court zones.
* **Player Shooting Trends:** Track a player's shooting performance over multiple seasons.
* **Team Best Shooters:** Identify the top 5 shooters on a team for a given season (players with more than 100 shots).

## Usage

The application provides a command-line menu to interact with the database.  After installation and database setup (see below), run the `nba_shot_analysis.py` script.  The menu will present options to query player hot zones, shooting trends, and team best shooters.  The program uses the `tabulate` library to display results in a user-friendly grid format.

## Installation

1. **Database Setup:**
    * Create a MySQL database named `shotanalysis`.  The `database.sql` file contains the SQL commands to create the necessary table (`data1`).
    * Import the data: Use the `data import.sql` script to import the NBA shot data into the `data1` table.  **Update the file path in `data import.sql` to reflect the actual location of your CSV file.**
    * Run the `cleaning.sql` script to clean and optimize the database.
2. **Python Dependencies:** Install the required Python libraries using pip:
   ```bash
   pip install mysql-connector-python tabulate
   ```
3. **Run the Script:** Execute the `nba_shot_analysis.py` script.  You will be prompted to enter database credentials.  **Make sure to update `nba_shot_analysis.py` with your MySQL username and password.**


## Technologies Used

* **MySQL:** Relational database management system for storing and managing the NBA shot data.
* **Python:** Programming language used to build the command-line interface and interact with the database.
* **mysql-connector-python:** Python library for connecting to and querying MySQL databases.
* **tabulate:** Python library for presenting tabular data in a visually appealing format.


## Statistical Analysis

The analysis utilizes basic SQL queries to calculate shooting statistics:

* **Total Shots:** `COUNT(*)`
* **Made Shots:** `SUM(shot_made)`
* **Accuracy Percentage:** `(SUM(shot_made) / COUNT(*)) * 100`

Stored procedures are used for more complex queries like identifying player hot zones and team best shooters. Data cleaning includes filtering out players with less than 100 shots.

## Configuration

The database credentials are configured in the `nba_shot_analysis.py` script.  Modify the `db_config` dictionary to reflect your MySQL setup.

```python
db_config = {
    'host': 'localhost',
    'user': 'your_username',
    'password': 'your_password',
    'database': 'shotanalysis'
}
```

## Dependencies

* `mysql-connector-python`
* `tabulate`

## Contributing

Contributions are welcome! Please open an issue or submit a pull request.

## Testing

No formal testing framework is implemented.  Testing should involve verifying the accuracy of the SQL queries and the functionality of the command-line interface.



*README.md was made with [Etchr](https://etchr.dev)*