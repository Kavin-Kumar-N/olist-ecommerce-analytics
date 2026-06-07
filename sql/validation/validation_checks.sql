SELECT COUNT(*) FROM clean_full_data;

-- Duplicate Orders Check
SELECT
    order_id,
    COUNT(*)
FROM clean_full_data
GROUP BY order_id
HAVING COUNT(*) > 1;