SELECT * FROM (SELECT  *
, ROW_NUMBER() over (ORDER BY ViewCount DESC) rank 
FROM Posts 
WHERE ViewCount > 35000) A
WHERE rank between 1 and 50000)
ORDER BY rank asc;

SELECT * FROM (SELECT  *
, ROW_NUMBER() over (ORDER BY ViewCount DESC) rank 
FROM Posts 
WHERE ViewCount > 35000) A
WHERE rank between 50001 and 100000
AND Id NOT IN (8733179) 			--to remove duplicate records
ORDER BY rank asc;

SELECT * FROM (SELECT  *
, ROW_NUMBER() over (ORDER BY ViewCount DESC) rank 
FROM Posts 
WHERE ViewCount > 35000) A
WHERE rank between 100000 and 150000
AND Id NOT IN (8733179,54444538)	--to remove duplicate records
ORDER BY rank asc;

SELECT * FROM (SELECT  *
, ROW_NUMBER() over (ORDER BY ViewCount DESC) rank 
FROM Posts 
WHERE ViewCount > 35000) A
WHERE rank between 150001 and 200000
AND Id NOT IN (8733179,54444538,9587907)	--to remove duplicate records
ORDER BY rank asc;