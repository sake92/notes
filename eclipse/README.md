

### When "something does not work"
Always try `Maven -> Update Project` or Gradle->update... :)

### Auto deploy static files (without restart) to Tomcat/Pivotal server

Check "Enable JMX reloading" and add to server config these:
"*.ts, *.js, *.js.map" .

If that doesn't work, open `Window -> Preference -> Workspace` and check these:

Build Automatically
Refresh using native...
Refresh on access
