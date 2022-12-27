{{ config(alias='_dbt_mergestat_weekly_coding_days') }}

with distinct_authors_per_week as (
	select
        date_trunc('week', day) as week,
        count(distinct a.value) as distinct_author_count,
        jsonb_agg(distinct a.value) as distinct_authors
        from {{ ref('int_git__coding_days') }}, jsonb_array_elements(authors) as a group by 1
),
days_with_a_commit as (
	select
        date_trunc('week', day) as week,
        count(*) filter (where commit_count > 0) as days_with_a_commit
        from {{ ref('int_git__coding_days') }} group by 1
)
select
    *,
    days_with_a_commit/distinct_author_count as weekly_coding_days
from distinct_authors_per_week join days_with_a_commit using (week)
