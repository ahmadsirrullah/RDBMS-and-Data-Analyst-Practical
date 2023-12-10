# RDBMS and Data Analyst Practical
Welcome! Olist, a Brazilian e-commerce platform, employs a Relational Database Management System (RDBMS) to manage their data. This RDBMS enables in-depth data analysis, providing strategic insights into customer behavior, product performance, and market trends.

## About Project
This project contains details on creating an RDBMS from scratch with a CSV file that can be obtained from [**Brazilian E-Commerce Public Dataset by Olist**](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce?select=olist_products_dataset.csv). The next step involves analyzing the data and delivering a dashboard to provide a more concise insight into Olist e-commerce.

Here are some details that you will get.
1. Creating RDBMS in My SQL 8.2
   
  1.1 Creating Database
  1.2 Creating Table 
  1.3 Import data instantly from CSV file
  1.4 Make table relation

## About Dataset
Brazilian ecommerce public dataset of orders made at [Olist Store](http://www.olist.com/). The dataset has information of 100k orders from 2016 to 2018 made at multiple marketplaces in Brazil. Its features allows viewing an order from multiple dimensions: from order status, price, payment and freight performance to customer location, product attributes and finally reviews written by customers. It also released a geolocation dataset that relates Brazilian zip codes to lat/lng coordinates.

This is real commercial data, it has been anonymised, and references to the companies and partners in the review text have been replaced with the names of Game of Thrones great houses.

### **Context**
This dataset was generously provided by Olist, the largest department store in Brazilian marketplaces. Olist connects small businesses from all over Brazil to channels without hassle and with a single contract. Those merchants are able to sell their products through the Olist Store and ship them directly to the customers using Olist logistics partners. See more on our website: [www.olist.com](https://www.olist.com/)

After a customer purchases the product from Olist Store a seller gets notified to fulfill that order. Once the customer receives the product, or the estimated delivery date is due, the customer gets a satisfaction survey by email where he can give a note for the purchase experience and write down some comments.

### **Attention**

1. An order might have multiple items.
2. Each item might be fulfilled by a distinct seller.
3. All text identifying stores and partners where replaced by the names of Game of Thrones great houses.

### **Data Schema**

![Design DB of Olist](https://github.com/ahmadsirrullah/RDBMS-and-Data-Analyst-Practical/blob/main/olist_db_dessign.png)

![Detail Design DB Olist](https://github.com/ahmadsirrullah/RDBMS-and-Data-Analyst-Practical/blob/main/desigb_db_olist.png)
