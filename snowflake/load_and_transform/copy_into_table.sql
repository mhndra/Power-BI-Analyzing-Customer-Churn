USE ROLE sysadmin;

USE WAREHOUSE customer_churn_wh;

USE SCHEMA customer_churn_db.marts;


/*
Load and transform data using COPY INTO <table>
*/

LIST @customer_churn_stage;

COPY INTO customer_churn_table
FROM (
  SELECT
    $1,
    IFF($2 = 'Yes', 1, 0),
    $3,
    $4,
    $5,
    $6,
    $7,
    $8,
    $9,
    $10,
    $11,
    CASE 
      WHEN $12 < 5 THEN 'Less than 5 GB'
      WHEN $12 < 10 THEN 'Between 5 and 10 GB'
      ELSE '10 or more GB'
    END,
    $13,
    $14,
    $15,
    $16,
    $17,
    $18,
    CASE
      WHEN $19 = 'Yes' THEN 'Under 30'
      WHEN $20 = 'Yes' THEN 'Senior'
      ELSE 'Other'
    END,
    $21,
    $22,
    $23,
    CASE
      WHEN $24 = 'One Year' THEN 'Yearly'
      WHEN $24 = 'Two Year' THEN 'Yearly'
      ELSE 'Monthly'
    END,
    $25,
    $26,
    $27,
    $28,
    $29
  FROM @customer_churn_db.raw.customer_churn_stage
);

SELECT COUNT(*)
FROM customer_churn_table;

SELECT * 
FROM customer_churn_table 
LIMIT 5;

