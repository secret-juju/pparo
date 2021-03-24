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

    PRIMARY KEY (id)
);

CREATE TABLE company(
    id BIGINT AUTO_INCREMENT,
    name VARCHAR(40) NOT NULL,
    logo VARCHAR(255),
    average_positivity DECIMAL(5, 2),

    PRIMARY KEY (id)
);

CREATE TABLE news(
    id BIGINT AUTO_INCREMENT,
    company_id BIGINT NOT NULL,
    content MEDIUMTEXT NOT NULL,
    positivity DECIMAL(5, 2),

    FOREIGN KEY (company_id) REFERENCES company(id),

    PRIMARY KEY (id)
);

CREATE TABLE bookmark(
    id BIGINT AUTO_INCREMENT,
    account_id BIGINT NOT NULL,
    company_id BIGINT NOT NULL,

    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (company_id) REFERENCES company(id),

    PRIMARY KEY (id)
);
