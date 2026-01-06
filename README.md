# GitHub Repository File-Type Analysis
This project analyzes file-type distributions across GitHub repositories, with a focus on repositories classified as large by file count.
By examining both the internal composition of large repositories and comparing them with smaller repositories, 
the analysis reveals that large repositories tend to concentrate on a limited set of file types—often related to web development
and resource distribution—while smaller repositories exhibit more diverse file structures. 
The results highlight how repository size is closely associated with structural organization and project purpose rather than simply reflecting scale alone.

## Project Overview / プロジェクト概要
This project uses the public GitHub Activity (`github_repos`) dataset in Google BigQuery to demonstrate practical SQL analytics skills. 
The analysis explores repository structures, file distributions, and development patterns using real-world, large-scale data.  

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
  - `sample_files`
  - `commits`
  - `languages` *(optional)*

> Note: This dataset contains metadata from millions of public GitHub repositories
and is queried directly in BigQuery (no local download required).  

- **提供元**：Google BigQuery Public Datasets
- **データセット**：`bigquery-public-data.github_repos`
- **主に使用したテーブル**：
  - `sample_files`
  - `commits`
  - `languages`（必要に応じて）  
> 本データセットは数百万件の公開 GitHub リポジトリのメタデータを含み、BigQuery 上で直接クエリ可能です
（ローカルへのダウンロードは不要）。
---

## Analysis Tasks / 分析內容

This project investigates the following questions:

- What file types are most frequently used in large GitHub repositories defined by file count?
- How does file-type composition differ between large and small GitHub repositories?
- Do the largest GitHub repositories share similar file-composition patterns, or do notable outliers exist?
- What do file-type distributions reveal about the technologies and purposes of large GitHub repositories?

In this project, **large GitHub repositories** are defined as repositories with a high number of files.
Specifically, they refer to the **top 10 repositories ranked by total file count** in the dataset.
This definition focuses on repository size in terms of codebase and file structure, rather than popularity metrics such as stars or forks.  

本プロジェクトでは、以下の観点から分析を行いました。

- ファイル数によって定義された大規模な GitHub リポジトリでは、どのようなファイルタイプが多く使われているのか。
- 大規模リポジトリと小規模リポジトリの間で、ファイルタイプの構成はどのように異なるのか。
- ファイル数が最も多い GitHub リポジトリは、類似したファイル構成パターンを共有しているのか。それとも、顕著な例外（アウトライア）は存在するのか。
- ファイルタイプの分布から、大規模な GitHub リポジトリに用いられている技術やプロジェクトの目的は何が読み取れるのか。  
  
本プロジェクトにおける **large GitHub repositories** とは、
データセット内で **ファイル数が多いリポジトリ**を指します。
具体的には、**ファイル数で順位付けした上位10件のリポジトリ**を対象としています。
本分析では、スター数やフォーク数などの人気指標ではなく、
コードベースおよびファイル構造の規模に着目しています。

---
## Analysis Results

The analysis reveals that large GitHub repositories tend to concentrate on a limited number of file types, particularly JavaScript-, CSS-, and image-related files, reflecting roles such as web resource distribution, platform maintenance, or large-scale asset management. In contrast, smaller repositories exhibit more diverse file compositions, often corresponding to self-contained development projects. While many large repositories share similar structural patterns, notable outliers—such as firmware-oriented projects—demonstrate that repository size alone does not imply a uniform software structure.  
[View Analysis Results](analysis.md)

---
## SQL Techniques Demonstrated / 使用した SQL 技術

This project demonstrates the following SQL techniques:
- `GROUP BY` with aggregation (`COUNT`)
- `ORDER BY` and `LIMIT`
- `JOIN` between multiple tables
- Window functions (`ROW_NUMBER`)
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
