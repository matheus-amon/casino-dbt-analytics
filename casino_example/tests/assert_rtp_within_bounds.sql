-- Return to Player is a ratio: a player is expected to get back between 0 and 1
-- of the amount wagered, with the remainder going to the operator as GGR.
-- A value outside this range means a join or aggregation is wrong upstream.
select
    nk_game_id,
    dt_date,
    mtr_rtp as rtp
from {{ ref('fct_gaming_perfomance') }}
where mtr_rtp is not null
  and (mtr_rtp < 0 or mtr_rtp > 1)
