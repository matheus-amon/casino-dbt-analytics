with lucrative_games as (
    select
        cg.game_id,
        cb.created_date as date,
        cb.user_id,
        cb.bet_amount,
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
    sum(bet_amount) as turnover,
    count(distinct user_id) / sum(bet_amount) as avg_ticket,
    sum(ggr) as ggr,
    sum(ggr) / sum(bet_amount) as margin,
    sum(case when fsb = 1 then ggr else 0 end) as fsb_ggr
from
    lucrative_games
group by
    game_id,
    date
