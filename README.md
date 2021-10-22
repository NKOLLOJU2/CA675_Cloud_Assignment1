# CA675_Cloud_Assignment1                                                                                                                             Nikhil Kolloju
Requirement:

The Assignment is to use Cloud Technologies and perform Data Analysis on Stack Overflow posts data. This assignment has 4 tasks described as follows:

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

References:
a.	CSVExcelStorage
https://pig.apache.org/docs/r0.17.0/api/org/apache/pig/piggybank/storage/CSVExcelStorage.html

b.	TF-IDF
https://www.kdnuggets.com/2018/08/wtf-tf-idf.html
c.	TF-IDF Term Weighting
https://hivemall.incubator.apache.org/userguide/ft_engineering/tfidf.html.

d.	Hivemall User Manual
https://hivemall.incubator.apache.org/userguide/getting_started/installation.html

e.	Website to download csv files from Stack Exchange: 
https://data.stackexchange.com/stackoverflow/query/new

f.	To download and install hivemall and define-all.hive:
https://search.maven.org/search?q=a:hivemall-all
https://github.com/apache/incubator-hivemall/blob/master/resources/ddl/define-all.hive

g.	ROW_NUMBER() function: 
https://www.sqlservertutorial.net/sql-server-window-functions/sql-server-row_number-function/
