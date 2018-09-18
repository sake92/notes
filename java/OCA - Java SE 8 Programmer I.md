# Trivia

## type
By type we mean `class`, `interface` or `enum`.

## identifier
Identifier is a variable, method or type **name**.  
It can start with (and contain) a letter, underscore (`_`) or a currency sign (`$`, `€` and similar).
It can't contain special characters like dot, comma, slash etc.

## parameter vs argument
Method parameters are the **variables** that appear in the definition of a method.  
Method arguments are the **actual values** that are passed to a method while executing it.

```
void abc(String param1) {} // param1 is parameter

abc(arg1) // arg1 is argument
```

## constructor
Every class has a constructor.  
If it does not declare one **explicitly** it will get one **implicitly**, with no arguments ("noargs" constructor).

## package
Class with no **explicit** package will be in the *default package* which doesn't have a name. 

Members of a **named package** can’t access anything
defined in the default package.

You can `import static` static members of a type (class/interface/enum);

## import
Everything from `java.lang` package is **always imported**.  
Bulk import, e.g. `import mypackage.*` imports that package only, not its subpackages.

## class
Every **top-level public** class must be defined in its own file, and the file name must be the same!  
E.g. `class MyClass` must be in a file `MyClass.java`.

You **can** use non-public classes from same package!

## applications / main method
Entry point to a program must be defined as one of these: 
- `public static void main(String args[])` or  
- `public static void main(String... args)`, where `String...` is varargs syntax.

Any other signature is not valid entry point.  
Variable `args` can have arbitrary name.  
Keywords `public` and `static` are interchangeable.

## access modifier
<pre>
            │ Class │ Package │ Subclass │ Subclass │ World
            │       │         │(same pkg)│(diff pkg)│ 
────────────┼───────┼─────────┼──────────┼──────────┼────────
public      │   +   │    +    │    +     │     +    │   +     
────────────┼───────┼─────────┼──────────┼──────────┼────────
protected   │   +   │    +    │    +     │     +    │         
────────────┼───────┼─────────┼──────────┼──────────┼────────
no modifier │   +   │    +    │    +     │          │    
────────────┼───────┼─────────┼──────────┼──────────┼────────
private     │   +   │         │          │          │    

+ : accessible
blank : not accessible
</pre>

---
![alt text](https://i.stack.imgur.com/niONO.png)


### public
Public member is accessible to anyone, from anywhere.
### private
Private member is accessible to this class only.  
Even inheriting class can't access it!
### protected
Protected member is accessible to:
- classes/interfaces from same package
- inheriting classes, even from different package
### default / package-private 
When no modifiers present, member has *`default-access`*.  
Only classes from same package can access it.

Top level types can only be `public` or *`default-access`*.  
Inheriting class in a different package can’t access protected members of its base class **using reference
variables**.

## static
You can access `static` members via object reference, and even if it is `null`! Example:
```
class Abc {
    static int x;
}
Abc.x; // normal/preferred way of accessing static member

Abc abc = new Abc();
abc.x; // access via reference

abc = null;
abc.x; // access via reference which is null, won't throw exception!
```

---

# Exam specifics

- **Missing package and import statements** and question doesn’t explicitly refer to them? Assume that all sample code is in the same package, and import statements exist to support them.
- ignore folder layout
- ignore line wrapping
























