-- The fact table is aggregated by game and day, so (game_id, date) must be
-- unique. The left joins to stg_revenue / stg_popularity can silently fan out
-- if those models ever emit more than one row per key, which would inflate
-- every downstream measure. This is the guard against that.
select
    nk_game_id,
    dt_date,
    count(*) as row_count
from {{ ref('fct_gaming_perfomance') }}
group by nk_game_id, dt_date
having count(*) > 1
