# Trivia

---
## type
By type we mean `class`, `interface` or `enum`.

---
## identifier
Identifier is a variable, method or type **name**.  
It can:
- start with (and contain) a letter, underscore (`_`) or a currency sign (`$`, `€` ...)
- contain digits

It can't:
- start with a digit
- contain special characters like dot, comma, slash etc
- be equal to a reserved word like `class`, `int`, `public` etc

---
## object vs primitive
Objects can be `null`, primitives can't.  
Both support assignment operator (`=`).  

Primitives can be compared with `==`.  
But when objects are compared with `==` you compare their "physical addresses". You should probably use `equals` method instead.

### object
Objects have special operator `new` for allocating memory for a new object.  
They get *automatically destroyed* after their use by GC, so you don't have to worry about that.

### primitive
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

#### operators
You **can compare numeric primitives** (everything except `boolean`), where values are widened as needed. E.g. if you compare `int` and `short`, `short` will be widened to `int`.  
You can't compare numeric with booleans.

Logical operators `&&` and `||` are "lazy"/"short-circuit".  
E.g. in condition `(a && b)`, if `a` is `true`, b will be ignored (not evaluated at all!).
```
if(true && b++) // b++ not evaluated!
if(true && b()) // b() not evaluated!
```

#### wrappers, (auto)(un)boxing
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
## method

### overload
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

### varargs
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
## Initializers
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

Members of a **named package** can’t access anything
defined in the default package.

You can `import static` static members of a type (class/interface/enum);

---
## import
Everything from `java.lang` package is **always imported**.  
Bulk import, e.g. `import mypackage.*` imports that package only, not its subpackages.

---
## class
Every **top-level public** class must be defined in its own file, and the file name must be the same!  
E.g. `class MyClass` must be in a file `MyClass.java`.

You **can** use non-public classes from same package!

---
## applications / main method
Entry point to a program must be defined as one of these: 
- `public static void main(String args[])` or  
- `public static void main(String... args)`, where `String...` is varargs syntax.

Any other signature is not valid entry point.  
Variable `args` can have arbitrary name.  
Keywords `public` and `static` are interchangeable.

---
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

---
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
## array
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

---
# Exam specifics

- **Missing package and import statements** and question doesn’t explicitly refer to them? Assume that all sample code is in the same package, and import statements exist to support them.
- ignore folder layout
- ignore line wrapping
