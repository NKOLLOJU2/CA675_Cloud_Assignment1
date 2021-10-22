--1.	To create a Database.
	CREATE DATABASE IF NOT EXISTS cloudtechdb;

--2.	To create table in the database.
	CREATE TABLE cloudtechdb.top2gpoststb (Id int,PostTypeId int,AcceptedAnswerId int,ParentId int,CreationDate timestamp,DeletionDate timestamp,Score int,ViewCount int,Body string,OwnerUserId int,OwnerDisplayName string,LastEditorUserId int,LastEditorDisplayName string,LastEditDate timestamp,LastActivityDate timestamp,Title string,Tags string,AnswerCount int,CommentCount int,FavoriteCount int,ClosedDate timestamp,CommunityOwnedDate timestamp,ContentLicense string)  ROW FORMAT DELIMITED FIELDS TERMINATED BY ',';

--3.	Load the clean data from the HDFS cluster to the table
	LOAD DATA INPATH 'hdfs://cluster-0489-nikhil-m/FinalCleanedData' INTO TABLE cloudtechdb.top2gpoststb;
