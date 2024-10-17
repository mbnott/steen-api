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
### <span style="color:#FF0">**POST**</span> Log in
```
http://steen.api/account/login
```
Attempts to log the user in with the given credentials, returning their `id` and a `token` if successful.
#### Request
##### Headers
None.
##### Body
Fields that allow user authentication.
- `<email>` is a required `string` object. Any length is allowed.
- `<password>` is a required `string` object. Any length is allowed.  
```json
{
    "email" : <email>,
    "password" : <password>
}
```
#### Responses
##### <span style="color:#F00">**400**</span> Bad Request
Given if one of the required fields is missing.
##### <span style="color:#F00">**401**</span> Unauthorized
Given if the data given does not coincide with the stored fields.
##### <span style="color:#0F0">**200**</span> OK
Given if all fields are present and matches with the stored database fields.  
The response body will return the user's `<id>` and a new `<token>`.
It is in `JSON` format, with the header `content-type/json`.
###### Body
```json
{
    "id" : <id>,
    "token" : <token>
}
```
###### Headers
| Header         | Value              |
|----------------|--------------------|
| `Content-Type` | `application/json` |

### <span style="color:#FF0">**POST**</span> Register
```
http://steen.api/account/login
```
Register a user to steen, using the data given. Upon success, returns the account's `id` and `token`.
#### Request
##### Headers
None.
##### Body
Fields that represent the registering user's data.
- `<email>` is a required `string` object. Its length must be between 4 and 90 characters.
- `<password>` is a required `string` object. Its length must be between 8 and 200 characters.
- `<username>` is a required `string` object. Its length must be between 4 and 90 characters.
```json
{
    "email" : <email>,
    "password" : <password>,
    "username" : <username>
}
```
#### Responses
##### <span style="color:#F00">**400**</span> Bad Request
Given if one of the required fields is missing.
##### <span style="color:#0F0">**201**</span> Created
Given if all fields are present, valid and have been successfully added to the database.
The response body will return the user's `<id>` and a new `<token>`. It is in `JSON` format, with the header `content-type/json`.
###### Body
```json
{
    "id" : <id>,
    "token" : <token>
}
```
###### Headers
| Header         | Value              |
|----------------|--------------------|
| `Content-Type` | `application/json` |
## Games
### <span style="color:#0F0">**GET**</span> Get games
```
http://steen.api/games
```
Fetches all the games stored in the database.
#### Request
##### Headers
`Authorization` - **required**
##### Body
Fields that allow filtering games.
- `<name>` is an optional, not yet implemented way to filter games based on their name. It will attempt to find the `string` given inside the games name and description.
- `<tags>` is an optional, not yet implemented way to filter games based on their tags. It will only return games that match the given tags. Each tag is separated with a coma.
```json
{
    "name" : <name>,
    "tags" : <tags>
}
```
#### Responses
##### <span style="color:#F00">**401**</span> Unauthorized
Given if no valid token was sent in the `Authorization` header.
##### <span style="color:#0F0">**200**</span> OK
Given if authentication was successful and games were found.
###### Body
```json
[
    {
        "id" : <id>
        "name" : <name>,
        "releaseDate" : <releaseDate>,
        "description" : <description>,
        "devName" : <devName>,
        "note" : <note>
    },
    ...
]
```
###### Headers
| Header         | Value              |
|----------------|--------------------|
| `Content-Type` | `application/json` |
### <span style="color:#FF0">**POST**</span> Add game
```
http://steen.api/games
```
Adds a game to Steen.
#### Request
##### Headers
`Authorization` - **required**
##### Body

