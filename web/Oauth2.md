
Oauth2 CLIENT je SERVERSKAAAAAA APLIKACIJAAAAAA (3rd partyyyy)
npr moja app je client fejsbukov...
fejsbuk je tu resource server
fejsbuk je tu authorization server

- najbolji flow je `authorization_code` flow,
  dobiješ taj neki code, i onda na osnovu njega `access_token` i `refresh_token` !!! :)

https://stormpath.com/blog/what-the-heck-is-oauth
https://stackoverflow.com/questions/17427707/whats-the-right-oauth-2-0-flow-for-a-mobile-app

https://spring.io/blog/2018/03/06/using-spring-security-5-to-integrate-with-oauth-2-secured-services-such-as-facebook-and-github  
https://spring.io/guides/tutorials/spring-boot-oauth2/  
https://github.com/ariphidayat/springmvc-oauth2-example

## grant_type: password (user's username/password combination, "obični" login)

POST na http://localhost:8080/oauth/token

HEADERS (basic je base64-encoded client_username:client_password)  
authorization: Basic YWNtZTphY21lc2VjcmV0  
content-type: application/x-www-form-urlencoded

BODY
grant_type=password&username=sake&password=sake


## grant_type: authorization_code (dobijanje tokena pomoću 3rd-party logina itd...)

GET na
http://localhost:8080/oauth/authorize?response_type=code&client_id=acme&redirect_uri=http://localhost:8080  
Kada se korisnik loguje, redirectaće ga na redirect_uri, npr. http://localhost:8080/?code=s3Fn3B  
Zatim se uzme taj code iz URL-a i može se dobaviti access_token:

POST na http://localhost:8080/oauth/token  
BODY  
content-type: application/x-www-form-urlencoded  
grant_type=authorization_code&client_id=acme&redirect_uri=http://localhost:8080&code=s3Fn3B



## grant_type: implicit (isto kao authorization_code)

GET na
http://localhost:8080/oauth/authorize?response_type=token&client_id=acme&redirect_uri=http://localhost:8080

problem: ne može se uradit REFRESH TOKEEEEEEEEEEEN :)







