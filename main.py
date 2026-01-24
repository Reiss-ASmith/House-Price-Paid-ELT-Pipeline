from extract import download_complete_data_to_disk
from load import (
    create_db_schema,
    copy_complete_data,
    copy_map_data,
    load_from_raw
)

from transform import create_views

def main():
    create_db_schema()
    copy_map_data()
    copy_complete_data()
    load_from_raw()
    create_views()

if __name__ == "__main__":
    main()