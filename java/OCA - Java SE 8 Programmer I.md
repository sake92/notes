
## Reference and primitive type
Type usually refers to `class`, `interface` or `enum`.  
Although primitives are also referred to as types (`int`, `char`, `boolean`).

---
## Identifier
Identifier is a variable, method or type **name**.  
It can:
- start with (and contain) a letter, underscore (`_`) or a currency sign (`$`, `€` ...)
- contain digits

It can't:
- start with a digit
- contain special characters like dot, comma, slash etc
- be equal to a reserved word like `class`, `int`, `public` etc

---
## Variable
Objects can be `null`, primitives can't.  
Both support assignment operator (`=`).  

Primitives can be compared with `==`.  
But when objects are compared with `==` you compare their "physical addresses". You should probably use `equals` method instead.

Final variable can only be **assigned once**.

### Object
Objects have special operator `new` for allocating memory for a new object.  
They get *automatically destroyed* after their use by GC, so you don't have to worry about that.  
Object member variables are called *instance variables*/*attributes*.

### Primitive
Primitives have fixed set of values they can hold.  
Literals are "literal values" in **source code**, e.g. `5`, `true`, `1.25_123` etc.  
As you've seen, you can use **underscores to separate 2 digits** for *readability*, e.g. `10_000.0_144`.  
Default number system is decimal. Use `0b`/`0B` prefix for binary number literal, `0` for octal and `0x`/`0X` for hexadecimal. E.g. `0B1010` is `10` in decimal.

Primitives can be manipulated with special operators like `++`, `>=`, `/`, `%=` etc.  

You can assign a "smaller" primitive to "bigger", e.g. `int` to `long`.
```
int intt = 5;
long longg = intt;
intt = longg; // won't compile, can't fit long into int
intt = (int) longg; // forced cast to int
```

Dividing an integer with zero throws an exception, while dividing a real number returns `Infinity`!

#### Operator
You **can compare numeric primitives** (everything except `boolean`), where values are widened as needed. E.g. if you compare `int` and `short`, `short` will be widened to `int`.  
You can't compare numeric with booleans.

Logical operators `&&` and `||` are "lazy"/"short-circuit".  
E.g. in condition `(a && b)`, if `a` is `true`, b will be ignored (not evaluated at all!).
```
if(true && b++) // b++ not evaluated!
if(true && b()) // b() not evaluated!
```

#### Wrapper, (auto)(un)boxing
Every primitive type has corresponding immutable wrapper class, e.g. `int` has `Integer`, `boolean` has `Boolean`.  
Act of automatically converting a primitive to its wrapper object is called **(auto)boxing**: 
```Integer i = 5;```

Reverse way (wrapper to primitive) is **unboxing**:
```
List<Integer> ints = Arrays.asList(1, 2, 3);
int sum = 0;
for (Integer i : ints) {
    sum += i; // unbox Integer `i` to int
}
```

Only values created with `valueOf` are cached (e.g. `Integer`'s -128 to 127)!

---
### Array
Array **size cannot be changed** once it's initialized.  
You **must specify size** of array when creating it.  
Arrays can be arbitrary nested ({1,2,3,...} - dimensional).

Array items are **initialized to their defaults**, `int`s to zeros, `boolean`s to `false`, objects to `null`s. 
E.g. `int[] nums = new int[5];` will initialize array `nums` with 5 zeros.

Watch out for c-like syntax that's permitted in Java, e.g.
`int[] nums[]` is same as `int[][] nums` (2-dimensional array).

The `ArrayIndexOutOfBoundsException` is thrown if you try to access non-existing index, e.g. `-3` or some `index >= arr.length`.

Array has a *property* (**not a method**!) called `length` that returns, well.. the length of array. :)  
Array extends `Object` class, so it has all its methods like `equals`, `clone` etc.

#### Varargs
You can only have **one varargs per method/constructor**.  
Varargs must come as **last parameter**. E.g:
```
void bla(String abc, int... args) { }
bla("fdsf", 1, 2);
bla("fdsf");

MyClass(int... args) { }
```
Varargs are treated as **arrays**! So, `int...` is actually `int[]`.

---
## Method

### Shadow
You can **shadow a field** with local variable. That's why you can use same name for different variables in setters.

You can **shadow a static method** in a subtype.  
Method is resolved depending on the **type through which it is called**.

### Override
`final` methods can't be overriden.  

You can't override a method and specify a **more restrictive access**. E.g. if a method i superclass is `protected` you can't override it with `private` or package-private modifier (you wouldn't fulfill the promise from superclass...).

### Overload
Overloading method means having a method with **same name** but **different parameters**.  
Return type doesn't matter! Example overloads:
```
String bla(int i) {
    return "int";
}
Object bla(short i) {
    return "short";
}
void bla(Object i) {
    System.out.println("Object");
}
```

### Local variable
If you attempt to use an **uninitialized local variable**, your code will fail to compile. 

---
## parameter vs argument
Parameters are **variables** that appear in the definition of a method.  
Arguments are **actual values** that are passed to a method while executing it.

```
void abc(String param1) {} // param1 is parameter

abc(arg1) // arg1 is argument
```

Arguments are **always passed by value** (copied).  
Whether it's a primitive or reference, you can't change its value (outside of method scope). Example with primitive:
```
public static void main(String... args) {
    int i = 1;
    changePrimitive(i);
    System.out.println(i); // 1
}
static void changePrimitive(int i) {
    i = 5; // here is 5, we change copy of i
}
```
Example with reference/object:
```
 public static void main(String... args) {
    MyClass obj = new MyClass();
    obj.x = 1;
    changeReference(obj);
    System.out.println(obj.x); // 7
}

static void changeReference(MyClass obj) {
    obj.x = 7;
    obj = new MyClass(); // changed obj local to this method
    obj.x = 3;
}

class MyClass {
    int x;
}
```

---
## constructor
Every class has a constructor.  
If it does not declare one **explicitly** it will get one **implicitly**, with no arguments ("noargs" constructor).

You don't specify a **return type** when writing constructor:
```
class MyClass {
    public MyClass() {
        // body of constructor
    }
}
```
You can call **super constructor**, from inherited class. Default behavior is calling `super()` from `Object` class. Previous constructor is equivalent to this:
```
public MyClass() {
    super();
}
```

Or, you can call **another constructor** (only one! - of course) from current one, but it must be the first line. This is also called **constructor chaining**.  
```
public MyClass(int i) { }
public MyClass() {
    this(0);
}
```

---
## Initializer

### Static (class) initializer
Static initializer is run when the class is loaded.  
That means **first time it is referenced** in code, starting from main method (or with `Class.forName("a.b.MyClass")` method, explicitly).

### Object initializer
Initializers are run **before every constructor**:
```
public class Constructors {
    {
        System.out.print("INIT ");
    }

    public Constructors() { System.out.println("cons"); }

    public static void main(String[] args) {
        new Constructors(); // INIT cons
    }
}
```
If there are **multiple** initializers, they are run **in order they're defined**.

---
## package
Class with no **explicit** package will be in the *default package* which doesn't have a name.  
Members of **named packages** can’t access anything
from the default package.

---
## import
Everything from `java.lang` package is **always imported**.  
Bulk import, e.g. `import mypackage.*` imports that package only, not its subpackages.  
You can `import static` static members of a type (class/interface/enum).

---
## type
Every **top-level public type** must be defined in its own file, and the file name must be the same!  
E.g. `class MyClass` must be in a file `MyClass.java`.  

Top-level types can only be public or package-private.

You **can have non-public types** defined in that file!  
You **can** use non-public classes from same package!

---
## class
Class' member variables are called *class variables* or `static` fields.  
`final class` can't be extended.

---
## interface
Default modifiers of an interface method are `public abstract` (you don't have to type it), which means you must implement it in a class.  
Interface **can have** `static` methods.  
Interface **can have** `default` methods (doesn't have to be `override`n in class).  

If a you need to resolve an ambiguous method, you can call super-interface method with following syntax: `SuperInterface.super.myMethod()`.

---
## Applications / main method
Entry point to a program must be defined as one of these: 
- `public static void main(String args[])` or  
- `public static void main(String... args)`, where `String...` is varargs syntax.

Any other signature is not valid entry point.  
Variable `args` can have arbitrary name.  
Keywords `public` and `static` are interchangeable.

---
## Access modifier
<pre>
            │ Class  │ Package │ Subclass │ Subclass │ World
            │ itself │ (same)  │(same pkg)│(diff pkg)│ 
────────────┼────────┼─────────┼──────────┼──────────┼────────
public      │   +    │    +    │    +     │     +    │   +     
────────────┼────────┼─────────┼──────────┼──────────┼────────
protected   │   +    │    +    │    +     │     +    │         
────────────┼────────┼─────────┼──────────┼──────────┼────────
no modifier │   +    │    +    │    +     │          │    
────────────┼────────┼─────────┼──────────┼──────────┼────────
private     │   +    │         │          │          │    

+ : accessible
blank : not accessible
</pre>

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

---
## static
You can access `static` members via (class) object reference, and even if it is `null`! Example:
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

You **can not** access it through an **object treated as interface**. You must use "normal" syntax `MyInterface.myMethod()`.  

Static methods **can not** refer to non-static methods/variables, because there's no object associated with `static` method (there is no implicit `this`, no context).  
Reverse is possible, non-static can use static stuff.

---
## String
`String` is an immutable class. You can't `extend` it, can't update it, can only get a new string.  

If you need mutability/performance, use `StringBuilder` and at the end do a `toString` to get a final string.

String literals are cached, so `"abc" == "abc"` but `"abc" != new String("abc")`.  
You should compare strings with `equals` but beware these questions on exam.

Value of `null` is printed as string `"null"`;

Method `replace` replaces a string literally, `replaceAll` replaces a regex pattern...

---
## equals and hashCode

### equals
Method `equals` implements an **equivalence relation** on **non-null object references**. For any non-null reference values `x`, `y`, `z`, `equals` has the following properties:
- reflexive: `x.equals(x) == true`
- symmetric: `x.equals(y) == true` iff `y.equals(x) == true`.
- transitive: if `x.equals(y) == true` and `y.equals(z) == true`, then `x.equals(z)` should return `true`
- consistent: multiple invocations of
`x.equals(y)` consistently return `true` or consistently return `false`, provided *no **information used in `equals()`** comparisons on the objects is **modified***.
- `x.equals(null) == false`

### hashCode
Method `hashCode` is used by some collection classes that use
key-value pairs (hashtables), where a **key is an object**. They use `hashCode`
of a key to **search efficiently** for the corresponding value. The `hashCode` of the key is used to **specify a bucket number**, which should store its corresponding
value.  When they find the right bucket, then they call the `equals` method to select the correct value object.

The hashCode values of **two distinct objects** can be the **same**!

---
## Exception

### Hierarchy
- `Throwable`
    - `Error`
    - `Exception`
        - `RuntimeException`

In the root of exception/error hierarchy is the `Throwable` class (something that can be thrown, by JVM itself or with `throw` statement).  
Only `Throwable` instances can be `catch`ed.

#### Error
`Error`s are thrown by `JVM` and generally **shouldn't be catched** in user code at all.  
These classes usually have name ending with "Error", like `StackOverflowError`.

#### Checked exception
Any subclass of `Throwable` that is not an `Error` or `RuntimeException` is a **checked exception**.

Checked exceptions are **treated specially by compiler**.  
They must be **either catched or declared** in method/constructor signature with `throws` clause.  
Code will not compile if you don't respect those rules.

#### Runtime (unhecked) exception

Runtime exceptions, errors and throwables **can also be declared in `throws`** (not required of course), beware on exam!

### Catching
The `catch` clause inspects the **order of catched exceptions**, the first one that matches the type gets executed.  
E.g. you **can't** `catch` a base class **and then catch its subtype**, that makes no sense.

### Finally-zing
The `finally` block gets called **no matter an exception is thrown, catched or not catched**!!! This is very important to remember.  
A `finally` block is used to define **cleanup code**, to close/release resources (file handles, database connections).

### Try-catch-finally gotchas
If **both** the catch and finally blocks define return statements, value will be returned **from the finally block**!

Finally block **can mutate object fields**!  
Finally block **can't mutate value returned from try or catch**!

---
## Classfile
Class files, files with `.class` extension must be located in folders that mimic package structure.  
E.g. a `class MyClass` defined in package `com.example` must have path like `com/example/MyClass.class`.  
That's because classes are usually loaded with a URL-based classloader.

---
# Exam specifics

- **Missing package and import statements** and question doesn’t explicitly refer to them? Assume that all sample code is in the same package, and import statements exist to support them.
- ignore folder layout
- ignore line wrapping
