-- Goal: Analyze file extension distribution ONLY within the top N repos (by file count)
-- Uses the smaller sample table to keep costs low.

-- 1) the top N repos
WITH top_repos AS (
  SELECT
    repo_name,
    COUNT(*) AS file_count
  FROM `bigquery-public-data.github_repos.sample_files`
  GROUP BY repo_name
  ORDER BY file_count DESC
  LIMIT 100
),

-- 2) only within Top repos
top_repo_files AS (
  SELECT
    f.path
  FROM `bigquery-public-data.github_repos.sample_files` AS f
  JOIN top_repos AS r
  USING (repo_name)
)

-- 3) count numbers of file extension distribution ONLY within the top N repos
SELECT
  LOWER(REGEXP_EXTRACT(path, r'\.([^.\/]+)$')) AS ext,
  COUNT(*) AS file_count
FROM top_repo_files
WHERE REGEXP_CONTAINS(path, r'\.[^/]+$') -- keep only paths that end with a file extension
GROUP BY ext
ORDER BY file_count DESC
LIMIT 50;
