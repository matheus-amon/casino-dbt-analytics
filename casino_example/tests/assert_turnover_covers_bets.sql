-- Turnover is total amount staked and bets is total bet count, so turnover
-- cannot be zero when bets were recorded. This catches the case where one of
-- the two aggregations silently returns no rows for a given game/day.
select
    nk_game_id,
    dt_date,
    mtr_bets,
    mtr_turnover
from {{ ref('fct_gaming_perfomance') }}
where coalesce(mtr_bets, 0) > 0
  and coalesce(mtr_turnover, 0) = 0
