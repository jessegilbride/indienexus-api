# IndieNexus API

_A hub for independent music artists to showcase themselves, gain exposure, and connect with fans._

Live app: https://indienexus-client.vercel.app/

Client repo: https://github.com/jessegilbride/indienexus-client

&nbsp;

## Summary
View all artists (without having to log in), register an account, log in as your user, and create an artist profile.

Artist profiles currently allow you to have an artist name, bio (description), and ability to embed a soundcloud track or playlist. (Instructions on page for how to get the embed code.) Once the profile is created, it can be viewed in the list of artists.

&nbsp;

## Technologies used for the API

* Node and Express 
  * Authentication via JWT 
  * RESTful API 
* Testing 
  * Supertest
  * Mocha, Chai
* Database 
  * PostgreSQL
  * Knex.js

&nbsp;
  
## Production Environment

Deployed on [Heroku](https://www.heroku.com/)

&nbsp;

## API Endpoints

### Users Router

```
/api/users

POST  - create a new user
```

&nbsp;

### Auth Router

```
/api/auth/login

POST  - create auth token
```

&nbsp;

### Artists Router
```
/api/artists

GET   - get all artists
POST  - create a new artist
```

>  A new artist contains:
```js
[
  {
    name: String,
    bio: String,
    soundcloud_embed: String                      
  }
]
```

&nbsp;

```
/api/artists/:artist_id

GET   - get artist by id
```
<!-- PATCH  - update an artist by id -->
<!-- DELETE  - remove an artist by id -->
> An artist_id is generated automatically and can be seen in the URL when visiting their page.

&nbsp;

<!-- ```
/api/artists/tags/:tags_list

GET   - get all artists by tags within tag_list
```

&nbsp;

```
/api/artists/search/

GET   - get all artists by search term
``` -->

&nbsp;