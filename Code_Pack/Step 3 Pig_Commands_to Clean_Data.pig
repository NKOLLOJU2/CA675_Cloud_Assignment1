--1. Loading the csv files into PIG variables

	FirstTierViewResults = LOAD 'hdfs://cluster-0489-nikhil-m/ExtractedData/FirstTierViewResults.csv' USING org.apache.pig.piggybank.storage.CSVExcelStorage(',', 'YES_MULTILINE', 'UNIX', 'SKIP_INPUT_HEADER') AS (Id:int, PostTypeId:int, AcceptedAnswerId:int, ParentId:int, CreationDate:chararray, DeletionDate:chararray, Score:int, ViewCount:int, Body:chararray, OwnerUserId:int, OwnerDisplayName:chararray, LastEditorUserId:int, LastEditorDisplayName:chararray, LastEditDate:chararray, LastActivityDate:chararray, Title:chararray, Tags:chararray, AnswerCount:int, CommentCount:int, FavoriteCount:int, ClosedDate:chararray, CommunityOwnedDate:chararray, ContentLicense:chararray);
	SecondTierViewResults = LOAD 'hdfs://cluster-0489-nikhil-m/ExtractedData/SecondTierViewResults.csv' USING org.apache.pig.piggybank.storage.CSVExcelStorage(',', 'YES_MULTILINE', 'UNIX', 'SKIP_INPUT_HEADER') AS (Id:int, PostTypeId:int, AcceptedAnswerId:int, ParentId:int, CreationDate:chararray, DeletionDate:chararray, Score:int, ViewCount:int, Body:chararray, OwnerUserId:int, OwnerDisplayName:chararray, LastEditorUserId:int, LastEditorDisplayName:chararray, LastEditDate:chararray, LastActivityDate:chararray, Title:chararray, Tags:chararray, AnswerCount:int, CommentCount:int, FavoriteCount:int, ClosedDate:chararray, CommunityOwnedDate:chararray, ContentLicense:chararray);
	ThirdTierViewResults = LOAD 'hdfs://cluster-0489-nikhil-m/ExtractedData/ThirdTierViewResults.csv' USING org.apache.pig.piggybank.storage.CSVExcelStorage(',', 'YES_MULTILINE', 'UNIX', 'SKIP_INPUT_HEADER') AS (Id:int, PostTypeId:int, AcceptedAnswerId:int, ParentId:int, CreationDate:chararray, DeletionDate:chararray, Score:int, ViewCount:int, Body:chararray, OwnerUserId:int, OwnerDisplayName:chararray, LastEditorUserId:int, LastEditorDisplayName:chararray, LastEditDate:chararray, LastActivityDate:chararray, Title:chararray, Tags:chararray, AnswerCount:int, CommentCount:int, FavoriteCount:int, ClosedDate:chararray, CommunityOwnedDate:chararray, ContentLicense:chararray);
	FourthTierViewResults = LOAD 'hdfs://cluster-0489-nikhil-m/ExtractedData/FourthTierViewResults.csv' USING org.apache.pig.piggybank.storage.CSVExcelStorage(',', 'YES_MULTILINE', 'UNIX', 'SKIP_INPUT_HEADER') AS (Id:int, PostTypeId:int, AcceptedAnswerId:int, ParentId:int, CreationDate:chararray, DeletionDate:chararray, Score:int, ViewCount:int, Body:chararray, OwnerUserId:int, OwnerDisplayName:chararray, LastEditorUserId:int, LastEditorDisplayName:chararray, LastEditDate:chararray, LastActivityDate:chararray, Title:chararray, Tags:chararray, AnswerCount:int, CommentCount:int, FavoriteCount:int, ClosedDate:chararray, CommunityOwnedDate:chararray, ContentLicense:chararray);

--2. Combining all the variables into one.

	TopTwoHGrandPosts = UNION FirstTierViewResults, SecondTierViewResults, ThirdTierViewResults, FourthTierViewResults;
	
--3. Filtering NULL data out of the variable and storing into a new one.
	
	filtered_data = FILTER TopTwoHGrandPosts BY (OwnerUserId IS NOT NULL) AND (Id IS NOT NULL);	
	
--4. Removing unwanted characters from the columns and storing the variable into a new one.

	clean_data = FOREACH filtered_data GENERATE (OwnerUserId, Score, ViewCount, Id, OwnerDisplayName, REPLACE(REPLACE(Title,',',''), '\n', ' '), REPLACE(REPLACE(Body, '\n',' '), '([^a-zA-Z0-9\\s]+)',' '), REPLACE(REPLACE(Tags,',',''), '\n', ' '));

--5. Move the cleaned data file into a new cluster folder
	
	STORE clean_data INTO 'hdfs://cluster-0489-nikhil-m/FinalCleanedData' USING PigStorage(',');	