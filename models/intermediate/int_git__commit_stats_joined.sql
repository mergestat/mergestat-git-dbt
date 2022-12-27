{{ config(materialized='ephemeral') }}

select *, coalesce(canonical_email, author_email) as deduped_author_email
from git_commit_stats
join git_commits on git_commit_stats.commit_hash = git_commits.hash
join repos on git_commits.repo_id = repos.id
full join {{ ref('int_git__author_email_dedupe') }} on git_commits.author_email = {{ ref('int_git__author_email_dedupe') }}.found_email
where parents < 2
