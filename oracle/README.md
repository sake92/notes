

### Calling procedure from Spring

See https://docs.spring.io/spring/docs/3.0.0.M4/reference/html/ch12s05.html

Out parameter is read after EXECUTE:
```java
SqlParameterSource in = new MapSqlParameterSource()
                .addValue("in_id", id); 
Map out = procReadActor.execute(in); // this
Actor actor = new Actor();
actor.setId(id);
actor.setFirstName((String) out.get("out_first_name"));  // here
```

### Drop all tables
```sql
select 'drop table ' || table_name || ' cascade constraints;' from user_tables;
```

### PLS_INTEGER problem
JDBC driver in combination with Spring doesn't resolve type PLS_INTEGER !?
So we need to add this in params list:
```java
new SqlOutParameter("RETURN", OracleTypes.NUMBER),
```








