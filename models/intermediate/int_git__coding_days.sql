{{ config(materialized='ephemeral') }}

with spine as (
  {{- dbt_utils.date_spine(
    datepart="day",
    start_date="(select date_trunc('month', min(author_when)) from git_commits)",
    end_date="now() + '1 day'::interval"
    )
  -}}
)
select
    spine.date_day as day,
    count(distinct hash) as commit_count,
    count(distinct deduped_author_email) as author_count,
    coalesce(jsonb_agg(distinct deduped_author_email) filter (where deduped_author_email is not null), '[]') as authors,
    count(distinct repo_id) as repo_count,
    coalesce(jsonb_agg(distinct repo) filter (where repo is not null), '[]') as repos
from spine
left join {{ ref('int_git__commits_joined') }} as stats on spine.date_day = date_trunc('day', author_when)
group by 1
order by 1
