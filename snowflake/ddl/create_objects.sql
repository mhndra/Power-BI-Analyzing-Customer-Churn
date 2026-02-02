USE ROLE sysadmin;


/*
Create warehouse
*/

CREATE OR ALTER WAREHOUSE customer_churn_wh
    WAREHOUSE_TYPE = STANDARD
    WAREHOUSE_SIZE = XSMALL
    AUTO_RESUME = TRUE
    AUTO_SUSPEND = 60
;

SHOW WAREHOUSES LIKE 'customer_churn_wh';

USE WAREHOUSE customer_churn_wh;


/*
Create database
*/

CREATE DATABASE IF NOT EXISTS customer_churn_db;


/*
Create schema
*/

CREATE SCHEMA IF NOT EXISTS customer_churn_db.raw;

CREATE SCHEMA IF NOT EXISTS customer_churn_db.marts;


/*
Create stage
*/

-- Internal stage
CREATE OR ALTER STAGE customer_churn_db.raw.customer_churn_stage
    ENCRYPTION = (TYPE = 'SNOWFLAKE_SSE')
    DIRECTORY = (ENABLE = TRUE)
    FILE_FORMAT = (
        TYPE = CSV 
        SKIP_HEADER = 1
    )
;

DESCRIBE STAGE customer_churn_db.raw.customer_churn_stage;


/*
Create table
*/

-- Transient table
CREATE OR REPLACE TABLE customer_churn_db.marts.customer_churn_table (
    customer_id STRING,
    churned REAL,
    account_length_months REAL,
    local_calls REAL,
    local_mins REAL,
    intl_calls REAL,
    intl_mins REAL,
    intl_active STRING,
    intl_plan STRING,
    extra_international_charges REAL,
    customer_service_calls REAL,
    group_consumption STRING,
    unimited_data_plan STRING,
    extra_data_charge REAL,
    state STRING,
    phone_number STRING,
    gender STRING,
    age REAL,
    demographics STRING,
    part_group_contract STRING,
    number_of_customers_in_group REAL,
    device_protection_and_online_backup STRING,
    contract_category STRING,
    payment_method STRING,
    monthly_charge REAL,
    total_charges REAL,
    churn_category STRING,
    churn_reason STRING
);