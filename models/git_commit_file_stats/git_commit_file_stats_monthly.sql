{{ config(alias='_dbt_mergestat_file_stats_monthly') }}
{%- set cols = git_commit_file_stats_columns() -%}

select
    {{ dbt.date_trunc('month', 'author_when') }} as month,
    {% for col in cols %}
    {{ col }}{% if not loop.last %},{% endif %}
    {% endfor %}
from {{ ref('int_git__commit_stats_joined') }}
group by 1, repo, file_path
order by 1, repo, file_path
