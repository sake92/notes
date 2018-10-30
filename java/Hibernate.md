
### Don't use Serializable as field type

Since I used Netbeans to generate JPA entity classes from database, it generates BLOBs as `Serializable`.  
That caused some problems, like this one:
```
org.springframework.orm.jpa.JpaSystemException: could not deserialize; 
nested exception is org.hibernate.type.SerializationException: could not deserialize
```
Solution is to use `byte[]` instead.

### Lazy load **BLOB fields**
Fields are always fetched in Hibernate, you can't (by default) say that a field is lazy.
Since BLOBs can be pretty big, it's best to avoid loading them, app gets reeeeeeeeeally slow...  
Solution for that is in using bytecode manipulation magic, posted here:
https://vladmihalcea.com/the-best-way-to-lazy-load-entity-attributes-using-jpa-and-hibernate/

### Use `@Transactional` on service level
You want your "logical methods" like "create a user"/"update something" to be transactional, either done in whole or not at all... :D  

You **won't get** `LazyInitializationException`s... :)

Bonus is that you don't have to `repo.save(myObject)` all the time (only when you create an object).  
If the object is fetched (managed by Hibernate) like `repo.findOne(1)`,
update/commit will be called at the end of the transaction! :)
https://stackoverflow.com/a/46708295/4496364


### Use **readOnly=true** in `@Transactional` only if you don't write anything to db
If you're 100% sure that body of service method does not update db, only then put `@Transactional(readOnly=true).  
Otherwise, if you put `readOnly=true`, Hibernate won't update any state in db!!!






