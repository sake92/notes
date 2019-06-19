
https://www.html5rocks.com/en/tutorials/cors/

CORS se odnosi samo na browsere, i to samo na skripte!!!  
Kod server->server komunikacije ovaj "problem" ne postoji.

Website foo.com cannot access `bar.com` via script.  
*Same-origin policy* applies only to scripts and fonts.  
Dynamically-loaded scripts, CSS, images work as expected (you use jQuery, Bootstrap, images with no problem, right?).

Websites have the **same origin** if they have the same **protocol**, **host** and **port** !!!  
E.g. `http://foo.com` cannot access `https://foo.com`. (different protocols)

## Request
CORS request **must have** the `Origin` header (e.g. `Origin: http://foo.com`). It is added automatically by the browser.

## Response
It contains various headers prefixed with `Access-Control-`.







