-- Top 10 repos (by file count) and each repo's Top 3 file extensions (sample table)

WITH top_repos AS (
  SELECT
    repo_name,
    COUNT(*) AS total_files
  FROM `bigquery-public-data.github_repos.sample_files`
  GROUP BY repo_name
  ORDER BY total_files DESC
  LIMIT 10
),
ext_counts AS (
  SELECT
    f.repo_name,
    LOWER(REGEXP_EXTRACT(f.path, r'\.([^.\/]+)$')) AS ext,
    COUNT(*) AS file_count
  FROM `bigquery-public-data.github_repos.sample_files` AS f
  JOIN top_repos AS t
    ON f.repo_name = t.repo_name
  WHERE REGEXP_CONTAINS(f.path, r'\.[^/]+$')   -- keep only paths that end with an extension
  GROUP BY f.repo_name, ext
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
