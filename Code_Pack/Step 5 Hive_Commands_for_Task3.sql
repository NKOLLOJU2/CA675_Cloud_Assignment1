--1. 	The top 10 posts by score

	SELECT Title, Score AS Post_Score FROM cloudtechdb.top2gpoststb ORDER BY Post_Score DESC LIMIT 10;
	
--2.	The top 10 users by post score

	SELECT SUM(Score) AS Grand_Post_Score, OwnerUserId AS Owner FROM cloudtechdb.top2gpoststb GROUP BY  OwnerUserId ORDER BY Grand_Post_Score DESC LIMIT 10;
	
--3. 	The number of distinct users, who used the whole word “ cloud ” in one of their posts

	SELECT COUNT ( DISTINCT OwnerUserId ) AS Owner_Count FROM cloudtechdb.top2gpoststb WHERE (UPPER(Title) LIKE '% CLOUD %' OR UPPER(body) LIKE '% CLOUD %' OR UPPER(Tags) LIKE '% CLOUD %');
		