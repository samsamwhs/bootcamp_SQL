-- Notes Chapter 11
-- employee skill table
-- only insert & delete (one-off action) instead of update database to avoid threads crash 

-- faculty and course should store in diff. table 
-- -> sometimes faculty won't have course in short period of time in real life
-- this table setting tells us faculty must have course in the school once they joined

-- BCNF: table setting rule

-- drop down box (can't change) -> should be stored at another table and assign IDs 
-- --> solve storage problem, save hard disk

-- movie rent example
-- another table: movie return date
-- add rent ID for each movie rent as primary key
-- inner join/ not exist to find out who doesn't return the movie yet






-- Note Chapter 1
-- database can do 2 actions (e.g. credit and debit) at the same time or fail at the same time which is atomically
-- thread safety (lock record)
-- health check periodically (e.g. every midnight) to keep data integrity (by using inner join, group by)
-- function ok is not equal to data integrity


-- Oracle works best with hundred or throusand of transaction process in a sec, used by bank..china company
-- SQL server for SME

-- data retriveval : select funtion, table will lock first, MySQL workbench is client side
-- there is another software actually running at backend in our computer

-- readability vs storage : UK/1 for United Kingdom?

-- DDL: change table structure

-- INDEXING
-- can have system pre-heat
-- index will have hashmap underneath which will restructure upon DML e.g. add new word to dictionary
-- will slow down performance when insert but other function perform fastly
-- e.g. sorting 

-- rollback
-- when 2 actions can not be performed at the same time
-- see start transaction example




-- Note Chapter 12
-- primary key & foreign key have index
-- over 100 tables in a database is usual

-- DML explain plan ?????

-- no relational database
-- NoSQL database (e.g. MongoDB) for non-transaction system, is a json format
-- work well with object
-- like putting data to temp. file, so faster (e.g. shopping cart)

-- graph database (e.g. facebook)
-- relationship between object (e.g. google map, maural friend)
-- self learn after springboot

-- Note Week 11 Thead safety
--  


















