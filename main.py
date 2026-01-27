from extract import (
    download_complete_data_to_disk,
    download_monthly_update
)
from load import (
    create_db_schema,
    copy_complete_data,
    copy_monthly_update_data,
    copy_map_data,
    load_from_raw
)
from transform import create_views
from reset import reset_database
import logging
from log import setup_logging

log = logging.getLogger(__name__)

def main():
    while True:
        decision = input(
            "Choose an option:\n"
            "1) Full pipeline (download full data + load + views)\n"
            "2) Monthly update pipeline\n"
            "3) Reset database\n"
            "q) Quit\n"
            "> "
        ).strip().lower()

        if decision == "1":
            complete_data_pipeline()
            break
        elif decision == "2":
            monthly_update_pipeline()
            break
        elif decision == "3":
            reset()
            break
        elif decision in {"q", "quit", "exit"}:
            print("Exiting.")
            break
        else:
            print("That is not a valid command.")


def complete_data_pipeline():
    log.info("Running FULL pipeline")
    create_db_schema()
    copy_map_data()
    download_complete_data_to_disk()
    copy_complete_data()
    load_from_raw()
    create_views()
    log.info("Full pipeline finished")

def monthly_update_pipeline():
    log.info("Running MONTHLY pipeline")
    create_db_schema()
    copy_map_data()
    download_monthly_update()
    copy_monthly_update_data()
    load_from_raw()
    create_views()
    log.info("MONTHLY pipeline finished")

def reset():
    log.info("Running RESET")
    reset_database()
    log.info("RESET finished")

if __name__ == "__main__":
    main()