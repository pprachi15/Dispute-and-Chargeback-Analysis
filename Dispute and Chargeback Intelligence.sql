{\rtf1\ansi\ansicpg1252\cocoartf2867
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 ArialMT;}
{\colortbl;\red255\green255\blue255;\red0\green0\blue0;\red187\green196\blue196;}
{\*\expandedcolortbl;;\cssrgb\c0\c0\c0;\cssrgb\c78039\c81176\c81176;}
\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\partightenfactor0

\f0\fs26 \cf2 \expnd0\expndtw0\kerning0
DROP TABLE IF EXISTS transactions;\
DROP TABLE IF EXISTS customers;\
DROP TABLE IF EXISTS payments;\
DROP TABLE IF EXISTS disputes;\
\
CREATE TABLE transactions (\
    transaction_id INTEGER,\
    customer_id INTEGER,\
    amount DECIMAL(10,2),\
    payment_method VARCHAR(50),\
    channel VARCHAR(50),\
    segment VARCHAR(50),\
    dispute_flag VARCHAR(5),\
    dispute_reason VARCHAR(100),\
    transaction_date DATE,\
    dispute_date DATE\
);\
\
INSERT INTO transactions VALUES\
(1, 101, 48.20, 'Credit Card', 'Mobile App', 'Starter', 'Yes', 'Duplicate charge', '2024-11-01', '2024-11-05'),\
(2, 102, 260.00, 'Debit Card', 'Web', 'Growth', 'No', NULL, '2024-11-02', NULL),\
(3, 103, 980.00, 'Bank Transfer', 'Web', 'Pro', 'No', NULL, '2024-11-02', NULL),\
(4, 104, 32.10, 'Credit Card', 'Mobile App', 'Starter', 'No', NULL, '2024-11-04', NULL),\
(5, 105, 120.00, 'Credit Card', 'Email', 'Growth', 'Yes', 'Service not received', '2024-11-05', '2024-11-10'),\
(6, 106, 43.00, 'Debit Card', 'Mobile App', 'Starter', 'No', NULL, '2024-11-06', NULL),\
(7, 107, 1520.00, 'Credit Card', 'API', 'Enterprise', 'Yes', 'Unauthorized transaction', '2024-11-07', '2024-11-15'),\
(8, 108, 210.00, 'Credit Card', 'Web', 'Pro', 'No', NULL, '2024-11-08', NULL),\
(9, 109, 78.00, 'Bank Transfer', 'Mobile App', 'Growth', 'No', NULL, '2024-11-08', NULL),\
(10, 110, 540.00, 'Debit Card', 'API', 'Enterprise', 'No', NULL, '2024-11-09', NULL),\
(11, 111, 312.00, 'Credit Card', 'Mobile App', 'Pro', 'Yes', 'Product mismatch', '2024-11-10', '2024-11-14'),\
(12, 112, 87.50, 'Debit Card', 'Web', 'Starter', 'Yes', 'Fraud suspected', '2024-11-10', '2024-11-11'),\
(13, 113, 199.00, 'Bank Transfer', 'Email', 'Growth', 'No', NULL, '2024-11-11', NULL),\
(14, 114, 75.00, 'Credit Card', 'Mobile App', 'Growth', 'No', NULL, '2024-11-11', NULL),\
(15, 115, 420.00, 'Credit Card', 'API', 'Enterprise', 'No', NULL, '2024-11-11', NULL),\
(16, 116, 65.00, 'Debit Card', 'Email', 'Starter', 'No', NULL, '2024-11-12', NULL),\
(17, 117, 1180.00, 'Bank Transfer', 'API', 'Enterprise', 'Yes', 'Unauthorized transaction', '2024-11-12', '2024-11-20'),\
(18, 118, 125.00, 'Credit Card', 'Web', 'Starter', 'No', NULL, '2024-11-13', NULL),\
(19, 119, 350.00, 'Debit Card', 'Mobile App', 'Growth', 'No', NULL, '2024-11-13', NULL),\
(20, 120, 720.00, 'Credit Card', 'API', 'Pro', 'Yes', 'Fraud suspected', '2024-11-14', '2024-11-17'),\
(21, 121, 93.00, 'Debit Card', 'Email', 'Starter', 'No', NULL, '2024-11-14', NULL),\
(22, 122, 160.00, 'Bank Transfer', 'Web', 'Growth', 'No', NULL, '2024-11-15', NULL),\
(23, 123, 860.50, 'Credit Card', 'Web', 'Pro', 'No', NULL, '2024-11-15', NULL),\
(24, 124, 55.00, 'Debit Card', 'Mobile App', 'Starter', 'Yes', 'Duplicate charge', '2024-11-15', '2024-11-18'),\
(25, 125, 1400.00, 'Bank Transfer', 'API', 'Enterprise', 'No', NULL, '2024-11-16', NULL),\
(26, 126, 205.00, 'Credit Card', 'Email', 'Growth', 'No', NULL, '2024-11-16', NULL),\
(27, 127, 52.00, 'Credit Card', 'Mobile App', 'Starter', 'No', NULL, '2024-11-17', NULL),\
(28, 128, 315.00, 'Credit Card', 'API', 'Pro', 'No', NULL, '2024-11-17', NULL),\
(29, 129, 110.00, 'Debit Card', 'Web', 'Growth', 'No', NULL, '2024-11-18', NULL),\
(30, 130, 790.00, 'Credit Card', 'Mobile App', 'Enterprise', 'Yes', 'Fraud suspected', '2024-11-18', '2024-11-25');\
\
\
-- What is the dispute rate by payment method?\
SELECT \
    payment_method,\
    AVG(CASE WHEN dispute_flag = 'Yes' THEN 1 ELSE 0 END) AS dispute_rate\
FROM transactions\
GROUP BY payment_method\
ORDER BY dispute_rate DESC;\
\
-- What is the average dollar loss when a dispute occurs\
\
SELECT \
    AVG(amount) AS avg_dispute_amount\
FROM transactions\
WHERE dispute_flag = 'Yes';\
\
-- How long does it take for customers to file a dispute\
\
SELECT \
    AVG(DATE(transaction_date - dispute_date)) AS avg_days_to_dispute\
FROM transactions\
WHERE dispute_flag = 'Yes';\
\
--Which channels create the most disputes\
\
SELECT \
    channel,\
    AVG(CASE WHEN dispute_flag = 'Yes' THEN 1 ELSE 0 END) AS dispute_rate\
FROM transactions\
GROUP BY channel\
ORDER BY dispute_rate DESC;\
\
--Which customer segment is most likely to dispute\
\
SELECT \
    segment,\
    AVG(CASE WHEN dispute_flag = 'Yes' THEN 1 ELSE 0 END) AS dispute_rate,\
    AVG(amount) AS avg_transaction_amount\
FROM transactions\
GROUP BY segment\
ORDER BY dispute_rate DESC;\
}