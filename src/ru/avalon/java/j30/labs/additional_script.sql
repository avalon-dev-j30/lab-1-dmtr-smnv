SELECT
purchase_order.CUSTOMER_ID AS "Customer ID",
customer."NAME" AS "Customer name",
SUM(((product.PURCHASE_COST + product.MARKUP) * purchase_order.QUANTITY) + purchase_order.SHIPPING_COST) AS "All expences"
FROM purchase_order
    JOIN product ON purchase_order.PRODUCT_ID = product.PRODUCT_ID
    JOIN customer ON purchase_order.CUSTOMER_ID = customer.CUSTOMER_ID
GROUP BY purchase_order.CUSTOMER_ID, customer."NAME";