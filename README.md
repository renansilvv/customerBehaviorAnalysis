# Análise do comportamento e da retenção dos clientes

## Overview
Este projeto analisa o comportamento de clientes em um dataset de e-commerce com foco em frequência de compra, retenção e concentração de receita.

O objetivo é ir além de análises básicas de vendas e entender como os clientes se comportam ao longo do tempo.

## Dataset

Brazilian E-Commerce Public Dataset (Olist) - https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce

Contém dados de pedidos, clientes e transações.

## Análises Realizadas

O SQL foi utilizado em três etapas. Primeiro, as tabelas principais foram criadas no banco de dados PostgreSQL para receber os dados de pedidos, itens e clientes. Depois, os arquivos CSV do dataset Olist foram importados diretamente para essas tabelas. Com tudo carregado, foram criadas cinco views para organizar as análises: a fact_sales cruza pedidos, clientes e itens considerando apenas os pedidos entregues a customer_summary agrupa os dados por cliente e os classifica em três perfis compradores únicos, recorrentes e de alto valor a monthly_sales mostra a evolução mensal de pedidos, clientes e receita a customer_revenue_rank rankeia os clientes por receita e calcula quanto cada um representa no total acumulado e a repeat_rate traz a taxa de recompra da base.

Com o python, em primeiro, foi feita a conexão com o banco PostgreSQL via SQLAlchemy para exportar as cinco views para arquivos CSV, deixando tudo organizado na pasta data/. Logo, esses arquivos foram carregados com Pandas para explorar e validar os resultados conferindo os clientes com maior receita, a taxa de recompra e o comportamento de vendas ao longo do tempo.

O Power BI foi utilizado para transformar os dados exportados em um dashboard interativo, com os resultados das análises mostrando: frequência de compra por cliente, segmentação de clientes por recorrência, tempo de atividade do cliente, evolução das vendas ao longo do tempo, concentração de receita por cliente, taxa de recompra
