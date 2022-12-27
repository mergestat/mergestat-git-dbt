{{ config(alias='_dbt_mergestat_file_author_stats') }}
{%- set cols = git_commit_file_author_stats_columns() -%}

select
    {% for col in cols %}
    {{ col }}{% if not loop.last %},{% endif %}
    {% endfor %}
from {{ ref('int_git__commit_stats_joined') }}
group by repo, file_path, deduped_author_email
order by repo, file_path, deduped_author_email
