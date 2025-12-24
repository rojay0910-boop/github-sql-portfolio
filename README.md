# GitHub SQL Portfolio: GitHub Activity Analysis
# GitHub SQL ポートフォリオ：GitHub Activity データ分析

## Project Overview プロジェクト概要
This project uses the public **GitHub Activity (`github_repos`) dataset** in **Google BigQuery**
to demonstrate practical SQL analytics skills.
本プロジェクトでは、**Google BigQuery** の公開データセット**GitHub Activity（`github_repos`）** を使用し、  
実務レベルの **SQL 分析スキル** を示すことを目的としています。

The analysis focuses on exploring repository structures, file distributions,
and development patterns using real-world, large-scale data.
大規模な実データを対象に、リポジトリ構造・ファイル分布・開発パターンを分析しました。

---

## Objectives
The goals of this project are to:

- Explore a large public dataset using SQL
- Practice analytical SQL patterns used in real data roles
- Demonstrate proficiency in:
  - JOINs
  - Aggregations
  - Window Functions
  - Regular Expressions
- Translate raw data into meaningful insights
- 大規模な公開データを SQL で探索・分析する
- 実務で使用される分析クエリの練習
- 以下の SQL スキルを実証する：
  - JOIN
  - 集計（Aggregation）
  - Window Function
  - 正規表現（Regular Expressions）
- 生データから意味のあるインサイトを導き出す
  
---

## Dataset
- **Source**: Google BigQuery Public Datasets
- **Dataset**: `bigquery-public-data.github_repos`
- **Main tables used**:
  - `files`
  - `commits`
  - `languages` *(optional)*
- **提供元**：Google BigQuery Public Datasets
- **データセット**：`bigquery-public-data.github_repos`
- **主に使用したテーブル**：
  - `files`
  - `commits`
  - `languages`（必要に応じて）

> Note: This dataset contains metadata from millions of public GitHub repositories
and is queried directly in BigQuery (no local download required).
※ 本データセットは数百万件の公開 GitHub リポジトリのメタデータを含み、BigQuery 上で直接クエリ可能です。
---

## Analysis Tasks
Key questions explored in this project include:

- What file types appear most frequently across GitHub repositories?
- How are files structured within repositories?
- Which repositories contain the largest number of files?
- What programming languages dominate large repositories?
- GitHub 上で最も多く使われているファイル拡張子は何か？
- リポジトリ内のファイル構造にはどのような特徴があるか？
- ファイル数が特に多いリポジトリはどれか？
- 大規模リポジトリで使用されている言語の傾向は？

---

## SQL Techniques Demonstrated
This project demonstrates the following SQL techniques:

- `GROUP BY` with aggregation (`COUNT`, `SUM`)
- `ORDER BY` and `LIMIT`
- `JOIN` between multiple tables
- Window functions (`RANK`, `ROW_NUMBER`)
- Regular expressions (`REGEXP_EXTRACT`, `REGEXP_CONTAINS`)
- Common Table Expressions (CTEs)
- `GROUP BY` と集計関数（`COUNT`, `SUM`）
- `ORDER BY`, `LIMIT`
- 複数テーブルの `JOIN`
- Window Function（`RANK`, `ROW_NUMBER`）
- 正規表現（`REGEXP_EXTRACT`, `REGEXP_CONTAINS`）
- 共通テーブル式（CTE / `WITH`）
---

## Example Queries

### File Extension Distribution
```sql
SELECT
  REGEXP_EXTRACT(path, r'\.([^.]+)$') AS extension,
  COUNT(*) AS file_count
FROM `bigquery-public-data.github_repos.files`
GROUP BY extension
ORDER BY file_count DESC
LIMIT 10;
