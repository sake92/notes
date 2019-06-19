
You need to install 2 things: DCEVM and HotswapAgent.

# DCEVM
- download https://github.com/dcevm/dcevm/releases 
- install `java -jar DCEVM-installer.jar`

# HotswapAgent
- download JAR an put it somewhere..
- add VM args `-XXaltjvm=dcevm -javaagent:$PATH_TO_AGENT/hotswap-agent.jar`

# Run
Run app in Debug mode.

http://hotswapagent.org/mydoc_quickstart.html
