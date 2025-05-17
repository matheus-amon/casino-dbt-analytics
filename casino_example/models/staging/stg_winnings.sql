with winning as (
    select
        cb.bet_id,
        cb.game_id,
        cb.created_date as date,
        cb.user_id,
        cb.bet_amount,
        cb.win_amount,
        cb.ggr,
        cb.fsb
    from
        {{ ref('trd_casino_bets') }} as cb
    left join
        {{ ref('trd_casino_games') }} as cg
        on cb.game_id = cg.game_id
)

select
    game_id,
    date,
    count(distinct case when win_amount > 0 then bet_id end) as wins,
    sum(win_amount) as gain,
    count(distinct case when win_amount > 0 then user_id end) as winners,
    sum(win_amount) / count(distinct case when win_amount > 0 then bet_id end) as avg_gain,
    sum(win_amount) / count(distinct user_id) as avg_gain_per_user,
    sum(win_amount) / sum(bet_amount) as rtp,
    sum(case when ggr > 0 then win_amount else 0 end) as real_gain,
    sum(case when fsb = 1 then win_amount else 0 end) as fsb_gain
from
    winning
group by
    game_id,
    date
