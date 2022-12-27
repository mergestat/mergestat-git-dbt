{% macro git_commit_file_stats_columns() %}

{{ return([
    'repo',
    'file_path',
    'count(distinct hash) as commit_count',
    'max(author_when) as last_commit_author_when',
    'min(author_when) as first_commit_author_when',
    'sum(additions) as total_additions',
    'sum(deletions) as total_deletions',
    'sum(additions) - sum(deletions) as total_net_additions',
    'avg(additions) as avg_additions',
    'avg(deletions) as avg_deletions',
    'avg(additions) - avg(deletions) as avg_net_additions'
]) }}

{% endmacro %}
