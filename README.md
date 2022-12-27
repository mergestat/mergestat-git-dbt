# mergestat-git-dbt

This is a [`dbt`](https://www.getdbt.com/) project showcasing how to operationalize `git` data synced to Postgres by [MergeStat](https://github.com/mergestat/mergestat).

It addresses common scenarios when it comes to making `git` data useful, including author deduplication.

## Models

### Commits by Author

| Name                                    | Description                 |
|-----------------------------------------|-----------------------------|
| `_dbt_mergestat_commit_authors`         | Total commit author stats   |
| `_dbt_mergestat_commit_authors_daily`   | Daily commit author stats   |
| `_dbt_mergestat_commit_authors_monthly` | Monthly commit author stats |
| `_dbt_mergestat_commit_authors_yearly`  | Yearly commit author stats  |

### File Stats

| Name                                | Description        |
|-------------------------------------|--------------------|
| `_dbt_mergestat_file_stats`         | Total file stats   |
| `_dbt_mergestat_file_stats_daily`   | Daily file stats   |
| `_dbt_mergestat_file_stats_monthly` | Monthly file stats |
| `_dbt_mergestat_file_stats_yearly`  | Yearly file stats  |

### File and Author Stats

| Name                                       | Description               |
|--------------------------------------------|---------------------------|
| `_dbt_mergestat_file_author_stats`         | Total file author stats   |
| `_dbt_mergestat_file_author_stats_daily`   | Daily file author stats   |
| `_dbt_mergestat_file_author_stats_monthly` | Monthly file author stats |
| `_dbt_mergestat_file_author_stats_yearly`  | Yearly file author stats  |

### Weekly Coding Days

| Name                                | Description
|-------------------------------------|------------
| `_dbt_mergestat_weekly_coding_days` | Weekly coding days as described [here](https://docs.velocity.codeclimate.com/en/articles/2913576-weekly-coding-days)
