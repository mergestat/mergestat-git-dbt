{{ config(alias='_dbt_mergestat_file_author_stats_monthly') }}
{%- set cols = git_commit_file_author_stats_columns() -%}

select
    {{ dbt.date_trunc('month', 'author_when') }} as month,
    {% for col in cols %}
    {{ col }}{% if not loop.last %},{% endif %}
    {% endfor %}
from {{ ref('int_git__commit_stats_joined') }}
group by 1, repo, file_path, deduped_author_email
order by 1, repo, file_path, deduped_author_email
