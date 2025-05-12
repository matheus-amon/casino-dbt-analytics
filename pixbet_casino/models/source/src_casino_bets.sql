with remove_columns_casino_bets as (
    select
        id,
        win,
        stake,
        game_id,
        user_id,
        created_at,
        updated_at,
        is_freespin
    from raw_casino_bets
)

select * from remove_columns_casino_bets
