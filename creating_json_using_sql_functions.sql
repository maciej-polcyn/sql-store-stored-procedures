USE sql_store;

UPDATE products
SET properties = JSON_OBJECT(
	'weight', 10,
    'dimensions', JSON_ARRAY(1, 2, 3),
    'manufacturer', JSON_OBJECT('name', 'Sony')
)
WHERE product_id = 2