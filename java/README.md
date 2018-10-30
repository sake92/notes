
## Quick tips

### Always use (forward)slash for paths

On *NIX systems, path separator is `/`, so you shouldn't have any problems.  
On Windows, oh boy... You need to escape backslash in strings, e.g. for path `C:\foo\uvw` you write "C:\\\\foo\\\\uvw".  
What also makes a problem are *properties files*. When you write to it you get `C:\foo\uvw` but when you read you get an exception telling you it can't figure out `\uvw` escape character... :D  
So, easiest way is when you write to a file, replace all `\` with `/`, `myStr.replace("\\", "/")`;

### Running a JAR

A runnable JAR must have a `MANIFEST.MF` file in it.  
The manifest file must have `Main-Class: com.example.MainClass` field in order to know which class is app's entry point.

### Classpath
Classpath is a list of URLs (directory, a JAR, a `.class` file) where JVM should *search for `.class` files*.  
Default value (if not specified) is current folder, equivalent to: `java -cp .` .

When you require something from classpath, it **searches locations in order they are defined**.  
E.g. if you have two classes with same name, the first one found will be loaded. Same is applied for files etc.  
See https://stackoverflow.com/a/6935725/4496364


### `classLoader.getResource` vs `getClass.getResource`

https://stackoverflow.com/questions/14739550/difference-between-getclass-getclassloader-getresource-and-getclass-getres




