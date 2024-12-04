-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS Ecommerce;
USE Ecommerce;

-- Tabela Cliente
CREATE TABLE Cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(14) UNIQUE,
    cnpj VARCHAR(18) UNIQUE,
    CHECK (cpf IS NULL OR cnpj IS NULL), -- Garante que apenas um dos campos seja preenchido
    endereco TEXT
);

-- Tabela Forma de Pagamento
CREATE TABLE FormaPagamento (
    id_forma_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(50) NOT NULL -- Ex: 'Cartão de Crédito', 'PIX', 'Boleto'
);

-- Tabela Cliente_FormaPagamento (Relacionamento N:N)
CREATE TABLE Cliente_FormaPagamento (
    id_cliente INT,
    id_forma_pagamento INT,
    PRIMARY KEY (id_cliente, id_forma_pagamento),
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_forma_pagamento) REFERENCES FormaPagamento(id_forma_pagamento)
);


-- Tabela Fornecedor
CREATE TABLE Fornecedor (
    id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    razao_social VARCHAR(255) NOT NULL,
    cnpj VARCHAR(18) UNIQUE NOT NULL
);

-- Tabela Produto
CREATE TABLE Produto (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    categoria VARCHAR(255),
    descricao TEXT,
    valor DECIMAL(10, 2) NOT NULL
);

-- Tabela Estoque
CREATE TABLE Estoque (
    id_estoque INT AUTO_INCREMENT PRIMARY KEY,
    local VARCHAR(255) NOT NULL
);

-- Tabela produtos_has_estoque (Relacionamento N:N)
CREATE TABLE produtos_has_estoque (
    id_produto INT,
    id_estoque INT,
    quantidade INT DEFAULT 0, -- Adicionando quantidade no estoque
    PRIMARY KEY (id_produto, id_estoque),
    FOREIGN KEY (id_produto) REFERENCES Produto(id_produto),
    FOREIGN KEY (id_estoque) REFERENCES Estoque(id_estoque)
);

-- Tabela disponibilidade_de_produto (Relacionamento N:N)
CREATE TABLE disponibilidade_de_produto (
    id_produto INT,
    id_fornecedor INT,
    PRIMARY KEY (id_produto, id_fornecedor),
    FOREIGN KEY (id_produto) REFERENCES Produto(id_produto),
    FOREIGN KEY (id_fornecedor) REFERENCES Fornecedor(id_fornecedor)
);


-- Tabela VendedorTerceirizado
CREATE TABLE VendedorTerceirizado (
    id_terceiro INT AUTO_INCREMENT PRIMARY KEY,
    razao_social VARCHAR(255) NOT NULL,
    cnpj VARCHAR(18) UNIQUE NOT NULL,
    local VARCHAR(255),
    status ENUM('ativo', 'inativo', 'bloqueado', 'inadimplente')
);

-- Tabela produto_por_vendedores_terceiros (Relacionamento N:N)
CREATE TABLE produto_por_vendedores_terceiros (
    id_produto INT,
    id_terceiro INT,
    PRIMARY KEY (id_produto, id_terceiro),
    FOREIGN KEY (id_produto) REFERENCES Produto(id_produto),
    FOREIGN KEY (id_terceiro) REFERENCES VendedorTerceirizado(id_terceiro)
);


-- Tabela Entrega
CREATE TABLE Entrega (
    id_entrega INT AUTO_INCREMENT PRIMARY KEY,
    status VARCHAR(255), -- Ex: 'Em processamento', 'Enviado', 'Entregue'
    codigo_rastreio VARCHAR(255)
);

-- Tabela Pedido
CREATE TABLE Pedido (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_entrega INT,  -- Chave estrangeira para a tabela Entrega
    status_do_pedido VARCHAR(255),
    descricao TEXT,
    frete DECIMAL(10, 2),
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_entrega) REFERENCES Entrega(id_entrega)
);

-- Tabela produto_por_pedido (Relacionamento N:N)
CREATE TABLE produto_por_pedido (
    id_produto INT,
    id_pedido INT,
    quantidade INT DEFAULT 1, -- Adicionando quantidade por produto no pedido
    PRIMARY KEY (id_produto, id_pedido),
    FOREIGN KEY (id_produto) REFERENCES Produto(id_produto),
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido)
);