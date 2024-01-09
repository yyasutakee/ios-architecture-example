# iOS todo list app
This repository contains an iOS project implemented with layered architecture.

<img src="https://github.com/yyasutakee/ios-todolist-app/assets/11753499/89c2ce6b-a26b-494b-aa8a-15890067d9e4" width="300" />


<!-- ![final](https://github.com/yyasutakee/ios-todolist-app/assets/11753499/89c2ce6b-a26b-494b-aa8a-15890067d9e4) -->



# Architecture

This section describes the architecture of the application.

## Layers

In this example, the application is structured into three layers (UI, business logic and data access).

* UI: Responsible for the presentation of the application and takes input from the user.
* Business Logic: Manages the state of the application.
* Data Access: Responsible for storing and retrieving persistent data for the application.



<img src="https://github.com/yyasutakee/ios-todolist-app/assets/11753499/c9cffce0-b17f-400e-974f-fee32e6f18d1" width="200" />



## Abstraction

Each layer exposes an interface as swift protocol, which expose the behaviour of that layer.

<img src="https://github.com/yyasutakee/ios-todolist-app/assets/11753499/c6d8cbcd-88ad-406b-9b51-947b24781168" width="200" />

Details are implemented as concrete classes (or structs).

<img src="https://github.com/yyasutakee/ios-todolist-app/assets/11753499/d1120f00-2c24-41bf-ae9e-36b69f0ea0f3" width="330" />

This makes it possible to use different frameworks (e.g. SwiftUI and UIKit in the UI layer), so you can easily switch implementations.

![list-view](https://github.com/yyasutakee/ios-todolist-app/assets/11753499/3a04056a-e786-43a5-9033-3934cfa8f96c)


## Factories

A factory is used to create a concrete component.

<img src="https://github.com/yyasutakee/ios-todolist-app/assets/11753499/5c7ce516-0408-46b9-a7ac-e0da187ac98e" width="200" />

Thus, the client doesn't need to care about
which concrete object to be created. 

<img src="https://github.com/yyasutakee/ios-todolist-app/assets/11753499/0e6ee5d6-20b2-4ce7-86cb-c2f47905c99b" width="340" />


# Testing

To test whether the application works correctly, a data access object for the test can be created to simulate the behaviour of the database.

<img src="https://github.com/yyasutakee/ios-todolist-app/assets/11753499/2a10fd86-f6ff-4399-9d8b-7398e52990ae" width="200" />


Using the object as a stub the model layer can be tested.


<img src="https://github.com/yyasutakee/ios-todolist-app/assets/11753499/360ec74a-e770-4a08-9deb-99a0a574c22c" width="320" />


The entire application can also be tested. A UI test is implemented to check that the UI works correctly.

<img src="https://github.com/yyasutakee/ios-todolist-app/assets/11753499/fa4cebe9-b4b5-432a-8d95-7fc452d1c074" width="320" />




## Concepts referenced for this project

## References
* Clean Architecture
Robert C. Martin, Clean Architecture: A Craftsman's Guide to Software Structure and Design, ISBN: 9780134494272

* Layered Architecture https://martinfowler.com/bliki/PresentationDomainDataLayering.html

* Stubs https://martinfowler.com/articles/mocksArentStubs.html






