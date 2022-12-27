{{ config(materialized='ephemeral') }}

-- The following are values from the MergeStat team.
-- If you'd like to use this for your team, please replace the following with your own email mappings.
-- TODO(patrickdevivo) we should figure out how to make this dynamic - maybe as something applied as a variable?
select * from (values
    ('patrick.devivo@gmail.com', 'patrick@mergestat.com'),

    ('ramirojesuscastillo95@gmail.com', 'ramiro@mergestat.com'),
    ('43893061+ramiroJCB@users.noreply.github.com', 'ramiro@mergestat.com'),

    ('german.canon@truepill.com', 'german@mergestat.com'),
    ('109089565+german-mergestat@users.noreply.github.com', 'german@mergstat.com'),

    ('emily.vandewalle@hotmail.com', 'emily@mergestat.com'),

    ('amenowanna@hotmail.com', 'josue@mergestat.com'),

    ('alonlong@live.cn', 'alonlong@163.com')
)
AS t (found_email, canonical_email)
