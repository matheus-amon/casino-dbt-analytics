with gaming_performance_base as (
    select
        w.game_id,
        w.date,
        w.wins,
        w.gain,
        w.winners,
        w.avg_gain,
        w.avg_gain_per_user,
        w.rtp,
        w.real_gain,
        w.fsb_gain,
        r.turnover,
        r.avg_turnover_per_user,
        r.avg_ticket,
        r.ggr,
        r.margin,
        r.fsb_ggr,
        p.bets,
        p.bets_per_user,
        p.free_spins
    from {{ ref('stg_winnings') }} as w
    left join {{ ref('stg_revenue') }} as r
        on w.game_id = r.game_id and w.date = r.date
    left join {{ ref('stg_popularity') }} as p
        on w.game_id = p.game_id and w.date = p.date
)

select
    g.game_id as nk_game_id,

    g.game_name as dsc_game_name,
    g.game_environment as dsc_game_environment,
    g.game_provider as dsc_game_provider,
    g.sigap_category as dsc_sigap_category,

    b.date as dt_date,

    b.wins as mtr_wins,
    b.gain as mtr_gain,
    b.winners as mtr_winners,
    b.avg_gain as mtr_avg_gain,
    b.avg_gain_per_user as mtr_avg_gain_per_user,
    b.rtp as mtr_rtp,
    b.real_gain as mtr_real_gain,
    b.fsb_gain as mtr_fsb_gain,
    b.turnover as mtr_turnover,
    b.avg_turnover_per_user as mtr_avg_turnover_per_user,
    b.avg_ticket as mtr_avg_ticket,
    b.ggr as mtr_ggr,
    b.margin as mtr_margin,
    b.fsb_ggr as mtr_fsb_ggr,
    b.bets as mtr_bets,
    b.bets_per_user as mtr_bets_per_user,
    b.free_spins as mtr_fsbs
from gaming_performance_base as b
inner join {{ ref('dim_casino_games') }} as g
    on b.game_id = g.game_id
