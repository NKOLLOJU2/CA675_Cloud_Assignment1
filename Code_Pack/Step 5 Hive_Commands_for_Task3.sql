--1. 	The top 10 posts by score

	select Id, Title, Score from cloudtechdb.top2gpoststb ORDER BY Score DESC LIMIT 10;
	
--2.	The top 10 users by post score

	SELECT OwnerUserId AS Owner, SUM(Score) AS Grand_Score FROM cloudtechdb.top2gpoststb GROUP BY  OwnerUserId ORDER BY Grand_Score DESC LIMIT 10;
	
--3. 	The number of distinct users, who used the word “cloud” in one of their posts

	SELECT COUNT(DISTINCT OwnerUserId) AS Owner_Count FROM cloudtechdb.top2gpoststb WHERE (UPPER(Title) LIKE '%CLOUD%' OR UPPER(Body) LIKE '%CLOUD%' OR UPPER(Tags) LIKE '%CLOUD%');
		