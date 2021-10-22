# CA675_Cloud_Assignment1                                                                                                                             Nikhil Kolloju
Requirement:

The Assignment is to use Cloud Technologies and perform Data Analysis on Stack Exchange posts data. This assignment has 4 tasks described as follows:

Task 1: Fetch top 200,000 posts from Stack Exchange sorted by View Count.

Task 2: Extract, Transform and Load the fetched data using MapReduce/Hive/Pig.

Task 3: Fetch the following data using MapReduce/Hive/Pig
  •	Top 10 Posts by Score
  •	Top 10 Users by Post Score
  •	Number of Distinct Users to use the word ‘Cloud’ in one of their posts

Task 4: Calculate the per-user TF-IDF of the top 10 terms for each of the top 10 users.

Steps for Task completion:

1.	Data Extraction from Stack Exchange.
2.	Moving the extracted data from Stack Exchange into HDFS.
3.	Cleaning the extracted data using PIG
4.	Creating a table to store the cleaned data using HIVE
5.	Running the queries to analyse table data for Task 3 using HIVE
6.	Run Query to find TF-IDF for Task 4 using HIVE
