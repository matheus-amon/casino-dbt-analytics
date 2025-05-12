with changed_type_and_rename_columns as (
    select
        cast(id as integer) as bet_id,
        cast(win as double precision) as win_amount,
        cast(stake as double precision) as bet_amount,
        cast(game_id as varchar) as game_id,
        cast(user_id as integer) as user_id,
        cast(created_at as date) as created_date,
        cast(created_at as time) as creation_time,
        cast(is_freespin as boolean) as is_free_spin
        from {{ ref('src_casino_bets') }}
)

select * from changed_type_and_rename_columns
