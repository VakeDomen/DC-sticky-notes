# DC-project
This is a project for Distributed computing class. It is a sticky notes web application. 
# Application requirements
[Requirements](https://docs.google.com/document/d/1ShPJ5TvNQGqAfdrfGy3oRNR-eGiTaaTfVFEus0LNAws/edit)
## Functional requirements
In this application the user has to be able to register an account, where he will get an email response in order to be able to confirm the registration. Once the user has registerd an account, he is able to login into the applicaiton. Once the user is logged in the user may create a new sticky note, wich contains a title, body and an optional due date. All the sticky notes are editable and deletable. User can also filter the notes depending on their date status (future/past). The displayed noted should be paginated to simplify the UI. The notes are to be sharable. To be able to share the user is able to create a group and invite other users to the group or make the note public and share the public URI of the note with anyone. The uri of the public notes should be reachable without signing in. The user should be able to dinamicly translate the notes to a chosen language. Also it sould be searchable in public notes dashboard. The user who crates a group should be able to add and remove users from the group. 

## Techincal requirements
This aplication requires a database to store the data of the notes somewhere. Since we want miltiple users to be able to use the application seperatly, authentication is required. Every note should have a user that it belongs to. For the user to be able to access their notes, they must first authenticate, for wich the application uses cookies. On the server side all the passwords are hashed and salted. The REST endpoints are not accessible if the client is not authenticated (return Unauthorized). The notes filter should be able to filter by multiple criteria. Client will send requests to fetch the notes to the server by also specifying the page in pagination, so the server load is smaller.

# Study of existing frameworks
Comparisson of tools used for the develovpment of the project

## Backend
| Language + Framework | Speed | Small overhead | Compiled | Familarity |
| --- | --- | --- | --- | --- |
| Rust + ActixWeb | <ul><li>- [x] </li></ul> | <ul><li>- [ ] </li></ul> | <ul><li>- [x] </li></ul> | <ul><li>- [x] </li></ul> |
| Java + Spring | <ul><li>- [ ] </li></ul> | <ul><li>- [ ] </li></ul> | <ul><li>- [x] </li></ul> | <ul><li>- [ ] </li></ul> |
| NodeJS + Express | <ul><li>- [ ] </li></ul> | <ul><li>- [x] </li></ul> | <ul><li>- [ ] </li></ul> | <ul><li>- [x] </li></ul> |

For backend i have been choosing between three different frameworks, that are based on three different languages respectively.  As i am not very familiar with Spring in Java i decided not to use it. Rust is a systems language, that reaches speeds equivallent to C. Unilike C, Rust’s type system and ownership model also guarantees memory and thread safety, so memory leaks are not something to worry about during devlovpent. On the orher hand, rust compiler is very strict when it comes to compiling code, to ensure memory safety therefore the compile times are very long. Even with the develovpment overhead that comes with Rust programming language, it has been chosen for backend due to the speed that it provides, even though i am also familiar with NodeJS. 

## Frontend
| Language/Framework | Performance |  Size | Provided utilities | Familarity |
| --- | --- | --- | --- | --- |
| Angular8 | <ul><li>- [ ] </li></ul> | <ul><li>- [ ] </li></ul> | <ul><li>- [x] </li></ul> | <ul><li>- [x] </li></ul> |
| React | <ul><li>- [ ] </li></ul> | <ul><li>- [x] </li></ul> | <ul><li>- [ ] </li></ul> | <ul><li>- [ ] </li></ul> |
| Vue | <ul><li>- [x] </li></ul> | <ul><li>- [x] </li></ul> | <ul><li>- [ ] </li></ul> | <ul><li>- [ ] </li></ul> |

Due to the fimilarity with the framework, Angular 8 has been chosen for develovpent of the frontend.

# Application architecture

# Techincal choices
Since the application is small SQLite database was chosen, due to it being lightweight. For ORM the aplication uses [diesel](https://github.com/diesel-rs/diesel) since it provides a good support to SQLite. Diesel gets rid of the boilerplate for database interaction and eliminates runtime errors without sacrificing performance. It takes full advantage of Rust's type system to create a low overhead query builder. For authentication (password hashing and user verification) the application uses [argonautica](https://github.com/bcmyers/argonautica) that is a Rust crate for hashing passwords using the cryptographically-secure Argon2 hashing algorithm. The whole backend is wrapped in [Actix Web](https://github.com/actix/actix-web) web framework. An application developed with actix-web will expose an HTTP server contained within a native executable. You can either put this behind another HTTP server like nginx or serve it up as-is. For all intents and purposes it’s a microframework with a few twists. 

# Tests and implementation
While implementing the backend, the biggest challange was implementing the authentication module and handling all the possible exceptions. For testing the backend i used a tool called [Insomnia](https://insomnia.rest/). Insomnia is a free cross-platform desktop application that eases the interaction with HTTP-based APIs. Insomnia combines an easy-to-use interface with advanced functionality like authentication helpers, code generation, and environment variables. With it i could test all the open endpoints of the web API and check for unforseen interactions. 
At the frontend side, i decided to use the stricy notes application for a TODO list/SCRUM board. I used it while develovping, hoping to ensure, that the product is easily usable and intuitive. Also the usage of the application made me find some bugs, that i otherwise would be able to miss. First thing i develovped was just a grid of notes and "add new" functionality. Than i added notes of functionality, design and bug-fix tasks i have to complete. While adding features to the application i also saw what functionality of the app i most use, so i know what should be improved and made easier in later stages of develovpent.
On the frontend the biggest challange to test was prefix filter implmentation. For the filter I implemented a trie prefix tree, that takes all the notes to filter. After writing something in the search filter box, the tree must collect all the notes that match the filter, ignoring the pagination. The challange was making it dynamic, so after every typed or deleted letter the filter result refreshes. 

# Conclusion


