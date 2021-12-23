
# Cross-Site Scripting

If you have XSS vulnerability, attacker can do whatever he wants:
- trigger AJAX requests in name of user
- do arbitrary JS in user's browser...



- reflected
- stored
- DOM based


## Reflected

It's when you reflect a user input back to him.  
For example at route `/error?text=Something wrong` the webapp renders this html:
```html
<div>Something wrong</div>
```
Attacker can then inject a script in place of text.

You can see that user's input is REFLECTED back to him.  
It can be inside HTML, inside JS code etc.

The input can be query param, form/json param, HTTP header..  
You can use a random string "fofidsjewrewr" as an input, and see in response HTML if it gets returned. :)

This is "first order" XSS.

## Stored

I save some data that everyone can see (a blog post for example).  
If someone opens it, arbitrary <script> can be run.

This one is far more serious because it can affect a lot more users.

This is "second order" XSS.


## DEFENCE


- MOST IMPORTANT: validate output by HTML-encoding particular chars like `< > & ' " ;`
- validate input as much as possible:  
    - enum
    - regex
    - length
    - whatever possible
- DONT put user data in HTML attributes, like EVER:
 <a href="${userInput}">
- allow only one encoding/charset and make XSS protection compatible with it

