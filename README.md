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


### Analysis 1: Top File Extensions in Large Repositories
Related Research Questions:
•	What file types are most frequently used in large GitHub repositories defined by file count?
•	Do GitHub repositories with the largest file counts share similar file-composition patterns, or do notable structural outliers exist?
Explanation:
This analysis examines the top 10 GitHub repositories ranked by file count and analyzes the distribution of their major file extensions. By restricting the scope to large repositories, the analysis aims to directly identify the file-type characteristics that are most commonly used in large-scale projects.
The results show that JavaScript-related extensions, such as .js and .css, account for a high proportion of files in these repositories. This suggests that many large repositories are structured primarily around web-oriented resources.
In addition, by incorporating a repository-level comparison among the largest repositories, this analysis provides insights into the commonalities and differences in file-composition patterns, highlighting whether large repositories exhibit similar structures or include notable structural outliers.

### Analysis 2: File Composition Differences Between Large and Small Repositories

This visualization analyzes the file composition of the top ten GitHub repositories by file count.  
For each repository, it displays the three most common file extensions, providing insight into the primary technologies and content types used in these projects.    

### Analysis 3: Primary File Types Across GitHub Repositories



分析①：大規模リポジトリにおける主要なファイル拡張子  
対応する研究課題：
- ファイル数によって定義された大規模な GitHub リポジトリでは、どのようなファイルタイプが多く使われているのか。
- ファイル数が最も多い GitHub リポジトリは、類似したファイル構成パターンを共有しているのか。それとも、顕著な構成上の例外（アウトライア）は存在するのか。

説明：
本分析では、ファイル数に基づいて上位 10 件に分類される GitHub リポジトリを対象とし、それらに含まれる主要なファイル拡張子の分布を分析した。分析対象を大規模リポジトリに限定することで、大規模プロジェクトにおいて多く利用されているファイルタイプの特徴を直接的に明らかにすることを目的としている。
分析の結果、.js や .css に代表される JavaScript 関連の拡張子が高い割合を占めていることが確認された。このことから、多くの大規模リポジトリは、Web 指向のリソースを中心とした構成を持つことが示された。
さらに、本分析にはファイル数上位のリポジトリを個別に比較する視点も含まれており、最大規模のリポジトリ間におけるファイル構成の共通性および差異についても示唆を与えている。

This visualization analyzes the file composition of the top ten GitHub repositories by file count.  
For each repository, it displays the three most common file extensions, providing insight into the primary technologies and content types used in these projects.    

This analysis examines the top 10 GitHub repositories by file count and identifies the most common file extensions within them.
The results show that large repositories are dominated by a small number of file types, particularly JavaScript-related assets such as .js and .css. This indicates that many of the largest repositories function as large-scale web or asset libraries.

この可視化は、ファイル数に基づいて上位10件のGitHubリポジトリのファイル構成を分析したものです。  
各リポジトリについて、最も一般的なファイル拡張子を上位3つ表示し、主に使用されている技術やコンテンツの種類を示しています。

![Top 3 File Extensions in the Top 10 GitHub Repositories](assets/images/top10_repos_extensions.png)

**Key Findings**
- Large repositories are often dominated by a small number of file types.
- Repositories such as cdnjs/cdnjs are heavily composed of JavaScript and image files.
- Some large repositories consist primarily of documentation or static assets rather than source code.
- 



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
