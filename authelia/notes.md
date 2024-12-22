# client id and client secret generation

docs:
https://www.authelia.com/integration/openid-connect/frequently-asked-questions/#how-do-i-generate-a-client-identifier-or-client-secret


client id generation:
```bash
docker run --rm authelia/authelia:latest authelia crypto rand --length 72 --charset rfc3986
```

client secret generation:
```bash
docker run --rm authelia/authelia:latest authelia crypto hash generate pbkdf2 --variant sha512 --random --random.length 72 --random.charset rfc3986
```