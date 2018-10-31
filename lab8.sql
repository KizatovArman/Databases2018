CREATE DATABASE lab8;

CREATE INDEX index_one ON countries USING HASH (name); --1

CREATE INDEX index_two ON employees USING HASH (name, surname); --2

CREATE UNIQUE INDEX index_three ON employees (salary); --3

CREATE INDEX  index_four ON employees (SUBSTRING(name from 1 for 4)); --4

CREATE INDEX  index_five_1 ON employees (department_id, salary); --5

CREATE INDEX  index_five_2 ON departments (department_id, budget); --5