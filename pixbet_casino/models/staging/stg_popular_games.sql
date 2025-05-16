with popular_bets as (
    select
        cg.game_id,
        cb.created_date as date,
        cb.bet_id,
        cb.user_id,
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
    count(distinct user_id) as users,
    count(distinct bet_id) / count(distinct user_id) as bets_per_user,
    count(case when fsb then bet_id end) as free_spins
from
    popular_bets
group by
    game_id,
    date
