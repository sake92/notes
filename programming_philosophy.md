

## Validate your arguments

Svaka datatype klasa treba **validirat svoje argumente**, koliko može.  
Npr. ako imamo `case class Person(name: String, age: Int)`, bilo bi fino da se *možemo osloniti* na to da je:
- `name` nikad nije prazan ili gibberish
- `age` uvijek pozitivan broj

```scala
case class Person(name: String, age: Int) {
  require(name.nonEmpty, "Name is empty")
  require(name.matches("[a-zA-Z -]+"), "Name contains gibberish chars")
  require(age >= 0, "Age is negative")
}
```

```scala
val p1 = Person("Mujo", 18)
// od ove linije znamo 100% da je ovaj objekat "u validnom stanju"

val p2 = Person("Mujo", -18)
// ovdje bi dobili exception jer nije validan objekat

val p3 = Person("Mujo234", 18)
// ovdje bi dobili exception zbog charactera
```























