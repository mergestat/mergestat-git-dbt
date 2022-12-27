{{ config(alias='_dbt_mergestat_commit_authors_daily') }}
{%- set cols = git_commit_author_stats_columns() -%}

select
    {{ dbt.date_trunc('day', 'author_when') }} as day,
    {% for col in cols %}
    {{ col }}{% if not loop.last %},{% endif %}
    {% endfor %}
from {{ ref('int_git__commit_stats_joined') }}
group by 1, author
order by 1, author
