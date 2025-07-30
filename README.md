# 🧠 Customer Behavior Analysis SQL Project

This project explores the **customer lifecycle** — from acquisition to churn — using SQL queries on a simulated e-commerce database. It includes structured analysis of customer registrations, conversions, retention, and churn behaviors.

---

## 📌 Project Objectives

Analyze and generate insights from customer behavior data:

- Customer acquisition and registration trends
- Conversion analysis (who purchases and when)
- Retention metrics (repeat purchases, gaps)
- Churn indicators
- Channel-wise and time-wise performance

---

## 📂 Dataset Overview

We simulate an online store with the following key tables:

### 1. `customers`
- Personal & registration details
- Foreign Key: `channel_id`
- Timestamps: `registration_date`, `first_order_date`, `last_order_date`

### 2. `orders`
- All orders placed by customers
- Foreign Key: `customer_id`

### 3. `order_items`
- Line items within each order
- Foreign Keys: `order_id`, `product_id`

### 4. `products`
- Products sold in the store
- Foreign Key: `category_id`

### 5. `categories`
- Product categories

### 6. `channels`
- How a customer found our site (e.g., Email, Social, Organic, Referral)

---

## 🔗 Table Relationships

- One-to-Many: Customers → Orders
- One-to-Many: Orders → Order Items
- One-to-Many: Categories → Products
- Many-to-One: Customers → Channels

---

## 📊 Analysis Questions Solved

| No. | Analysis Question |
|-----|--------------------|
| 1   | Customers registered in first 6 months of 2017 |
| 2   | Weekly registration count (current week) |
| 3   | Monthly registrations in 2017 |
| 4   | Registration count per month per year |
| 5   | Registrations per channel per year |
| 6   | 2017 customers: how many made a purchase |
| 7   | Lifetime conversion rate for 2017 |
| 8   | Conversion rate per channel |
| 9   | Conversion rate by month |
| 10  | Conversion rate by channel per week (2017) |
| 11  | Interval (days) between registration and first purchase |
| 12  | Average time to first order by channel |
| 13  | Avg time to order by quarter |
| 14  | Avg time to order by week/channel (2017) |
| 15  | Customers who stopped ordering after 3 months |

> All queries are available in the `project query.sql` file.

