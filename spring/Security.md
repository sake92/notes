
### spring boot security
When you add "spring-boot-starter-security" BASIC-AUTH is **automatically turned on**.  
Password is printed in console when you run the app, and username is "user":
```
> Using default security password: 638fda94-f9b9-4de8-9186-a98a2187750e
```
You can set it in proerties manually:
```
security.user.password=my_password
```

### AntMatchers ordering
The `antMatchers` ordering matters!  
SPECIFIC routes should go first, like it goes through `List<Regex>` and finds first match.  
See https://stackoverflow.com/questions/30819337/multiple-antmatchers-in-spring-security

### Login programatically
https://stackoverflow.com/questions/7900994/programmatically-login-in-a-user-using-spring-security

