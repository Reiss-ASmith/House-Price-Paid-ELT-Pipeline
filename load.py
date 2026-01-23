import io
from db import get_connection

def run_sql_file(cursor, filename):
    with open(filename, "r", encoding="utf-8") as f:
        sql = f.read().strip()
        if sql:
            cursor.execute(sql)

def create_db_schema():
    with get_connection() as conn:
        with conn.cursor() as cursor:
            run_sql_file(cursor, "schema.sql")

