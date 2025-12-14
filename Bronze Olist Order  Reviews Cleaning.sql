select
*
from bronze_olist_order_reviews;

/* create a silver table*/
create table silver_olist_order_reviews as
from bronze_olist_order_reviews;

select
*
from silver_olist_order_reviews;

DELETE FROM silver_olist_order_reviews
WHERE review_score is NULL;
