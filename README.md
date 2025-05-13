# Casino DBT Analytics

This is a personal study project focused on **Analytics Engineering** using **dbt (Data Build Tool)**. The project demonstrates the implementation of a data pipeline for a casino dataset, showcasing best practices in data modeling, transformation, and testing.

## Key Features

- **Data Modeling**: Organized into `source`, `trusted`, `staging` and `prod` layers for clear data lineage.
- **Transformations**: SQL-based transformations using dbt's powerful templating and macros.
- **Testing**: Built-in testing for data quality and integrity.
- **Snapshots**: Historical tracking of data changes.
- **Seeding**: Loading static data for reference purposes.
- **Analytics Engineering**: Focused on creating reusable, scalable, and maintainable data models.

## Project Structure **(pending)**

- **Models**: SQL files for data transformations.
  - `source`: Raw data ingestion.
  - `trusted`: Cleaned and validated data.
  - `staging`: Intermediate transformations.
  - `prod`: Business and reporting layer.
- **Snapshots**: Historical data tracking.
- **Seeds**: Static reference data.
- **Tests**: Automated data quality checks.
- **Macros**: Reusable SQL snippets.

## Tools and Technologies

- **dbt**: Core transformation tool.
- **PostgreSQL**: Target database for transformations.
- **Python**: Supporting scripts and environment setup.

## How to Run **(pending)**

1. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```
2. Set up the dbt profile in `~/.dbt/profiles.yml`.
3. Run dbt commands:
   - `dbt run`: Execute transformations.
   - `dbt test`: Run data quality tests.
   - `dbt snapshot`: Capture historical data.

## Learning Objectives

- Mastering **dbt** for data transformations.
- Understanding **analytics engineering** principles.
- Building scalable and maintainable data pipelines.
