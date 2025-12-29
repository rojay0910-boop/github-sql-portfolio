# GitHub SQL Portfolio: GitHub Activity Analysis

## Project Overview / プロジェクト概要
This project uses the public **GitHub Activity (`github_repos`) dataset** in **Google BigQuery**
to demonstrate practical SQL analytics skills.
The analysis focuses on exploring repository structures, file distributions,
and development patterns using real-world, large-scale data.  

本プロジェクトでは、**Google BigQuery** の公開データセット**GitHub Activity（`github_repos`）** を使用し、  
実務レベルの **SQL 分析スキル** を示すことを目的としています。
大規模な実データを対象に、リポジトリ構造・ファイル分布・開発パターンを分析しました。

---

## Objectives / 目的
The goals of this project are to:

- Explore a large public dataset using SQL
- Practice analytical SQL patterns used in real data roles
- Demonstrate proficiency in:
  - JOINs
  - Aggregations
  - Window Functions
  - Regular Expressions
- Translate raw data into meaningful insights  


本プロジェクトの目的は以下の通りです。
-  大規模な公開データを SQL で探索・分析する
- 実務で使用される分析クエリの練習
- 以下の SQL スキルを実証する：
  - JOIN
  - 集計（Aggregation）
  - Window Function
  - 正規表現（Regular Expressions）
- 生データから意味のあるインサイトを導き出す
  
---

## Dataset / データセット
- **Source**: Google BigQuery Public Datasets
- **Dataset**: `bigquery-public-data.github_repos`
- **Main tables used**:
  - `files`
  - `commits`
  - `languages` *(optional)*

> Note: This dataset contains metadata from millions of public GitHub repositories
and is queried directly in BigQuery (no local download required).  

- **提供元**：Google BigQuery Public Datasets
- **データセット**：`bigquery-public-data.github_repos`
- **主に使用したテーブル**：
  - `files`
  - `commits`
  - `languages`（必要に応じて）  
> 本データセットは数百万件の公開 GitHub リポジトリのメタデータを含み、BigQuery 上で直接クエリ可能です
（ローカルへのダウンロードは不要）。
---

## Analysis Tasks / 分析內容

This project investigates the following questions:

- What file types are most common in large GitHub repositories?
- How does file composition vary across repositories?
- Which repositories contain the largest number of files, and what are they primarily composed of?
- What technologies and content types dominate large-scale open-source projects?  

本プロジェクトでは、以下の観点から分析を行いました。

- 大規模な GitHub リポジトリでは、どのようなファイル拡張子が多く使われているか
- リポジトリごとのファイル構成にはどのような違いがあるか
- ファイル数が特に多いリポジトリは、どのような構成を持っているか
- 大規模オープンソースプロジェクトで主に使用されている技術・コンテンツの傾向

---
## Analysis Results
In this project, **large GitHub repositories** are defined as repositories with a high number of files.
Specifically, they refer to the **top 10 repositories ranked by total file count** in the dataset.
This definition focuses on repository size in terms of codebase and file structure, rather than popularity metrics such as stars or forks.  

本プロジェクトにおける **large GitHub repositories** とは、
データセット内で **ファイル数が多いリポジトリ**を指します。
具体的には、**ファイル数で順位付けした上位10件のリポジトリ**を対象としています。
本分析では、スター数やフォーク数などの人気指標ではなく、
コードベースおよびファイル構造の規模に着目しています。

### Analysis 1: Top 3 File Extensions in the Top 10 GitHub Repositories(large GitHub repositories)

This visualization analyzes the file composition of the top ten GitHub repositories by file count.  
For each repository, it displays the three most common file extensions, providing insight into the primary technologies and content types used in these projects.    

この可視化は、ファイル数に基づいて上位10件のGitHubリポジトリのファイル構成を分析したものです。  
各リポジトリについて、最も一般的なファイル拡張子を上位3つ表示し、主に使用されている技術やコンテンツの種類を示しています。

![Top 3 File Extensions in the Top 10 GitHub Repositories](assets/images/top10_repos_extensions.png)

**Key Findings**
- Large repositories are often dominated by a small number of file types.
- Repositories such as cdnjs/cdnjs are heavily composed of JavaScript and image files.
- Some large repositories consist primarily of documentation or static assets rather than source code.

---
## SQL Techniques Demonstrated / 使用した SQL 技術

This project demonstrates the following SQL techniques:
- `GROUP BY` with aggregation (`COUNT`)
- `ORDER BY` and `LIMIT`
- `JOIN` between multiple tables
- Window functions (`RANK`, `ROW_NUMBER`)
- Regular expressions (`REGEXP_EXTRACT`, `REGEXP_CONTAINS`)
- Common Table Expressions (CTEs)  
---

## Example Queries / クエリ例

### File Extension Distribution
```sql
SELECT
  REGEXP_EXTRACT(path, r'\.([^.]+)$') AS extension,
  COUNT(*) AS file_count
FROM `bigquery-public-data.github_repos.sample_files`
GROUP BY extension
ORDER BY file_count DESC
LIMIT 10;
