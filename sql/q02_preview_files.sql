sql/q02_preview_files.sql
-- q02_preview_files
-- Goal: Preview sample rows from files table.

SELECT *
FROM `bigquery-public-data.github_repos.files`
LIMIT 50;
