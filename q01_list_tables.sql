-- q01_list_tables
-- Goal: List tables in the github_repos dataset.

SELECT
  table_name,
  table_type
FROM `bigquery-public-data.github_repos.INFORMATION_SCHEMA.TABLES`
ORDER BY table_name;
