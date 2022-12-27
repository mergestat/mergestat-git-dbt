{{ config(alias='_dbt_mergestat_commit_authors') }}
{%- set cols = git_commit_author_stats_columns() -%}

select
    {% for col in cols %}
    {{ col }}{% if not loop.last %},{% endif %}
    {% endfor %}
from {{ ref('int_git__commit_stats_joined') }}
group by author
order by author
