
You need to install 2 things: DCEVM and HotswapAgent.

# DCEVM
- download https://github.com/dcevm/dcevm/releases 
- must use **exact version of JDK** for given DCEVM !!!
- install `java -jar DCEVM-installer.jar` (add as altjvm)

# HotswapAgent
https://github.com/HotswapProjects/HotswapAgent/releases
- download JAR an put it somewhere..
- add VM args `-XXaltjvm=dcevm -javaagent:$PATH_TO_AGENT/hotswap-agent.jar`

# Run
Run app in **Debug mode**.


## Tomcat
Must "Never publish automatically" in Eclipse.
