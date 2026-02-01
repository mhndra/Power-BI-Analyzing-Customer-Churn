USE ROLE sysadmin;

USE WAREHOUSE customer_churn_wh;

USE SCHEMA customer_churn_db.raw;


/*
Ingest data using COPY INTO <table>
*/

LIST @customer_churn_stage;

COPY INTO customer_churn_raw
FROM @customer_churn_stage;

SELECT * 
FROM customer_churn_raw 
LIMIT 5;