{{ config(alias='_dbt_mergestat_file_stats') }}
{%- set cols = git_commit_file_stats_columns() -%}

select
    {% for col in cols %}
    {{ col }}{% if not loop.last %},{% endif %}
    {% endfor %}
from {{ ref('int_git__commit_stats_joined') }}
group by repo, file_path
order by repo, file_path
