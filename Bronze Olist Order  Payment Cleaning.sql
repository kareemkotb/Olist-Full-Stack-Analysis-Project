select
*
from bronze_olist_order_payments;

/* Everything is clean so just make the silver table*/
create table silver_olist_order_payments as
from bronze_olist_order_payments;

ALTER TABLE silver_olist_ordder_payments
RENAME TO silver_olist_order_payments;
