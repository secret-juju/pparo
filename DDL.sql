DROP DATABASE IF EXISTS secret_juju;
CREATE DATABASE IF NOT EXISTS secret_juju;
USE secret_juju;

DROP TABLE IF EXISTS bookmark;
DROP TABLE IF EXISTS news;
DROP TABLE IF EXISTS company;
DROP TABLE IF EXISTS account;

CREATE TABLE account(
    id BIGINT AUTO_INCREMENT,
    email VARCHAR(28) NOT NULL,
    name VARCHAR(28) NOT NULL,

    UNIQUE (email, name),

    PRIMARY KEY (id)
);

CREATE TABLE company(
    id BIGINT AUTO_INCREMENT,
    ticker_symbol CHAR(6) NOT NULL,
    name VARCHAR(40) NOT NULL,

    UNIQUE (ticker_symbol),

    PRIMARY KEY (id)
);

CREATE TABLE industry(
    id BIGINT AUTO_INCREMENT,
    name VARCHAR(12),

    UNIQUE (name),

    PRIMARY KEY (id)
);

CREATE TABLE company_industry_affiliation(
    id BIGINT AUTO_INCREMENT,

    company_id BIGINT NOT NULL,
    industry_id BIGINT NOT NULL,

    UNIQUE (company_id, industry_id),

    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (industry_id) REFERENCES industry(id),

    PRIMARY KEY (id)
);

CREATE TABLE stock(
    id BIGINT AUTO_INCREMENT,

    date DATE NOT NULL,
    closing_price BIGINT NOT NULL,
    difference_from_yesterday BIGINT NOT NULL,
    fluctuation_rate DECIMAL(5, 2),
    opening_price BIGINT NOT NULL,
    high_price BIGINT NOT NULL,
    low_price BIGINT NOT NULL,
    market_capitalization BIGINT NOT NULL,

    company_id BIGINT NOT NULL,

    UNIQUE (date, company_id),

    FOREIGN KEY (company_id) REFERENCES company(id),

    PRIMARY KEY (id)
);

CREATE TABLE news(
    id BIGINT AUTO_INCREMENT,

    content MEDIUMTEXT NOT NULL,
    positivity BIGINT,

    company_id BIGINT,

    FOREIGN KEY (company_id) REFERENCES company(id),

    PRIMARY KEY (id)
);

CREATE TABLE bookmark(
    id BIGINT AUTO_INCREMENT,

    account_id BIGINT NOT NULL,
    company_id BIGINT NOT NULL,

    UNIQUE (account_id, company_id),

    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (company_id) REFERENCES company(id),

    PRIMARY KEY (id)
);
