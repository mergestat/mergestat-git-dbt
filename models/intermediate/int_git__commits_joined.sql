{{ config(materialized='ephemeral') }}

select *, coalesce(canonical_email, author_email) as deduped_author_email
from git_commits
join repos on git_commits.repo_id = repos.id
full join {{ ref('int_git__author_email_dedupe') }} on git_commits.author_email = {{ ref('int_git__author_email_dedupe') }}.found_email
where parents < 2
