import mysql.connector
from typing import List, Dict, Any, cast


# ==========================================
# Database Configuration
# ==========================================
DB_CONFIG = {
    "host": "localhost",
    "user": "root",
    "password": "admin@123",
    "database": "coaching_centre",
}


# ==========================================
# Get Connection
# ==========================================
def get_connection():
    return mysql.connector.connect(**DB_CONFIG)


# ==========================================
# Fetch Rows
# ==========================================
def fetch(query, params=None) -> List[Dict[str, Any]]:
    connection = get_connection()
    cursor = connection.cursor(dictionary=True)
    if params is None:
        cursor.execute(query)
    else:
        cursor.execute(query, params)
    rows = cast(List[Dict[str, Any]], cursor.fetchall())
    cursor.close()
    connection.close()
    return rows


# ==========================================
# Execute Query
# ==========================================
def execute_query(query, params=None):
    connection = get_connection()
    cursor = connection.cursor()
    if params is None:
        cursor.execute(query)
    else:
        cursor.execute(query, params)
    connection.commit()
    cursor.close()
    connection.close()