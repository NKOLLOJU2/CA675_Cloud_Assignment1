--1. 	The top 10 posts by score

	select Id, Title, Score from cloudtechdb.poststb ORDER BY Score DESC LIMIT 10;
	
--2.	The top 10 users by post score

	SELECT OwnerUserId AS Owner, SUM(Score) AS Grand_Score FROM cloudtechdb.poststb GROUP BY  OwnerUserId ORDER BY Grand_Score DESC LIMIT 10;
	
--3. 	The number of distinct users, who used the word “cloud” in one of their posts

	SELECT COUNT(DISTINCT OwnerUserId) AS Owner_Count FROM cloudtechdb.poststb WHERE (UPPER(Title) LIKE '%CLOUD%' OR UPPER(body) LIKE '%CLOUD%' OR UPPER(Tags) LIKE '%CLOUD%');
		