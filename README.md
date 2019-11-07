# DC-project
This is a project for Distributed computing class. It is a sticky notes web application. 
# Application requirements
## Functional requirements

## Techincal requirements
This aplication requires a database to store the data of the notes somewhere. Since we want miltiple users to be able to use the application seperatly, authentication is required. 

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


