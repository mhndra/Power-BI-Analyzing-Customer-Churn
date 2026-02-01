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
CREATE OR REPLACE TRANSIENT TABLE customer_churn_db.raw.customer_churn_raw (
  customer_id TEXT,
  churn_label TEXT,
  account_length_months NUMBER,
  local_calls NUMBER,
  local_mins NUMBER(38, 2),
  intl_calls NUMBER,
  intl_mins NUMBER(38, 2),
  intl_active TEXT,
  intl_plan TEXT,
  extra_international_charges NUMBER,
  customer_service_calls NUMBER,
  avg_monthly_gb_download NUMBER,
  unimited_data_plan TEXT,
  extra_data_charge NUMBER,
  state TEXT,
  phone_number TEXT,
  gender TEXT,
  age NUMBER,
  under_30 TEXT,
  senior TEXT,
  "group" TEXT,
  number_of_customers_in_group NUMBER,
  device_protection_and_online_backup TEXT,
  contract_type TEXT,
  payment_method TEXT,
  monthly_charge NUMBER,
  total_charges NUMBER,
  churn_category TEXT,
  churn_reason TEXT
);