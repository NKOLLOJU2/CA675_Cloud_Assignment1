--1.	To create a Database.
	CREATE DATABASE IF NOT EXISTS cloudtechdb;

--2.	To create table in the database.
	CREATE TABLE cloudtechdb.poststb (Body string, Score int, Id int, ViewCount int, OwnerUserId int, OwnerDisplayName string, Title string, Tags string) ROW FORMAT DELIMITED FIELDS TERMINATED BY ',';

--3.	Load the clean data from the HDFS cluster to the table
	LOAD DATA INPATH 'hdfs://cluster-0489-nikhil-m/FinalCleanData8' INTO TABLE cloudtechdb.top2gpoststb;
