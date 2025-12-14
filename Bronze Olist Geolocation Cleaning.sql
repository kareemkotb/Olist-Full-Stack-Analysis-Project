select
*
from bronze_olist_geolocation;
/* Shows all the Cities*/
select
distinct(geolocation_city)
from bronze_olist_geolocation
order by geolocation_city;

/* Create new Silver Table*/
create table silver_olist_geolocation as
from bronze_olist_geolocation;

/* After Upadting the table from python Notebook*/
select 
*
from silver_olist_geolocation;

/*Remove the old Geolocation_city Column*/
ALTER TABLE olist.default.silver_olist_geolocation
DROP COLUMN geolocation_city;

