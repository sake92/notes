
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
Classpath is a list of URLs (can be a directory, a JAR, a `.class` file) where JVM should *search for `.class` files*.  
Default value (if not specified) is current folder, equivalent to: `java -cp .` .

https://docs.oracle.com/javase/8/docs/technotes/tools/windows/classpath.html

You can print it easily:
```java
String classpath = System.getProperty("java.class.path");
String[] classpathEntries = classpath.split(File.pathSeparator);
System.out.println("CLASSPATH: " + Arrays.asList(classpathEntries));
```

Classpath ROOT (can be more of them) is the root of a classpath entry.  
E.g. if your classpath is `.:/var/whatever`, classpath roots are `.` (current folder) and `/var/whatever`. I think... :D
https://stackoverflow.com/a/49876435/4496364

When you require something from classpath, it **searches locations in order they are defined**.  
E.g. if you have two classes with same name, the first one found will be loaded. Same is applied for files etc.  
See https://stackoverflow.com/a/6935725/4496364

#### Recursively add all JARs from a folder?
Lets say you have this structure:
- lib/
  - example1.jar
  - example2.jar
  - a/
    - a1.jar
  - b/
    - b1.jar

This is what `-cp` does:
- `-cp lib/*` adds **example1.jar** and **example2.jar** 
- `-cp lib/*:lib/a/*` adds example1.jar, example2.jar and a1.jar

#### Windows command line too long..
1. use the trick above with `-cp myjars/*`, or  
2. make a "path jar", where you specify all the dependencies:  
http://todayguesswhat.blogspot.com/2011/03/jar-manifestmf-class-path-referencing.html

https://stackoverflow.com/a/9053165/4496364

### `classLoader.getResource` vs `getClass.getResource`

https://stackoverflow.com/questions/14739550/difference-between-getclass-getclassloader-getresource-and-getclass-getres


### IO streams

IO `*{Input,Ouptut}Stream`s (like `InputStream`, `BufferedOutputStream`) are used for R/W **binary data**.

IO `*{Input,Ouptut}{Reader,Writer}`s (like `FileWriter`, `BufferedReader`) are used for R/W **character data**.

