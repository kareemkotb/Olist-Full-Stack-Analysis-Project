select
*
from bronze_olist_orders;

/**create silver Layer**/
create table silver_olist_orders as
from bronze_olist_orders;

select
*
from silver_olist_orders;

/* Check if order_status has any nulls*/
select
*
from silver_olist_orders
where order_status is nul;

/*to check how many deliveries are still pending*/
select
*
from silver_olist_orders
where order_delivered_customer_date is null;

/*check how many deliveries didnt ship yet*/
select
*
from silver_olist_orders
where order_delivered_carrier_date is null;



/* check how many products are waiting approval*/
select
*
from silver_olist_orders
where order_approved_at is null;
