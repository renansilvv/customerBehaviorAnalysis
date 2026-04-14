# Análise do comportamento e da retenção dos clientes

## Overview
Este projeto analisa o comportamento de clientes em um dataset de e-commerce com foco em frequência de compra, retenção e concentração de receita.

O objetivo é ir além de análises básicas de vendas e entender como os clientes se comportam ao longo do tempo.

## Dashboard

O dashboard final foi desenvolvido no Power BI com foco em visão executiva e análise do perfil dos clientes.

### Visão Geral
![Visão Geral](assets/images/visao-geral.png)

### Perfil dos Clientes
![Perfil dos Clientes](assets/images/perfil-dos-clientes.png)

## Objetivo

O projeto busca responder perguntas como:

- quantos clientes compram apenas uma vez
- quantos voltam a comprar
- como a receita evolui mês a mês
- quais clientes concentram a maior parte da receita
- como resumir o comportamento do cliente em uma camada analítica simples e reutilizável

## Dataset

Brazilian E-Commerce Public Dataset (Olist) - https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce

Contém dados de pedidos, clientes e transações.

## Estrutura do projeto

```text
customerBehaviorAnalysis/
├── data/
│   ├── olist_orders_dataset.csv
│   ├── olist_order_items_dataset.csv
│   ├── olist_customers_dataset.csv
│   ├── fact_sales.csv
│   ├── customer_summary.csv
│   ├── monthly_sales.csv
│   ├── customer_revenue_rank.csv
│   └── repeat_rate.csv
├── python/
│   ├── export_powerbi.py
│   └── analysis.py
├── sql/
│   ├── create_tables.sql
│   ├── importData.sql
│   └── base.sql
└── README.md
```
## Análises realizadas

A etapa em SQL foi responsável por estruturar a base analítica do projeto. Primeiro, foram criadas no PostgreSQL as tabelas que armazenam os dados de clientes, pedidos e itens dos pedidos. Em seguida, os arquivos CSV do dataset da Olist foram importados para o banco. Com os dados carregados, foi construída uma camada analítica por meio de cinco views. A `fact_sales` consolida pedidos, clientes e itens, considerando apenas os pedidos entregues. A `customer_summary` resume o comportamento de cada cliente a partir do número de pedidos, da receita total, da primeira e da última compra, além de classificá-los em perfis como compradores de compra única, recorrentes e frequentes. A `monthly_sales` apresenta a evolução mensal de pedidos, clientes e receita. A `customer_revenue_rank` organiza os clientes por receita e calcula sua participação acumulada no faturamento total. Por fim, a `repeat_rate` sintetiza a taxa de recompra da base.

No Python, o projeto foi usado em duas frentes. A primeira foi a conexão com o PostgreSQL por meio do SQLAlchemy para exportar as views analíticas em arquivos CSV, deixando os dados preparados para consumo em outras ferramentas. A segunda foi a leitura desses arquivos com Pandas para uma validação inicial dos resultados, permitindo inspecionar as tabelas geradas, conferir os clientes com maior receita, observar a taxa de recompra e verificar o comportamento das vendas ao longo do tempo.

No Power BI, os dados exportados foram utilizados para a construção de um dashboard interativo voltado à análise do comportamento dos clientes. A visualização reúne indicadores como frequência de compra, segmentação por recorrência, tempo de atividade do cliente, evolução das vendas ao longo do tempo, concentração de receita por cliente e taxa de recompra, permitindo transformar a camada analítica construída em SQL em uma leitura mais clara e visual dos resultados.
