# Arquitetura de Modelagem - Medalhão

Este projeto segue a arquitetura Medalhão para organizar a transformação dos dados em camadas lógicas de qualidade.

## Camada Bronze (Dados Brutos)

*   **Origem:** Os dados são ingeridos de um banco de dados MySQL (AWS RDS) via Airbyte e carregados em um banco de dados Postgres (Render).
*   **Tabelas:** `raw_casino_bets`, `raw_casino_games`.
*   **Propósito:** Esta camada contém os dados em seu estado original, sem transformações. Serve como um "data lake" ou "staging area" inicial.

## Camada Silver (Dados Preparados)

*   **Localização:** `models/staging/`
*   **Propósito:** Os dados da camada Bronze são limpos, padronizados e enriquecidos. As principais transformações incluem:
    *   Renomeação de colunas para nomes mais claros.
    *   Correção de tipos de dados (casting).
    *   Cálculo de métricas de negócio iniciais (ex: GGR, NGR).
    *   Criação de modelos intermediários que agregam dados por dia e jogo (`stg_winnings`, `stg_revenue`, `stg_popularity`).
*   **Resultado:** Tabelas e views prontas para serem consumidas pela camada de negócio (Gold).

## Camada Gold (Data Marts)

*   **Localização:** `models/marts/`
*   **Propósito:** Esta camada contém os data marts finais, prontos para serem usados por ferramentas de BI, dashboards ou análises. Os modelos são agregados e seguem um esquema dimensional (estrela).
    *   `dim_casino_games`: Tabela de dimensão com informações sobre os jogos.
    *   `fct_gaming_perfomance`: Tabela de fatos com as principais métricas de performance dos jogos.
*   **Resultado:** Modelos de dados de alta qualidade, bem documentados e otimizados para análise.
