
CREATE TABLE olist.default.silver_olist_product 
AS
WITH cleaned_products AS (
  SELECT 
    product_id,
    -- Handle category: keep nulls or impute with 'unknown'
    COALESCE(product_category_name, 'unknown') AS product_category_name_clean,
    -- Validate lengths (non-negative)
    GREATEST(product_name_lenght, 0) AS product_name_length_clean,
    GREATEST(product_description_lenght, 0) AS product_description_length_clean,
    -- Cap photos qty at reasonable max (e.g., 10)
    LEAST(GREATEST(product_photos_qty, 0), 10) AS product_photos_qty_clean,
    -- Clean numerics: replace negatives/zeros with NULL or median
    CASE 
      WHEN product_weight_g > 0 THEN product_weight_g 
      ELSE NULL 
    END AS product_weight_g_clean,
    -- Similar logic for dimensions
    CASE WHEN product_length_cm BETWEEN 1 AND 500 THEN product_length_cm ELSE NULL END AS product_length_cm_clean,
    CASE WHEN product_height_cm BETWEEN 1 AND 500 THEN product_height_cm ELSE NULL END AS product_height_cm_clean,
    CASE WHEN product_width_cm BETWEEN 1 AND 500 THEN product_width_cm ELSE NULL END AS product_width_cm_clean
  FROM bronze_olist_products
  WHERE product_id IS NOT NULL  -- Remove invalid IDs
)

SELECT * FROM cleaned_products;

select
*
from silver_olist_product
