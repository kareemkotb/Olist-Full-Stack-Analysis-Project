select
*
from bronze_olist_order_items;

/* Create a Silver table to edit*/
create table silver_olist_order_items as
from bronze_olist_order_items;

select
*
from silver_olist_order_items;

/* Remove all the orders which have a freight_value of 0*/
delete
from silver_olist_order_items
where freight_value = 0;

/* check if all freight_value rows = 0 got deleted */
select
*
from silver_olist_order_items
where freight_value = 0;

/*Check if there is null or invalid dates*/
SELECT
  COUNT(*) AS total_rows,
  COUNT(*) FILTER (WHERE shipping_limit_date IS NULL) AS null_dates,
  COUNT(*) FILTER (WHERE CAST(shipping_limit_date AS STRING) = '' OR shipping_limit_date = '1970-01-01' OR shipping_limit_date = '1900-01-01') AS suspicious_dates
FROM
  silver_olist_order_items;