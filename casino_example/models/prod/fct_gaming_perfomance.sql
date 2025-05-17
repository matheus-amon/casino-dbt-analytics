with joined_tables as (
    select 
        g.game_id,
        g.game_name,
        g.game_environment,
        g.game_provider,
        g.sigap_category,

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
    from {{ ref('dim_casino_games') }} as g
    left join {{ ref('stg_winnings') }} as w
        on g.game_id = w.game_id and g.created_date = w.date
    left join {{ ref('stg_revenue') }} as r
        on w.game_id = r.game_id and w.date = r.date
    left join {{ ref('stg_popularity') }} as p
        on w.game_id = p.game_id and
        w.date = p.date
)

select
    g.game_id as nk_game_id,

    g.game_name as dsc_game_name,
    g.game_environment as dsc_game_environment,
    g.game_provider as dsc_game_provider,
    g.sigap_category as dsc_sigap_category,

    w.date as dt_game_date,

    w.wins as mtr_wins,
    w.gain as mtr_gain,
    w.winners as mtr_winners,
    w.avg_gain as mtr_avg_gain,
    w.avg_gain_per_user as mtr_avg_gain_per_user,
    w.rtp as mtr_rtp,
    w.real_gain as mtr_real_gain,
    w.fsb_gain as mtr_fsb_gain,
    r.turnover as mtr_turnover,
    r.avg_turnover_per_user as mtr_avg_turnover_per_user,
    r.avg_ticket as mtr_avg_ticket,
    r.ggr as mtr_ggr,
    r.margin as mtr_margin,
    r.fsb_ggr as mtr_fsb_ggr,
    p.bets as mtr_bets,
    p.bets_per_user as mtr_bets_per_user,
    p.free_spins as mtr_fsbs

from joined_tables
