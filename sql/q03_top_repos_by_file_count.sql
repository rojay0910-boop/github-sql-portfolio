-- q03_top_repos_by_file_count
-- Goal: Find repositories with the most file entries.

SELECT repo_name
      COUNT(*) file_count
FROM 'bigquery-public-data.github_repos.files'
GROUP BY repo_name
ORDER BY file_count DESC;
