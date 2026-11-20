-- =====================================================
-- Project: Trade Margin Analysis
-- Course: DataCamp - Intermediate SQL
-- Topic: Financial calculations using SQL
-- =====================================================

-- Exercise 1: Calculate trade margin

-- Version 1: Select all columns

SELECT *,
    quantity * sell_price
    - (fees + quantity * avg_buy_price) AS margin
FROM trades;


-- Version 2: Select specific columns

SELECT
    ticker,
    quantity,
    sell_price,
    fees,
    avg_buy_price,
    quantity * sell_price
    - (fees + quantity * avg_buy_price) AS margin
FROM trades;


-- Exercise 2: Calculate margin ratio using a CTE

WITH trade_margin AS (
    SELECT *,
        quantity * sell_price
        - (fees + quantity * avg_buy_price) AS margin
    FROM trades
)

SELECT *,
    SAFE_DIVIDE(
        100 * margin,
        quantity * avg_buy_price
    ) AS margin_ratio
FROM trade_margin;
