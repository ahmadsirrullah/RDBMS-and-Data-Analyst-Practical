# RDBMS and Data Analyst Practical
Welcome! Olist, a Brazilian e-commerce platform, employs a Relational Database Management System (RDBMS) to manage their data. This RDBMS enables in-depth data analysis, providing strategic insights into customer behavior, product performance, and market trends. [*ongoing project*]

## About Project
This project contains details on creating an RDBMS from scratch with a CSV file that can be obtained from [**Brazilian E-Commerce Public Dataset by Olist**](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce?select=olist_products_dataset.csv). The next step involves analyzing the data and delivering a dashboard to provide a more concise insight into Olist e-commerce.

Here are some details that you will get.
1. Creating RDBMS in MySQL 8.2
   - Creating Database
   - Creating Table
   - Import data instantly from CSV file
   - Make table relation
2. Exploratory and Explanatory Data Analysis in python
3. Delivering Dashboard

## About Dataset
Brazilian ecommerce public dataset of orders made at [Olist Store](http://www.olist.com/). The dataset has information of 100k orders from 2016 to 2018 made at multiple marketplaces in Brazil. Its features allows viewing an order from multiple dimensions: from order status, price, payment and freight performance to customer location, product attributes and finally reviews written by customers. It also released a geolocation dataset that relates Brazilian zip codes to lat/lng coordinates.

This is real commercial data, it has been anonymised, and references to the companies and partners in the review text have been replaced with the names of Game of Thrones great houses.

### Context
This dataset was generously provided by Olist, the largest department store in Brazilian marketplaces. Olist connects small businesses from all over Brazil to channels without hassle and with a single contract. Those merchants are able to sell their products through the Olist Store and ship them directly to the customers using Olist logistics partners. See more on our website: [www.olist.com](https://www.olist.com/)

After a customer purchases the product from Olist Store a seller gets notified to fulfill that order. Once the customer receives the product, or the estimated delivery date is due, the customer gets a satisfaction survey by email where he can give a note for the purchase experience and write down some comments.

**Attention**

1. An order might have multiple items.
2. Each item might be fulfilled by a distinct seller.
3. All text identifying stores and partners where replaced by the names of Game of Thrones great houses.

### **Data Schema**
The data is divided in multiple datasets for better understanding and organization. The schema of relation the table is provided below.

<img src="https://github.com/ahmadsirrullah/RDBMS-and-Data-Analyst-Practical/blob/main/olist_db_dessign.png" alt="Deskripsi Gambar" width="800"/>

## Creating RDBMS of Olist e-commerce Data
According to the data schema provided by Olist, we can identify the columns that establish relationships between the tables. I have provided details about the relations and determined the primary and foreign keys as follows.

<img src="https://github.com/ahmadsirrullah/RDBMS-and-Data-Analyst-Practical/blob/main/desigb_db_olist.png" alt="Deskripsi Gambar" width="800"/>

**NB**: Primary Key (PK), Foreign Key (FK).

To create the Olist RDBMS, follow these steps:

#### 1. Create Database **Olist**
   
   **Create a new database:**
   ```sql
   CREATE DATABASE Olist;
   ```

   **Switch to the newly created database:**
   ```sql
   USE Olist;
   ```
   
#### 2. Create Tables that becomes place to save the every Olist data table
   
   I have provided the complete SQL code to create the tables in MySQL server in the following link [create_table.sql](https://github.com/ahmadsirrullah/RDBMS-and-Data-Analyst-Practical/blob/main/create_table.sql).
   
#### 3. Read or input the data
   
   For inputting data into the tables, we can read from the CSV instantly, rather than inputting one by one. It wills comsume large amount of time. This is the example code to read instantly from CSV.
   ```sql
   LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.2/Uploads/olist/olist_customers_dataset.csv'
   INTO TABLE customer
   FIELDS TERMINATED BY ','
   IGNORE 1 ROWS;
   ```
   The complete code can be found in the following link [import_csv.sql](https://github.com/ahmadsirrullah/RDBMS-and-Data-Analyst-Practical/blob/main/import_csv.sql). You will find the data types for any updating columns in the link.
   
#### 4. Create the relationship between the table by the PK and FK

   For the last step, we created the relationships between the tables based on the data schema that provided by Olist. The complete code can be found in the following link [create_rdbms.sql](https://github.com/ahmadsirrullah/RDBMS-and-Data-Analyst-Practical/blob/main/create_rdbms.sql).

for the step 3 and 4 can be reversible

## Olist E-commerce Analysis
