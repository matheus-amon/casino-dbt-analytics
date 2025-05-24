-- dim_casino_games.sql
select * from {{ ref('stg_casino_games') }}
