# Summary

## Used headers
### `Authorization`
This header should contain your authorization token given upon logging in or registering. It must follow this format:
| Header        | Value          |
|---------------|----------------|
|`Authorization`|`Bearer [token]`|

# Endpoints
## Index

## Accounts
### <span style="color:#FD0">**POST**</span> Log in
```
http://steen.api/account/login
```
Attempts to log the user in. If successful, returns the user's `id` and `token`
#### Request
##### Headers
`Authorization`
##### Body
Fields that allow user authentification.
- `email` is required. Any length is allowed.
- `password` is required. Any length is allowed.  
```json
{
    "email" : "email",
    "password" : "password"
}
```
#### Responses
##### <span style="color:#F00">**400**</span> Bad Request
Given if one of the required fields is missing.
##### <span style="color:#F00">**401**</span> Unauthorized
Given if the data given does not coincide with the stored fields.
##### <span style="color:#0F0">**200**</span> OK
Given if one of the required fields is missing.
## Games
