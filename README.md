# Projeto Conceitual de Banco de Dados para E-commerce - Bootcamp Suzano Análise de Dados com Power BI

Este projeto representa o desenvolvimento de um esquema conceitual de banco de dados para um sistema de e-commerce, realizado como parte do Bootcamp [Suzano](https://www.linkedin.com/company/suzano/posts/?feedView=all) - Análise de Dados com Power BI, oferecido pela [DIO](https://www.dio.me/), com a mentoria da especialista [Juliana Mascarenhas](https://www.linkedin.com/in/juliana-mascarenhas-00349426/overlay/about-this-profile/?lipi=urn%3Ali%3Apage%3Ad_flagship3_profile_view_base%3B7PAQ44GYRWCFR%2Fd%2Fjxw%2B1w%3D%3D). O projeto foi concebido para aprimorar as habilidades de modelagem de dados, crucial para a análise e visualização eficazes de dados em um contexto de negócios real, como o da Suzano.

## Contexto do Projeto

O objetivo principal deste projeto é criar um modelo de banco de dados relacional robusto e escalável para suportar as operações de uma plataforma de e-commerce.  O escopo do projeto abrange a gestão de produtos, estoque, clientes, pedidos, fornecedores e vendedores terceirizados, com foco na integridade dos dados e na eficiência das consultas. A expertise de Juliana Mascarenhas em ciência de dados e a experiência da Suzano no setor industrial contribuíram para a  compreensão da importância da modelagem de dados para a tomada de decisões estratégicas.

## Ferramentas Utilizadas

Embora o Bootcamp explore diversas ferramentas de modelagem, como Draw.io e DBDesigner.net, e aborde a instalação do MySQL Workbench, este projeto optou por focar na implementação do esquema em MySQL, utilizando scripts SQL para a criação das tabelas e relacionamentos.  Essa abordagem permitiu uma imersão mais profunda na linguagem SQL e na estrutura do banco de dados.

## Modelo de Dados

O modelo de dados foi projetado para atender aos requisitos específicos de um e-commerce, considerando as seguintes entidades e relacionamentos:

* **Cliente:** Armazena informações sobre os clientes, diferenciando entre Pessoa Física (CPF) e Pessoa Jurídica (CNPJ), e permitindo múltiplas formas de pagamento.
* **Fornecedor:**  Contém dados dos fornecedores de produtos.
* **Produto:**  Descreve os produtos disponíveis para venda, incluindo categoria, descrição e valor.
* **Estoque:** Gerencia a quantidade de produtos disponíveis em diferentes locais.
* **Vendedor Terceirizado:**  Armazena informações sobre vendedores terceirizados, incluindo status e localização.
* **Pedido:** Registra os pedidos realizados pelos clientes, incluindo status do pedido, frete e informações de entrega.
* **Entrega:**  Contém informações sobre o status da entrega e o código de rastreio.
* **Forma de Pagamento:**  Lista as diferentes formas de pagamento aceitas pela plataforma.


Os relacionamentos entre as entidades foram cuidadosamente modelados para garantir a integridade referencial e a eficiência das consultas.  Relacionamentos muitos-para-muitos foram implementados usando tabelas intermediárias, como `produtos_has_estoque`, `disponibilidade_de_produto`, `produto_por_vendedores_terceiros` e  `produto_por_pedido`.

## Ecommerce SQL

O script SQL completo para a criação do banco de dados e das tabelas está disponível no arquivo `ecommerce.sql`.  O script inclui a criação das tabelas, a definição das chaves primárias e estrangeiras, e a implementação das restrições de integridade.


## Considerações Finais

Este projeto demonstra a aplicação prática dos conceitos de modelagem de dados em um cenário de e-commerce. A experiência adquirida durante o Bootcamp, com o suporte da Juliana Mascarenhas e o contexto da Suzano, reforçou a importância da análise de dados e da construção de modelos robustos para o sucesso de qualquer negócio orientado a dados.  Futuros desenvolvimentos podem incluir a implementação de triggers, stored procedures e a otimização de consultas para melhorar o desempenho do sistema.