
## Transactions

https://marcin-chwedczuk.github.io/spring-transactional-cheat-sheet

Params `rollback/noRollback` are only for CHECKED EXCEPTIONS!
The RUNTIME exceptions are ALWAYS ROLLED BACK!

### Misc

- don't use `saveAndFlush(entity)`, use `@Transactional`
- don't `entity.setCollection(nešto)` but `entity.getCollection().{clear, add ..}`
 

### Don't use underscores in JPA entity fields
It screws up `Repository` support. See https://stackoverflow.com/a/23475349/4496364

When you write your custom repo methods, Spring uses underscore to figure out nested field, like `findOneBySomeField_nestedField`.


### Streaming results
http://knes1.github.io/blog/2015/2015-10-19-streaming-mysql-results-using-java8-streams-and-spring-data.html
