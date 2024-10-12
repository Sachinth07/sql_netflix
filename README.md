# Netflix_data_SQl
![Netflix logo](https://github.com/Sachinth07/sql_netflix/blob/main/logo.jpg)

## Objective
This Project involves analyzing a comprehensive dataset from Netflix using MySQL. The primary goal is to extract meaningful insights from the data, including trends in user behavior, content preferences, and viewing patterns.

## Key Features 
          Data Cleaning :Used SQL functions to clean and preprocess raw data for consistency.
          Complex Queries: Performed advanced SQL queries to analyze user viewing history, popular genres, and content trends.
          Aggregation and Filtering: Utilized aggregate functions like SUM(), COUNT(), AVG(), and GROUP BY to uncover key metrics like average watch time and top-performing shows.
## Dataset
Data Set Involve : https://github.com/Sachinth07/sql_netflix/blob/main/netflix_titles.csv

## Schema

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

## Problem :

15 Business Problems
1. Count the number of Movies vs Tv Shows ?
2. Find the Most common rating for Movies and Tv Shows ?
3. List all The Movies Specific in Year 2020
4. Top 5 Country Most Content On Netflix
5. Idenitfy the Longest Movie ?
6. Find content add last 5 years
7. Find all movie and tv show that is director by 'Rajiv Chilaka'
8. List all Tv Show Less Than 5 Season
9. Count the number of content items in each Listed_in
10. Find each year When Content Release In India Country
11. List all movies that are documentaries
12. Find all content without director
13. Find how many movies 'Salman Khan' appeared in last 10 years
14. Find the top 10 actors who has appeared in the highest number of movies produced in India
15. Categorize the content based on the presence of the keywords 'kill' and 'violence' in the description field. Label content containing these keywords as 'Bad' and all other content as 'Good'. Count how many items fall into each Category

















