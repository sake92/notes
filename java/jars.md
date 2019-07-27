
# JARs

JAR file format is used to *group multiple files* into one file (usually `.class` files, metadata etc). It is actually a zip file.  
It is plain easier to download/upload/(re)move just one file... :)  
Can be created with the `jar` tool, or with `java.util.jar` API.  

## Run app from JAR
Run the main/default class from manifest (see below for details):
```bash
java -jar app.jar
```
Run another class:
```bash
java -cp app.jar ba.sake.MyClass
```

## MANIFEST.MF file
JAR can contain a `META-INF` folder, which contains metadata about JAR.  
`META-INF` folder can contain a `MANIFEST.MF` file.  
Manifest file can specify various things: version, publisher, main class etc.

### JAR main class
The **main class** to be run when JAR is executed ()  
Just put this in the file (or via your build tool):  
```
Main-Class: ba.sake.MyClass
```
The manifest **must end with a new line or carriage return**!  
It will not work without it!

### JAR classpath
The **classpath** to be loaded with the JAR (e.g. other JAR files, dependencies):
```
Class-Path: jar1.jar folder2/jar2.jar
```
JAR files must be on the **local network**, **not within the JAR file** or classes accessible over Internet protocols



### Sealing packages in JAR
Packages in JAR files can be sealed. Sealing a package within a JAR file means that all classes defined in that package **must be found in the same JAR file**.

