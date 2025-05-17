with popularity as (
    select
        cg.game_id,
        cb.created_date as date,
        cb.bet_id,
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
    count(distinct bet_id) as bets,
    count(case when ggr > 0 then bet_id end) / count(distinct user_id) as bets_per_user,
    count(case when fsb then bet_id end) as free_spins
from
    popularity
group by
    game_id,
    date
