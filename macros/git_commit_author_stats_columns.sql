{% macro git_commit_author_stats_columns() %}

{{ return([
    'count(distinct hash) as commit_count',
    'count(distinct file_path) as files_modified',
    'sum(additions) as additions',
    'sum(deletions) as deletions',
    'coalesce(canonical_email, author_email) as author'
]) }}

{% endmacro %}
