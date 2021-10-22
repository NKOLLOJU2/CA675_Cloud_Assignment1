--Initializing hivemall

add jar /home/nikhil_kolloju2/hivemall-all-0.6.0-incubating.jar;

source /home/nikhil_kolloju2/define-all.hive;

--Setting Variables

SET hive.cli.print.header=true;

SET hivevar:n_docs=10; 
 
--Two temporary macro functions max2 and tdidf for later usage: 
CREATE TEMPORARY MACRO max2(x INT, y INT) if(x>y,x,y);
 
CREATE TEMPORARY MACRO tfidf(tf FLOAT, df_t INT, n_docs INT) tf * (log(10, CAST(n_docs as FLOAT)/max2(1,df_t)) + 1.0);
 
--To Top 10 users sorted by their score
CREATE TABLE cloudtechdb.task4_top10_tb1 AS SELECT OwnerUserId, Body, Score FROM cloudtechdb.top2gpoststb ORDER BY Score DESC LIMIT 10;
 
--To store the OwnerUserId and Body from the previous table.
CREATE TABLE cloudtechdb.task4_top10_tb2 AS SELECT OwnerUserId, Body FROM cloudtechdb.task4_top10_tb1;
 
--To remove the stop words
CREATE OR REPLACE VIEW cloudtechdb.task4_top10_vw AS SELECT OwnerUserId, de_word FROM cloudtechdb.task4_top10_tb2 LATERAL VIEW explode(split(Body, ' ')) t AS de_word WHERE NOT is_stopword(de_word);
 
--Term Frequency (TF)
CREATE OR REPLACE VIEW cloudtechdb.task4_termfreq_vw AS SELECT OwnerUserId, de_word, freq FROM (SELECT OwnerUserId, tf(de_word) AS ea_word_freq FROM cloudtechdb.task4_top10_vw GROUP BY OwnerUserId) t LATERAL VIEW explode(ea_word_freq) t2 AS de_word, freq;
 
--Inverse Document Frequency (IDF)
CREATE OR REPLACE VIEW cloudtechdb.task4_docfreq_vw AS SELECT de_word, COUNT(DISTINCT OwnerUserId) docs FROM cloudtechdb.task4_top10_vw GROUP BY de_word;
 
--TF-IDF
CREATE OR REPLACE VIEW cloudtechdb.task4_tfidf_vw AS SELECT tf.OwnerUserId, tf.de_word, wf_tfidf(tf.freq, df.docs, ${n_docs}) AS wf_tfidf FROM cloudtechdb.task4_termfreq_vw tf JOIN cloudtechdb.task4_docfreq_vw df ON (tf.de_word = df.de_word) ORDER BY wf_tfidf DESC;

--Calculate the per-user TF-IDF of the top 10 terms for each of the top 10 users
SELECT OwnerUserId ,de_word, wf_tfidf, rank FROM ( SELECT  OwnerUserId ,de_word, wf_tfidf, ROW_NUMBER() over (PARTITION BY OwnerUserId ORDER BY wf_tfidf DESC) as rank FROM cloudtechdb.task4_tfidf_vw  ) A  WHERE rank <= 10;