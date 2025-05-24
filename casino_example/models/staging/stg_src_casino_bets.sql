-- stg_src_casino_bets.sql
-- Lógica do antigo src_casino_bets.sql
with select_columns as (
    select
        id,
        win,
        stake,
        game_id,
        user_id,
        created_at,
        is_freespin
    from raw_casino_bets
)

select * from select_columns
