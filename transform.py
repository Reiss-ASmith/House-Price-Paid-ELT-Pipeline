from db import get_connection
from load import run_sql_file  # reuse helper

def create_views():
    with get_connection() as conn:
        with conn.cursor() as cur:
            run_sql_file(cur, "03_transformation_views.sql")
        conn.commit()