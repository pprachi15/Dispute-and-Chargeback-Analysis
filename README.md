# Day 15: Dispute and Chargeback Intelligence Using SQL  
This project analyzes real dispute patterns to understand why chargebacks occur and where financial institutions face preventable losses.

This is part of my 30 Day Applied Business Strategy Challenge.

## Key Questions and Findings

### 1. Dispute rate by payment method
- Bank Transfer = 100%  
- Credit Card = 50%  
- Debit Card = 0%  

Bank Transfers were the most dispute prone in this dataset.

### 2. Average financial loss per dispute
The average disputed transaction amount was 531.66.  
Even a few disputes can create meaningful financial impact.

### 3. Days between transaction and dispute
Customers disputed roughly 7 days after the initial transaction.  
This lag matters for fraud monitoring and proactive communication.

### 4. Dispute rate by channel
- Mobile App = 75 percent  
- API = 50 percent  
- Web = 33.3 percent  
- Email = 0 percent  

Mobile App was the highest risk channel, signaling possible UX or trust issues.

### 5. Dispute rate by customer segment
- Starter = 66.7 percent  
- Pro = 50 percent  
- Enterprise = 50 percent  
- Growth = 33.3 percent  

Growth was the lowest risk segment while Starter created the most disputes.

Average transaction amounts:
- Starter = 41.1  
- Growth = 152.67  
- Pro = 595  
- Enterprise = 1030  

Enterprise disputes were infrequent but extremely expensive.

## Why This Matters
Dispute intelligence helps reduce preventable operational loss, improves customer trust, and strengthens payment operations. PMs use this data to improve payment flows, reduce friction, enhance communication, and design safer transaction experiences.

## Tools Used
SQL, simple CASE logic, date calculations, and aggregate functions.

