
# JVM

Write once, run everywhere!  
That's the holy grail of software development.  
Code needs to be independent of hardware(~assembly, e.g. x86 vs ARM),
and of operating system (e.g. Windows vs Linux threads).

Java as a platform succeeds at that via bytecode + JVM.  
Bytecode is a "universal assembly", and JVM is runtime/"machine"/program that executes those bytecodes.

Bytecodes are written in a binary format in `.class` files.  
JVM loads those files as needed and executes your program.  
Other languages besides Java: Scala, Kotlin, Groovy also compile to Java bytecode and run flawlessly on JVM.


## Data types
There are two types: primitive and reference types.  
There are special instructions for primitive types, e.g. iadd, fadd, dadd.
Reference type values/objects are either dynamically allocated (`new Abc`) or arrays.
References(~pointers) have type `reference` in JVM.

## Primitive types
These are 
- numeric:
    - integral: `byte`, `short`, `int`, `long`,  `char`  
    Default for all except char is `0`, for char is utf-16 `\u0000`
    - floating point: `float`, `double`
- boolean (default `false`)
- returnAddress are *pointers to opcodes* (used for return, jump..).



