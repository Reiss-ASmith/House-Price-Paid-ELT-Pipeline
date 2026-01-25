from load import run_sql_file
from db import get_connection

def reset_database():
    with get_connection() as conn:
        with conn.cursor as cur:
            run_sql_file(cur, "99_reset.sql")