# House Price Paid Data Pipeline

## Project Summary

This project is a PostgreSQL-based ELT data pipeline built using the UK House Price Paid dataset (1995 to present).
It was created to practise and demonstrate core junior data engineering skills, including data modelling, SQL transformations,
and working with containerised databases.

The pipeline ingests raw property transaction data, structures it into a relational schema, and exposes analytical views
that can be queried directly or used in BI tools such as Power BI.

---

## What This Project Demonstrates

- Building a data pipeline using PostgreSQL and SQL
- Loading raw data into a staging schema
- Designing a normalised data model with dimension and fact tables
- Using year-based partitioning for scalable time-series data
- Writing idempotent load logic using ON CONFLICT
- Creating reusable SQL views for analysis and reporting
- Running PostgreSQL in a Docker container for reproducibility

---

## Pipeline Overview

The pipeline follows an ELT (Extract, Load, Transform) pattern:

1. Extract  
   Raw CSV files are loaded into a staging schema called raw_house_data without modification.

2. Load  
   Data is inserted into cleaned and normalised tables in the house_data schema.

3. Transform  
   SQL views calculate analytical metrics such as median prices and transaction counts.

All transformations are performed inside PostgreSQL using SQL.

---

## Data Model

### Schemas

raw_house_data  
Contains raw, untransformed data exactly as it appears in the source CSV files.

house_data  
Contains the cleaned and structured warehouse tables, including:
- counties
- districts
- property types
- tenures
- a partitioned fact table for house sales

### Fact Table

house_data.house_price_paid
- Partitioned by year on the date column
- Composite primary key (sale_id, date) to support safe re-runs
- Designed for time-based and regional analysis

---

## Project Structure

.
00_schema.sql
01_extract.sql
02_load.sql
03_transformation_views.sql
99_reset.sql
docker-compose.yml
data/
  README.md
  local_authority_districts_map.csv
README.md

---

## How to Run the Pipeline

Requirements:
- Docker Desktop
- VS Code with the PostgreSQL extension
- House Price Paid CSV files placed in the data directory

Start PostgreSQL:
docker compose up -d

Run the SQL scripts in the following order using the VS Code PostgreSQL extension:

99_reset.sql (optional, development only)
00_schema.sql
01_extract.sql
02_load.sql
03_transformation_views.sql

---

## Analytics

The pipeline exposes SQL views that provide:
- median house prices by year
- median prices by district and county
- sale counts over time

These views are intended to be queried directly or used as a data source for BI tools.

---

## Design Notes

- The pipeline is designed to be re-runnable without duplicating data
- Partitioning is used to keep queries performant as the dataset grows
- Raw data is preserved separately from transformed data to maintain traceability
- Large CSV files are intentionally excluded from version control

---

## Future Improvements

- Python scripts to automatically download and incrementally load new House Price Paid data from the UK government website
- Basic data quality checks such as row counts, null checks, and duplicate detection
- Automated execution of pipeline steps
- Integration with a BI dashboard

---

## Author

Reiss Allen-Smith  
Computer Science Graduate | Aspiring Data Engineer
