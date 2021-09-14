
https://www.amazon.com/SQL-Queries-Mere-Mortals-Hands/dp/0321992474




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

### Use entity_id for PK
`JOIN on other.user_id = u.user_id` is easier to understand than  
`JOIN on other.user_id = u.id`



