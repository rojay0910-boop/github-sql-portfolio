-- q04_file_extension_distribution
-- Goal: Count files by extension (simple version).

SELECT
  REGEXP_EXTRACT(path, r'\.([^.\/]+)$') AS extension,
  COUNT(*) AS file_count
FROM `bigquery-public-data.github_repos.files`
WHERE REGEXP_CONTAINS(path, r'\.[^/]+$')  -- keep file-like paths only
GROUP BY extension
ORDER BY file_count DESC
LIMIT 100;
