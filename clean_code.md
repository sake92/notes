
# Clean Code

These are mostly notes from the classic "Clean Code" by Uncle Bob.




## Names
Use meaningful variable/function/class names.  


1. Don't use **magic constants**. Always make a variable. Easier to refactor later!
1. Use descriptive names: `userPhone`, `customerId`.. Don't make me guess!
1. Don't prefix interfaces with `I`, e.g. `IMyService`.. Why should a user care that's an interface???
1. You can use single-letter name but only in a **narrow context**, lambda or a for loop..
1. Don't encode type in the name, e.g. `userString`... We have compilers now!
1. Be **consistent**! If you used `UserRepo::findByName()`, don't make `UserRepo::getByEmail()`.. it's confusing and rude! :D
1. Avoid **redundant information**! If you have `class UserRepo`, why would its method be called `findUsers()` and not just `find()`?  
We *already know* it is a *user repo*!!


## Functions
1. Do **one thing**!
1. Smaller - the better!
1. Less parameters - the better! (make a class for grouping them! bonus: easier refactoring)
1. Avoid side effects
1. Keep the same **level of Abstraction** in a function!  
If you're talking about cars, you shouldn't suddenly jump to atoms!  
Same with controller->regex-parser e.g.
1. If you side-effect, don't return a value; If you query, don't side-effect! (command-query separation)  
Although Java violates this one regularly, e.g. `int remove(Object o)`
1. Minimize use of switch statements. Preferably only in factory methods!  
That's because if you use them extensively, you have to update switches all over the place when you add another case!! Compared to polymorphic class/interface where you don't have to! :)
1. Prefer exceptions to error codes! Happy path is much easier to read/understand.  
Codes poison your calling methods.. `if(myFun() == OK)..` all over the place. Unless you use a Monad or some wrapper with utility methods, but then you propagate that special type.. (`Optional<T>` for example) :D


## Comments
Use them only when you **really have to**!

1. Clarifications to unusual/specific/performace-related code is ok
1. Warnings are ok..
1. TODOs are ok (usually link the issue or something..)
1. Javadocs are **great**!
1. Don't comment out code, delete it!

## Formatting
1. Use company/project-wide settings and obey them! Commit it to git, or put into Jira somewhere.  
1. Use automatic formatter if possible, a Git hook or something.
1. One blank line between functions/classes
1. Declare variable **near to its usage**!
1. Line length should be 80+, I prefer 120
1. Put related functions near each other. I prefer to put private ones on the bottom


## Objects
Procedural code makes it **hard to add new data structures** because all the functions must
change.  
OO code makes it **hard to add new functions** because all the classes must change.
(Wadler's problem? typeclasses, visitors)

Also https://en.wikipedia.org/wiki/Law_of_Demeter (not that important IMHO)



## Error handling
1. Use exceptions! This is not C, you have a powerful mechanism at your hands.  
1. Use **unchecked exceptions**! Checked ones just clutter your method signatures and don't add much value to your code...
1. Log the errors!!!
1. Don't return `null`!!! Use null-object pattern, empty list/map, `Optional<T>` or throw exception..
1. Don't pass `null`! Try to find another way, overload function etc.









