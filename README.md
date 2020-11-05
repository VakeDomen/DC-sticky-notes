# DC-project
This is a project for Distributed computing class. It is a sticky notes web application. 
# Installation

This project requires [docker-compose](https://github.com/docker/compose) to be installed on your system. To install docker, you can follow the instructions on the official [website](https://docs.docker.com/).

To setup this project, simply clone the project and move into the project folder.
```
git clone https://github.com/VakeDomen/DC-sticky-notes.git
```
First you need to setup the ```.env``` file for the backend. Move into the ```backend``` directory and make a copy of ```.env.sample``` and rename it to ```.env```. Than open the file and specify the required values. If you are intending to launch the backend in this docker container, you only need to set the ```FRONTEND_ADDRESS``` to ```http://localhost```.
Note that if you cange the ```BIND_ADDRESS```, you will have to also change the ```apiUrl``` environment variable in ```frontend/src/environments/environment.ts```, so the fronend can resolve the cange.
```
cd DC-sticky-notes/backend/
cp .env.sample .env
```
Once you have modified the ```.env``` file, move back to the project root folder.
```
cd ..
```
To build and launch the project run:
```
docker-compose up
```
You may use the ```-d``` flag to run the container in the background. 
Currently the backend is running on the port ```9000``` and frontend on port ```80```.

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

For backend i have been choosing between three different frameworks, that are based on three different languages respectively.  As i am not very familiar with Spring in Java i decided not to use it. Rust is a systems language, that reaches speeds equivallent to C. Unilike C, Rust’s type system and ownership model also guarantees memory and thread safety, so memory leaks are not something to worry about during devlovpent. On the orher hand, rust compiler is very strict when it comes to compiling code to ensure memory safety. Therefore the compile times are very long. Even with the develovpment overhead that comes with Rust programming language, it has been chosen for backend due to the speed that it provides. Even though i am also familiar with NodeJS, I have decided against it. 

## Frontend
| Language/Framework | Performance |  Size | Provided utilities | Familarity |
| --- | --- | --- | --- | --- |
| Angular8 | <ul><li>- [ ] </li></ul> | <ul><li>- [ ] </li></ul> | <ul><li>- [x] </li></ul> | <ul><li>- [x] </li></ul> |
| React | <ul><li>- [ ] </li></ul> | <ul><li>- [x] </li></ul> | <ul><li>- [ ] </li></ul> | <ul><li>- [ ] </li></ul> |
| Vue | <ul><li>- [x] </li></ul> | <ul><li>- [x] </li></ul> | <ul><li>- [ ] </li></ul> | <ul><li>- [ ] </li></ul> |

Due to the fimilarity with the framework, Angular 8 has been chosen for develovpent of the frontend.

# Application architecture
![app-architecture](https://applicationarchitecture.files.wordpress.com/2010/05/f0020-tier-diagram.png)

The architecture of the web application is split into three main tiers. The client tier, server tier and the database tier. The client tier contains the fronetnd application that is written in Angular 8. The server tier is comprised of the dynamic http layer, business logic and the persistance or data access layer. In the http layer, the endpoints of the backend application interface are specified. This is where the server recieves the requests and unpacks them. After unpacking, the server than forwards the data recived through the request to the business layer. This is where the data is interpreted in order to proccess the request. All the data that needs to be fetched/created/edited or deleted in the database is than processed through the persitance layer. In this application the persistance layer is handled by an ORM. 
All of the tiers are able to be hosted at seperate servers and will communicate well, but i have decided to wrap them in a docker container for the sake simplicity of installation and transfer.

# Techincal choices
Since the application is small SQLite database was chosen, due to it being lightweight. For ORM the aplication uses [diesel](https://github.com/diesel-rs/diesel) since it provides a good support to SQLite. Diesel gets rid of the boilerplate for database interaction and eliminates runtime errors without sacrificing performance. It takes full advantage of Rust's type system to create a low overhead query builder. For authentication (password hashing and user verification) the application uses [argonautica](https://github.com/bcmyers/argonautica) that is a Rust crate for hashing passwords using the cryptographically-secure Argon2 hashing algorithm. The whole backend is wrapped in [Actix Web](https://github.com/actix/actix-web) web framework. An application developed with actix-web will expose an HTTP server contained within a native executable. You can either put this behind another HTTP server like nginx or serve it up as-is. For all intents and purposes it’s a microframework with a few twists. 

# Tests and implementation
While implementing the backend, the biggest challange was implementing the authentication module and handling all the possible exceptions. For testing the backend i used a tool called [Insomnia](https://insomnia.rest/). Insomnia is a free cross-platform desktop application that eases the interaction with HTTP-based APIs. Insomnia combines an easy-to-use interface with advanced functionality like authentication helpers, code generation, and environment variables. With it i could test all the open endpoints of the web API and check for unforseen interactions. 
At the frontend side, i decided to use the stricy notes application for a TODO list/SCRUM board. I used it while develovping, hoping to ensure, that the product is easily usable and intuitive. Also the usage of the application made me find some bugs, that i otherwise would be able to miss. First thing i develovped was just a grid of notes and "add new" functionality. Than i added notes of functionality, design and bug-fix tasks i have to complete. While adding features to the application i also saw what functionality of the app i most use, so i know what should be improved and made easier in later stages of develovpent.

The note itself if bound to two things: a user and optionally a group. The user is the owner and is the only one that can modify or delete the note. If the note has a binding to a group, it will show in the group notes and iherit the group identifing color. If the group is deleted, the note remains ad a user's not and is not deleted with the group.

On the frontend the biggest challange to test was prefix filter implmentation. For the filter I implemented a trie prefix tree, that takes all the notes to filter. After writing something in the search filter box, the tree must collect all the notes that match the filter, ignoring the pagination, but still applying all the other filters. The challange was making it dynamic, so after every typed or deleted letter the filter result refreshes. The implementation could be further optimised by only fetching one page to display and than in the background fetch the rest of the data, to model the trie prefix tree. 

After the application web interface was mostly done, I implemented a translation module. The module looks for a language .ts file, for every language that is specified in the module. Implementing new languages is therefore simple. Only thing that is needed is to sprecify the new language code in the module and add a language file in the languages folder. The language file must export three attributes. One is the language code, the language icon and the object that maps the language translations, needed in the application. The module than adds the language to possible language translations in the dropdown. All static text on the page is funneled through the translation module. 
