
JWT in a nutshell is a URL-safe string. 
It contains three Base64url strings separated by dots.
E.g. eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsb2dnZWRJbkFzIjoiYWRtaW4iLCJpYXQiOjE0MjI3Nzk2Mzh9.gzSraSYS8EXBxLN_oWnFSRgCzcmJmMjLiuyu5CSpyHI 
Example can be decoded at https://jwt.io/

First part is header, which includes signature algorithim used.

Second is payload (also called claims), the body of JWT. 
Here we can put arbitrary data, so we should use it to transfer data.

Third part is signature, which is used to confirm that JWT/data is valid.
To confirm the signature is valid, you must use the same *secret* key (signing key).

One popular library for Java is https://github.com/jwtk/jjwt
There are probably similar libs for iOS also, e.g. https://github.com/kylef/JSONWebToken.swift.




