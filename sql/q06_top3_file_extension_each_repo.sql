-- Goal:Top 3 file extensions for each repo (using the low-cost sample table)

WITH ext_counts AS (
  SELECT
    repo_name,
    LOWER(REGEXP_EXTRACT(path, r'\.([^.\/]+)$')) AS ext,
    COUNT(*) AS file_count
  FROM `bigquery-public-data.github_repos.sample_files`
  WHERE REGEXP_CONTAINS(path, r'\.[^/]+$')   -- keep only paths that end with an extension
  GROUP BY repo_name, ext
),
ranked AS (
  SELECT
    repo_name,
    ext,
    file_count,
    ROW_NUMBER() OVER (
      PARTITION BY repo_name
      ORDER BY file_count DESC, ext
    ) AS rn
  FROM ext_counts
)
SELECT
  repo_name,
  ext,
  file_count
FROM ranked
WHERE rn <= 3
ORDER BY repo_name, rn;
