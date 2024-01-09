# ios-todolist-app
This repository contains an iOS project implemented with layered architecture

![todo-gif](https://github.com/yyasutakee/ios-todolist-app/assets/11753499/87279491-b740-40dc-9f3b-aed138fdcb5f)

# Architecture

This section describes the architecture of the application.

## Layers

In this example, the application is structured into three layers (UI, business logic and data access).

* UI: Responsible for the presentation of the application and takes input from the user.
* Business Logic: Manages the state of the application.
* Data Access: Responsible for storing and retrieving persistent data for the application.



<img src="https://github.com/yyasutakee/ios-todolist-app/assets/11753499/c9cffce0-b17f-400e-974f-fee32e6f18d1" width="200" />



## Abstraction

Each layer exposes an interface as swift protocol which expose the behaviour of that layer.

![layer](https://github.com/yyasutakee/ios-todolist-app/assets/11753499/c6d8cbcd-88ad-406b-9b51-947b24781168)

Details are implementes as concrete classes (or structs).

![layer-concrete](https://github.com/yyasutakee/ios-todolist-app/assets/11753499/d1120f00-2c24-41bf-ae9e-36b69f0ea0f3)

This make it possible to use different frameworks (e.g. In UI Layer SwiftUI and UIKit) and easily replace if needed. 

![layer-frameworks](https://github.com/yyasutakee/ios-todolist-app/assets/11753499/dfef5c87-2904-4f1c-8dd9-9af43d3edb65)

## Factory


To create a concrete component a factory is used

![factory](https://github.com/yyasutakee/ios-todolist-app/assets/11753499/5c7ce516-0408-46b9-a7ac-e0da187ac98e)

Thus the client doesn't need to care about
which concrete object to create. 

![factory-concrete](https://github.com/yyasutakee/ios-todolist-app/assets/11753499/0e6ee5d6-20b2-4ce7-86cb-c2f47905c99b)

# Testing

To test the application correctly work a data access object for testing purpose can be created which simulate the behaviour of the database.

![test](https://github.com/yyasutakee/ios-todolist-app/assets/11753499/2a10fd86-f6ff-4399-9d8b-7398e52990ae)


Using thie object as stub the model layer can be tested.

![test2](https://github.com/yyasutakee/ios-todolist-app/assets/11753499/360ec74a-e770-4a08-9deb-99a0a574c22c)

Also the whole application can be tested. To test the ui works correctly ui test can be executed.

![test3](https://github.com/yyasutakee/ios-todolist-app/assets/11753499/fa4cebe9-b4b5-432a-8d95-7fc452d1c074)




## concepts referenced for this project

* Clean Architecture https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html
* Layered Architecture https://martinfowler.com/bliki/PresentationDomainDataLayering.html






