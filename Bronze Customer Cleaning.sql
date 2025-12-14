select
*
from bronze_olist_customers;

/* Check if there is any Duplicates in this Table*/
select
customer_id,
count(customer_id)
from bronze_olist_customers
group by customer_id
having count(customer_id) > 1;

/* Check if there is any Null Values in this Table*/
select
sum(case when customer_id is null then 1 else 0 end) as customer_id_null,
sum(case when customer_unique_id is null then 1 else 0 end) as customer_unique_id_null
from bronze_olist_customers;

/* Creates a clone for this bronze layer table as there is no duplicates nor Null Values */
CREATE TABLE Silver_olist_customers AS
SELECT * FROM bronze_olist_customers;