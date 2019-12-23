
Polymorphism: one name - multiple forms.

Types of polymorphism:
- subtyping
- generics
- ad hoc

## Subtyping

Also called *subtype polymorphism*.

Very important here is the **Liskov substitution principle** (The L in SOLID principles!).  
It says that wherever type `T` is expected, its subtype `S` can be used.  
That basically means that `Circle` needs to respect `Shape` protocol/interface/contract, agreed method(s) behaviour(s).  
E.g. if it says "this method prints shape on the screen" it shouldn't launch a rocket, read from database or something completely unrelated.  
Any method available on `Shape` must be implemented in each of it subtypes.

## Generics

Also called *parametric polymorphism*, because you provide a type parameter. :)
Using generics you can write generic methods and generic types (interfaces, classes ...).  
Classical example is a `List[T]`. Here you need to provide a type `T`, let's say `String`, and you get a `List[T]`
(you can't instantiate a `List[T]`, that is abstract...).  
What gives it power is that **every list is handled the same**, regardless of `T`! Whoa! :O

Let's now see a generic method:


## Ad hoc ~ Overloading

Without overloading, instead of this:
```java
void print(int i)
void print(boolean i)
void print(String i)
```
we'd have these:
```java
void printInt(int i)
void printBoolean(boolean i)
void printString(String i)
```

What a pain would that be!? :D  


