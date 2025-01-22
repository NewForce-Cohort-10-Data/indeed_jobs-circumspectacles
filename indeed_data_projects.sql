SELECT COUNT(title)
FROM data_analyst_jobs;

-- Write a query to look at just the first 10 rows. 
-- What company is associated with the job posting on the 10th row?

SELECT *
FROM data_analyst_jobs
LIMIT 10;

-- XTO Land Data Analyst 

-- How many postings are in Tennessee? 
-- How many are there in either Tennessee or Kentucky?

SELECT 
    SUM(CASE WHEN location = 'TN' THEN 1 ELSE 0 END) AS tn_job_listings,
    SUM(CASE WHEN location = 'KY' THEN 1 ELSE 0 END) AS ky_jobs_listings
FROM data_analyst_jobs
WHERE location IS NOT NULL;

-- How many postings in Tennessee have a star rating above 4?

SELECT 
    star_rating,
    SUM(CASE WHEN star_rating > 4 THEN 1 ELSE 0 END) AS above_4_stars
FROM data_analyst_jobs
WHERE location = 'TN' AND star_rating IS NOT NULL
GROUP BY star_rating
ORDER BY star_rating DESC;

-- How many postings in the dataset have 
-- a review count between 500 and 1000?

SELECT 
    SUM(CASE WHEN review_count BETWEEN 500 AND 1000 THEN 1 ELSE 0 END) AS high_review_count
	FROM data_analyst_jobs;

-- Show the average star rating for companies in each state. 
-- The output should show the state as state and the average rating 
-- for the state as avg_rating. 
-- Which state shows the highest average rating? NE!! land of corn

SELECT location,
       AVG(star_rating) AS avg_star_rating
FROM data_analyst_jobs
WHERE star_rating IS NOT NULL
GROUP BY location
ORDER BY avg_star_rating DESC;

-- Select unique job titles from the data_analyst_jobs table. 
-- How many are there? 881

SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs;

-- How many unique job titles are there for California companies? 230

SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs
WHERE location='CA';

-- Find the name of each company and its average star rating 
-- for all companies that have more than 5000 reviews across 
-- all locations. How many companies are there with more than 
-- 5000 reviews across all locations? 184

SELECT company
FROM data_analyst_jobs
WHERE review_count > 5000;

SELECT COUNT(company)
FROM data_analyst_jobs
WHERE review_count > 5000;

-- Add the code to order the query in #9 from highest to 
-- lowest average star rating. Which company with more than 
-- 5000 reviews across all locations in the dataset has the 
-- highest star rating? What is that rating? American Express, 4.2

SELECT company, star_rating
FROM data_analyst_jobs
WHERE review_count > 5000 AND star_rating IS NOT NULL
GROUP BY company, star_rating
ORDER BY star_rating DESC;

-- Find all the job titles that contain the word ‘Analyst’. 
-- How many different job titles are there? 1669

SELECT title
FROM data_analyst_jobs
WHERE title ILIKE '%Analyst%';

SELECT COUNT(title)
FROM data_analyst_jobs
WHERE title ILIKE '%Analyst%';

-- How many different job titles do not 
-- contain either the word ‘Analyst’ or the word ‘Analytics’? 4
-- What word do these positions have in common? 
-- Tablaeu (skill), visualization specialist (for two of them))

SELECT *
FROM data_analyst_jobs
WHERE title NOT ILIKE '%Analyst%' AND title NOT ILIKE '%Analytics%';

-- BONUS
-- You want to understand which jobs requiring SQL are hard to 
-- fill. Find the number of jobs by industry (domain) that require 
-- SQL and have been posted longer than 3 weeks.

-- Disregard any postings where the domain is NULL.
-- Order your results so that the domain with the greatest number of 
-- hard to fill jobs is at the top.
-- Which three industries are in the top 4 on this list? 
--Health Care, Internet and Software, Banks and Financial Services
--Education and Schools
--How many jobs have been listed for more than 3 weeks for each of the top 4?
--96, 84, 77, 43

--total 667
SELECT COUNT(title) AS hard_to_fill, domain
FROM data_analyst_jobs
WHERE days_since_posting>21 AND domain IS NOT NULL
GROUP BY domain
ORDER BY hard_to_fill DESC;

SELECT COUNT(title) AS hard_to_fill
FROM data_analyst_jobs
WHERE days_since_posting>21 AND domain IS NOT NULL;


SELECT domain
FROM data_analyst_jobs;














