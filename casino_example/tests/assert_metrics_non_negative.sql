-- Bet counts, turnover and gains are accumulative measures: they can never be
-- negative. A negative value means a double-counted reversal or a bad sign
-- convention leaking from the source, both of which corrupt the GGR figure.
select
    nk_game_id,
    dt_date,
    mtr_wins          as wins,
    mtr_bets          as bets,
    mtr_winners       as winners,
    mtr_turnover      as turnover,
    mtr_gain          as gain,
    mtr_fsb_gain      as fsb_gain,
    mtr_ggr           as ggr
from {{ ref('fct_gaming_perfomance') }}
where coalesce(mtr_wins, 0)        < 0
   or coalesce(mtr_bets, 0)        < 0
   or coalesce(mtr_winners, 0)     < 0
   or coalesce(mtr_turnover, 0)    < 0
   or coalesce(mtr_gain, 0)        < 0
   or coalesce(mtr_fsb_gain, 0)    < 0
   or coalesce(mtr_ggr, 0)         < 0
