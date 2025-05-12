with changed_type_and_rename_columns as (
    select
        cast(id as integer) as id_aposta,
        cast(win as double precision) as valor_ganho,
        cast(stake as double precision) as valor_aposta,
        cast(game_id as integer) as id_jogo,
        cast(user_id as integer) as id_usuario,
        cast(created_at as date) as data_atualizacao,
        cast(to_char(created_at, 'HH24:MI:SS') as time) as hora_criacao,
        cast(is_freespin as boolean) as rodada_gratis
    from {{ ref('src_casino_bets') }}
)

select * from changed_type_and_rename_columns
