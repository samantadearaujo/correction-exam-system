# Exams

DBML
![dbml](https://user-images.githubusercontent.com/57687300/89142442-58effc00-d53f-11ea-8819-aa4316d67971.png)


###### API

Request API´s:
| Method | Description | Exemple
|---|---|---|
|---| USER PROFILE |---|
| `GET` | Return all info | api/usersprofiles/ |
| `GET` | Return only  | /api/usersprofiles/:id |
|---| USER |---|
| `GET` | Return all info | api/users/ |
| `GET` | Return all infoReturns information from a record | api/users/:id |
| `POST` | Used to create a new record.| api/users/ |
| `PUT` | Used to change a registry data.| api/users/:id |
`DELETE` | Used to remove a record.| api/users/:id |
|---| THEME |---|
| `GET` | Return all info | api/themes/ |
| `GET` | Return all infoReturns information from a record | api/themes/:id |
| `POST` | Used to create a new record.| api/themes/:id |
| `PUT` | Used to change a registry data.| api/themes/:id |
`DELETE` | Used to remove a record.| api/themes/:id |
|---| EXAMS TEMPLATE|---|
| `GET` | Return all info | api/templates/ |
| `GET` | Return all infoReturns information from a record | api/templates/:id |
| `POST` | Used to create a new record.| api/templates/:id |
| `PUT` | Used to change a registry data.| api/agents/:id |
`DELETE` | Used to remove a record.| api/agents/:id |
|---| EXAMS QUESTIONS |---|
| `GET` | Return all info | api/questions/ |
| `GET` | Return all infoReturns information from a record | api/questions/:id |
| `POST` | Used to create a new record.| api/questions/:id |
| `PUT` | Used to change a registry data.| api/questions/:id |
`DELETE` | Used to remove a record.| api/questions/:id |
|---| EXAMS ANSWER |---|
| `GET` | Return all info | api/answers/ |
| `GET` | Return all infoReturns information from a record | api/answers/:id |
| `POST` | Used to create a new record.| api/answers/:id |
| `PUT` | Used to change a registry data.| api/answers/:id |
`DELETE` | Used to remove a record.| api/answers/:id |
|---| EXAMS |---|
| `GET` | Return all info | api/exams/ |
| `GET` | Return all infoReturns information from a record | api/exams/:id |
| `POST` | Used to create a new record.| api/exams/:id |
| `PUT` | Used to change a registry data.| api/exams/:id |
`DELETE` | Used to remove a record.| api/exams/:id |
|---| STUDENTS |---|
| `GET` | Return all info | api/students/ |
| `GET` | Return all infoReturns information from a record | api/students/:id |
| `POST` | Used to create a new record.| api/students/:id |
| `PUT` | Used to change a registry data.| api/students/:id |
`DELETE` | Used to remove a record.| api/students/:id |
|---| CLASSES |---|
| `GET` | Return all info | api/classes/ |
| `GET` | Return all infoReturns information from a record | api/classes/:id |
| `POST` | Used to create a new record.| api/classes/:id |
| `PUT` | Used to change a registry data.| api/classes/:id |
`DELETE` | Used to remove a record.| api/classes/:id |


##Folder's

![folder](https://user-images.githubusercontent.com/57687300/89144236-0a456080-d545-11ea-80e1-a7cb4b7fb2d7.png)


## Namespaces 

Acounts - There are the profiles and users of the systems.
Students - It is separated to qualify the type of common user of the system.
Templates - Everyone is organized regarding exams.
Classes - is the group of students in the same class.

## Error
In case of failure an unhandled error, a third-party event log is generated. Returning a friendly message.

![actions]

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `npm install` inside the `assets` directory
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