```json
{
    "name" : <name>,
    "releaseDate" : <releaseDate>,
    "description" : <description>
}
```
#### Responses
##### <span style="color:#F00">**400**</span> Bad Request
Given if a field was incorrect in the creation.
##### <span style="color:#F00">**401**</span> Unauthorized
Given if no valid token was sent in the `Authorization` header.
##### <span style="color:#F00">**500**</span> Internal Server Error
Given if an unhandled error happened during the insertion of the game.
##### <span style="color:#0F0">**201**</span> Created
Given if game creation was successful.
###### Body
```json
{
    "message" : "Game successfully added!",
    "id" : <id>
}
```
###### Headers
| Header         | Value              |
|----------------|--------------------|
| `Content-Type` | `application/json` |
### <span style="color:#0F0">**GET**</span> Get game
```
http://steen.api/games/{id}
```
Fetches the data of a single game. `{id}` specifies the id of the game to fetch.
#### Request
##### Headers
`Authorization` - **required**
##### Body
None.
#### Responses
##### <span style="color:#F00">**401**</span> Unauthorized
Given if no valid token was sent in the `Authorization` header.
##### <span style="color:#F00">**404**</span> Not Found
Given if the game doesn't exist.
##### <span style="color:#0F0">**200**</span> OK
Given if game was returned successfully.
###### Body
```json
{
    "id" : <id>
    "name" : <name>,
    "releaseDate" : <releaseDate>,
    "description" : <description>,
    "devName" : <devName>,
    "note" : <note>
}
```
###### Headers
| Header         | Value              |
|----------------|--------------------|
| `Content-Type` | `application/json` |
### <span style="color:#F00">**DELETE**</span> Delete game
```
http://steen.api/games/{id}
```
Deletes the data of a game. `{id}` specifies the id of the game to delete.
#### Request
##### Headers
`Authorization` - **required**
##### Body
None.
#### Responses
##### <span style="color:#F00">**401**</span> Unauthorized
Given if no valid token was sent in the `Authorization` header.
##### <span style="color:#F00">**403**</span> Forbidden
Given if the authenticated user is not the author of the game, or isn't an administrator.
##### <span style="color:#F00">**404**</span> Not Found
Given if the game doesn't exist.
##### <span style="color:#F00">**500**</span> Internal Server Error
Given if an unhandled error happened during the deletion of the game.
##### <span style="color:#0F0">**200**</span> OK
Given if the game was successfully deleted.
###### Body
```json
{
    "message" : "Game successfully deleted!"
}
```
###### Headers
| Header         | Value              |
|----------------|--------------------|
| `Content-Type` | `application/json` |
### <span style="color:#0F0">**GET**</span> Get reviews
```
http://steen.api/games/{id}/reviews
```
Fetches all the reviews of a game. `{id}` specifies the id of the game to get reviews.
#### Request
##### Headers
`Authorization` - **required**
##### Body
None.
#### Responses
##### <span style="color:#F00">**401**</span> Unauthorized
Given if no valid token was sent in the `Authorization` header.
##### <span style="color:#F00">**404**</span> Not Found
Given if the game doesn't exist.
##### <span style="color:#0F0">**200**</span> OK
Given if the reviews were successfully returned.
###### Body
```json
{
    "id" : <id>,
    "note" : <note>,
    "creationDate" : <creationDate>,
    "description" : <description>,
    "authorId" : <authorId>,
    "authorName" : <authorName>,
    "gameId" : <gameId>,
    "gameName" : <gameName>
}
```
###### Headers
| Header         | Value              |
|----------------|--------------------|
| `Content-Type` | `application/json` |
### <span style="color:#FF0">**POST**</span> Add review
```
http://steen.api/games/{id}/reviews
```
Add a review to a game with his id.
#### Request
##### Headers
`Authorization` - **required**
##### Body
```json
{
    "note" : <note>,
    "description" : <description>
}
```
#### Responses
##### <span style="color:#F00">**400**</span> Bad Request
Given if one of the required fields is missing.
##### <span style="color:#F00">**401**</span> Unauthorized
Given if no valid token was sent in the `Authorization` header.
##### <span style="color:#F00">**404**</span> Not Found
Given if the game doesn't exist.
##### <span style="color:#0F0">**201**</span> Created
Given if review creation was successful.
###### Body
```json
{
    "message" : "Review successfully added!",
    "id" : <id>
}
```
###### Headers
| Header         | Value              |
|----------------|--------------------|
| `Content-Type` | `application/json` |
