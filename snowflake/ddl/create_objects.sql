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
CREATE OR REPLACE STAGE customer_churn_db.raw.customer_churn_stage
  ENCRYPTION = (TYPE = 'SNOWFLAKE_SSE')
  DIRECTORY = (ENABLE = TRUE)
  FILE_FORMAT = (TYPE = CSV)
;