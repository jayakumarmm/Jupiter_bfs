select count(a.column_name)  as cnt from 
    (select COLUMN_NAME, CONSTRAINT_NAME, REFERENCED_COLUMN_NAME, REFERENCED_TABLE_NAME
from information_schema.KEY_COLUMN_USAGE
where TABLE_NAME = 'customers' and TABLE_SCHEMA = 'banking')a
LEFT JOIN 
    (select COLUMN_NAME, CONSTRAINT_NAME, REFERENCED_COLUMN_NAME, REFERENCED_TABLE_NAME
from information_schema.KEY_COLUMN_USAGE
where TABLE_NAME = 'customers_stg' and TABLE_SCHEMA = 'banking_staging' )b
ON a.column_name = b.column_name
where b.COLUMN_NAME IS NULL; 