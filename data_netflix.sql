-- Netflix Project 
DROP TABLE IF EXISTS netflix;
CREATE TABLE netflix
(
	show_id	VARCHAR(6),
	type	VARCHAR(10),
	title	VARCHAR(150),
	director	VARCHAR(208),
	casts	VARCHAR(1000),
	country	VARCHAR(150),
	date_added	VARCHAR(50),
	release_year	INT,
	rating	VARCHAR(10),
	duration	VARCHAR(15),
	listed_in	VARCHAR(100),
	description VARCHAR(250)
)

SELECT * FROM netflix;

SELECT 
	COUNT(*) as total_countent
FROM netflix;

SELECT 
	DISTINCT type
FROM netflix;

-- 15 Business Problems

-- 1. Count the number of Movies vs Tv Shows ?
SELECT 
	type,
	COUNT(*) as total_content
FROM netflix
GROUP BY type

-- 2. Find the Most common rating for Movies and Tv Shows ?

SELECT 
	type,
	rating
FROM

(
	SELECT 
		type,
		rating,
		COUNT(*),
		RANK() OVER (PARTITION BY type ORDER BY COUNT(*) DESC) as ranking
		FROM netflix
		GROUP BY 1 , 2
)as t1
WHERE ranking = 1

-- 3. List all The Movies Specific in Year 2020

SELECT * FROM netflix
WHERE 
	type = 'Movie'
	AND 
	release_year = 2020
	
-- 4. Top 5 Country Most Content On Netflix

SELECT 
	UNNEST(STRING_TO_ARRAY(country , ',')) as new_country,
	COUNT(show_id) as total_content
FROM netflix
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5

-- 5. Idenitfy the Longest Movie ?

SELECT * FROM netflix
WHERE 
	type = 'Movie'
	AND 
	duration = (SELECT MAX(duration)FROM netflix)

-- 6. Find content add last 5 years

SELECT * FROM netflix
WHERE 
	TO_DATE(date_added , 'Month DD, YYYY') >= CURRENT_DATE - INTERVAL '5 years'

-- 7. Find all movie and tv show that is director by 'Rajiv Chilaka'

SELECT * FROM netflix
WHERE director LIKE '%Rajiv Chilaka%'

-- 8. List all Tv Show Less Than 5 Season

SELECT * FROM netflix
WHERE 
	type = 'TV Show'
	AND
	SPLIT_PART(duration, ' ' , 1)::numeric < 5 

-- 9. Count the number of content items in each Listed_in

SELECT
	UNNEST(STRING_TO_ARRAY(listed_in , ',')) as new_listed_in,
	COUNT(show_id) as total_content
FROM netflix
GROUP BY 1
ORDER BY 2 DESC

-- 10. Find each year When Content Release In India Country

SELECT
	EXTRACT(YEAR FROM TO_DATE(date_added, 'Month DD, YYYY')) as year,
	COUNT(*)
FROM netflix
WHERE country = 'India'
GROUP BY 1
ORDER BY 2 DESC

-- 11. List all movies that are documentaries

SELECT * FROM netflix
WHERE
	listed_in ILIKE '%documentaries%'

-- 12. Find all content without director

SELECT * FROM netflix
WHERE 
	director is NULL

-- 13. Find how many movies 'Salman Khan' appeared in last 10 years

SELECT * FROM netflix
WHERE
	casts ILIKE '%Salman Khan%'
	AND
	release_year > EXTRACT(YEAR FROM CURRENT_DATE) - 10

-- 14. Find the top 10 actors who has appeared in the highest number of movies produced in India

SELECT 
UNNEST(STRING_TO_ARRAY(casts , ',')) as actors,
COUNT(*) as total_content
FROM netflix
WHERE country ILIKE '%india%'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10

-- 15. Categorize the content based on the presence of the keywords 'kill' and 'violence' in the description field. Label content containing these keywords as
--	'Bad' and all other content as 'Good'. Count how many items fall into each Category


WITH new_table
AS 
(
SELECT
*,
	CASE 
	WHEN
		description ILIKE '%kill%' OR
		description ILIKE '%violence%' THEN 'Bad_Content'
		ELSE 'Good Content'
	END category
FROM netflix
)
SELECT
	category,
	COUNT (*) as total_content
FROM new_table
GROUP BY 1


















