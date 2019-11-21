# DC-project
This is a project for Distributed computing class. It is a sticky notes web application. 
# Application requirements
## Functional requirements
In this application the user has to be able to register an account, where he will get an email response in order to be able to confirm the registration. Once the user has registerd an account, he is able to login into the applicaiton. Once the user is logged in the user may create a new sticky note, wich contains a title, body and an optional due date. All the sticky notes are editable and deletable. User can also filter the notes depending on their date status (future/past). The displayed noted should be paginated to siplify the UI. The notes are sharable. To be able to share the user is able to create a group and invite other users to the group. The user should be able to dinamicly translate the notes to a chosen language. 

## Techincal requirements
This aplication requires a database to store the data of the notes somewhere. Since we want miltiple users to be able to use the application seperatly, authentication is required. Every note should have a user that it belongs to. For the user to be able to access their notes, they must first authenticate, for wich the application uses cookies. On the server side all the passwords are hashed and salted. The REST endpoints are not accessible if the client is not authenticated (return Unauthorized). The notes filter should be able to filter by multiple criteria. Client will send requests to fetch the notes to the server by also specifying the page in pagination.

# Study of existing frameworks
Comparisson of tools used for the develovpment of the project

## Backend
| Language/Framework | Speed | Small overhead | Compiled | Familarity |
| --- | --- | --- | --- | --- |
| Rust | <ul><li>- [x] </li></ul> | <ul><li>- [ ] </li></ul> | <ul><li>- [x] </li></ul> | <ul><li>- [x] </li></ul> |
| Java | <ul><li>- [ ] </li></ul> | <ul><li>- [ ] </li></ul> | <ul><li>- [x] </li></ul> | <ul><li>- [x] </li></ul> |
| NodeJS | <ul><li>- [ ] </li></ul> | <ul><li>- [x] </li></ul> | <ul><li>- [ ] </li></ul> | <ul><li>- [x] </li></ul> |

Even with the develovpment overhead that comes with rust programming language, it has been chosen for backend due to the speed that it provides. Rust’s type system and ownership model also guarantee memory and thread safety.

## Frontend
| Language/Framework | Performance |  Size | Provided utilities | Familarity |
| --- | --- | --- | --- | --- |
| Angular8 | <ul><li>- [ ] </li></ul> | <ul><li>- [ ] </li></ul> | <ul><li>- [x] </li></ul> | <ul><li>- [x] </li></ul> |
| React | <ul><li>- [ ] </li></ul> | <ul><li>- [x] </li></ul> | <ul><li>- [ ] </li></ul> | <ul><li>- [ ] </li></ul> |
| Vue | <ul><li>- [x] </li></ul> | <ul><li>- [x] </li></ul> | <ul><li>- [ ] </li></ul> | <ul><li>- [ ] </li></ul> |

Due to the fimilarity with the framework, Angular 8 has been chosen for develovpent of the frontend.

# Application architecture

# Techincal choices
Since the application is small SQLite database was chosen, due to it being lightweight. For ORM the aplication uses [diesel](https://github.com/diesel-rs/diesel) since it provides a good support to SQLite. Diesel gets rid of the boilerplate for database interaction and eliminates runtime errors without sacrificing performance. It takes full advantage of Rust's type system to create a low overhead query builder. For authentication (password hashing and user verification) the application uses [argonautica](https://github.com/bcmyers/argonautica) that is a Rust crate for hashing passwords using the cryptographically-secure Argon2 hashing algorithm.
# Tests and implementation
# Conclusion


