# Day 15: Dispute and Chargeback Intelligence Using SQL  
This project explores dispute and chargeback behavior using SQL to understand where financial institutions face preventable losses and how payment flows influence customer trust.

This work is part of my 30 Day Applied Business Strategy Challenge.

## Key Questions and Findings

### 1. Which payment methods have the highest dispute rate
- Credit Card = 40%  
- Debit Card = 22.2%  
- Bank Transfer = 16.7%  

Credit Card had the highest dispute rate, which matches real payment behavior where card transactions face more revocations than ACH or Debit.

### 2. What is the average disputed amount
The average disputed transaction amount was 536.97.  
Enterprise and Pro disputes were rare but significantly higher in dollar value.

### 3. How long does it take for customers to file a dispute
Customers disputed roughly 7 days after the original transaction.  
This aligns with typical review windows seen in real financial institutions.

### 4. Which channels have the highest dispute rate
- API = 42.86%  
- Mobile App = 40%  
- Email = 20%  
- Web = 12.5%  

API and Mobile App surfaced as high risk channels, likely due to unclear confirmations or integration variability.

### 5. Which segments dispute most frequently
- Enterprise = 50%  
- Starter = 33.3%  
- Pro = 33.3%  
- Growth = 11.1%  

Enterprise disputes were fewer but expensive. Growth disputes were the lowest.

### Average transaction amounts by segment
- Enterprise = 975  
- Pro = 566.25  
- Growth = 173  
- Starter = 66.76  

## Insights

- High value disputes create larger losses even when frequency is low.  
- API and mobile transactions carry higher dispute risk and may require UX or security adjustments.  
- Starter and Enterprise customer groups dispute for different reasons and should be handled with distinct communication strategies.  
- Dispute timing confirms that proactive detection within the first week could meaningfully reduce loss.  

## Why This Matters
Disputes affect revenue, trust, and operational cost. Understanding patterns by payment method, channel, and customer segment helps PMs and analysts design better payment flows, improve communication, tighten verification, and support early fraud detection.

## Tools Used
SQL, aggregate functions, case expressions, julian day date calculations.

