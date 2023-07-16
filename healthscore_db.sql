-- Drop the database if it exists
DROP DATABASE IF EXISTS healthscoredb;

-- Drop the user if it exists
DROP USER IF EXISTS healthscore;

-- Create the user
CREATE USER healthscore WITH PASSWORD 'password';

-- Create the database
CREATE DATABASE healthscoredb OWNER healthscore;

-- Connect to the database
\connect healthscoredb;

-- Create the tables
CREATE TABLE et_users (
                          user_id SERIAL PRIMARY KEY,
                          first_name VARCHAR(20) NOT NULL,
                          last_name VARCHAR(20) NOT NULL,
                          email VARCHAR(30) NOT NULL,
                          password TEXT NOT NULL
);

CREATE TABLE et_categories (
                               category_id SERIAL PRIMARY KEY,
                               user_id INTEGER NOT NULL,
                               title VARCHAR(20) NOT NULL,
                               description VARCHAR(50) NOT NULL,
                               CONSTRAINT cat_users_fk FOREIGN KEY (user_id) REFERENCES et_users(user_id)
);

CREATE TABLE et_transactions (
                                 transaction_id SERIAL PRIMARY KEY,
                                 category_id INTEGER NOT NULL,
                                 user_id INTEGER NOT NULL,
                                 amount NUMERIC(10, 2) NOT NULL,
                                 note VARCHAR(50) NOT NULL,
                                 transaction_date BIGINT NOT NULL,
                                 CONSTRAINT trans_cat_fk FOREIGN KEY (category_id) REFERENCES et_categories(category_id),
                                 CONSTRAINT trans_users_fk FOREIGN KEY (user_id) REFERENCES et_users(user_id)
);

-- Grant privileges
ALTER DEFAULT PRIVILEGES FOR ROLE healthscore GRANT ALL ON TABLES TO healthscore;
ALTER DEFAULT PRIVILEGES FOR ROLE healthscore GRANT ALL ON SEQUENCES TO healthscore;

-- Create sequences
CREATE SEQUENCE et_users_user_id_seq;
CREATE SEQUENCE et_categories_category_id_seq;
CREATE SEQUENCE et_transactions_transaction_id_seq;

-- Set default values for sequences
SELECT setval('et_users_user_id_seq', (SELECT COALESCE(MAX(user_id), 0) FROM et_users));
SELECT setval('et_categories_category_id_seq', (SELECT COALESCE(MAX(category_id), 0) FROM et_categories));
SELECT setval('et_transactions_transaction_id_seq', (SELECT COALESCE(MAX(transaction_id), 0) FROM et_transactions));
