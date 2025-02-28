

MUST SEE TALK:
Modern SQL: A lot has changed since SQL-92 by Markus Winand
https://www.youtube.com/watch?v=xEDZQtAHpX8


https://www.amazon.com/Practical-SQL-Beginners-Guide-Storytelling/dp/1593278276
http://www.databaseanswers.org/data_models/

# IDs
Use UUIDs !!!

# NULLs

Nulls are a PITA.  
Any operation involving `NULL` will return `NULL`/`false`:
- `SELECT 'abc' || NULL --> NULL` (it can be a column value)
- `SELECT .. WHERE abc.nullable_column = 123 --> not selected` (if nullable_column is `NULL`, that means `false` result)

`SELECT COUNT(*)` counts ALL ROWS, even those that have NULL columns.  
`SELECT COUNT(col)` counts non-NULL columns/expressions.  
`SELECT COUNT(DISTINCT col)` counts non-NULL distinct columns/expressions.  

# Naming and SQL style
Naming is hard.

## SQL
Write keywords UPPERCASE and identifiers lowercase:
```sql
SELECT u.id, u.name
FROM users u
WHERE u.id = 123
```


## Tables

### Use plural names for tables
A table is a *collection of instances* (records, tuples).  
Easy to differentiate table names from column names.




# Varchar

In MSSQL use nvarchar:
https://stackoverflow.com/questions/176514/what-is-the-difference-between-char-nchar-varchar-and-nvarchar-in-sql-server




