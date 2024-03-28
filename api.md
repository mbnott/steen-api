# Summary
This relatively simple restful API allows consultation and modification of the data stored in the steen database.
## Request headers
### `Authorization`
This header must contain your authorization token given upon logging in or registering. It is **required** for every request to endpoints, except _log in_, _register_, and _welcome_. Should your fail in giving a valid token, you will be met with a `401 Unauthorized` response.  
It must follow this format:

| Header          | Value            |
|-----------------|------------------|
| `Authorization` | `Bearer [token]` |
## Request body
Endpoints that require user input like `email` or `password` will ask for raw `JSON` data, usually in the form of an `stdObject` with defined properties. The appropriate structure is shown for each endpoint further in this documentation. Should you forget or misinput one of these fields, you will be met with a `400 Bad Request` response.
# Endpoints
## Index

## Accounts
### <span style="color:#FD0">**POST**</span> Log in
```
http://steen.api/account/login
```
Attempts to log the user in with the given credentials, returning their `id` and a `token` if successful.
#### Request
##### Headers
`Authorization` - **required**
##### Body
Fields that allow user authentication.
- `<email>` is a required `string` object. Any length is allowed.
- `<password>` is a required `string` object. Any length is allowed.  
```json
{
    "email" : <email>,
    "password" : <passwod>
}
```
#### Responses
##### <span style="color:#F00">**400**</span> Bad Request
Given if one of the required fields is missing.
##### <span style="color:#F00">**401**</span> Unauthorized
Given if the data given does not coincide with the stored fields.
##### <span style="color:#0F0">**200**</span> OK
Given if all fields are present and matches with the stored database fields.  
The response body will return the user's `<userid>` and a new `<token>`.
It is in ``JSON`` format, with the header `content-type/json`
###### Body
```json
{
    "id": <userid>,
    "token": <token>
}
```
###### Headers

| Header         | Value              |
|----------------|--------------------|
| `Content-Type` | `application/json` |


## Games
