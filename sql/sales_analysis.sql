-- KPI globaux
SELECT
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders
FROM orders;

-- Ventes et bénéfices par catégorie
SELECT
    category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    SUM(quantity) AS units_sold
FROM orders
GROUP BY category
ORDER BY total_sales DESC;

-- Ventes mensuelles
SELECT
    strftime('%Y-%m', order_date) AS month,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM orders
WHERE order_date IS NOT NULL
GROUP BY strftime('%Y-%m', order_date)
ORDER BY month;

-- Les 10 sous-catégories les plus rentables
SELECT
    sub_category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM orders
GROUP BY sub_category
ORDER BY total_profit DESC
LIMIT 10;


