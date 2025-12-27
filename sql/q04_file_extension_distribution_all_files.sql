-- q04_file_extension_distribution
-- Goal: Count files by extension(using the low-cost sample table)

SELECT
  LOWER(REGEXP_EXTRACT(path, r'\.([^.\/]+)$')) AS extension,
  COUNT(*) AS file_count
FROM `bigquery-public-data.github_repos.sample_files`
WHERE REGEXP_CONTAINS(path, r'\.[^/]+$')
GROUP BY extension
ORDER BY file_count DESC
LIMIT 50;
