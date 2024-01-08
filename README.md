# ios-todolist-app
This repository contains an iOS project implemented with layered architecture

![todo-gif](https://github.com/yyasutakee/ios-todolist-app/assets/11753499/87279491-b740-40dc-9f3b-aed138fdcb5f)

# Architecture

In the following how the application architecture look like

## Layers

In this example, the application is structured in three layers (UI, business logic and persistence).

* UI: Responsible for the presentation of the application and takes input from the user
* Business Logic: Application state will be managed here
* Persistence: Responsible for saving and retriving persistent data for the application

![layer](https://github.com/yyasutakee/ios-todolist-app/assets/11753499/1013dfe7-b278-4df1-9e73-ce0ecf6d63ad)

## Abstraction

Each layer exposes an interface as swift protocol which expose the behaviour of that layer.

![layer-interface](https://github.com/yyasutakee/ios-todolist-app/assets/11753499/f9979da3-2cc0-46ef-909c-5be9109fefa2)

details are implementes as concrete class (or struct)

<!-- ![implementation](https://github.com/yyasutakee/ios-todolist-app/assets/11753499/5b33ed33-3ec5-409d-87eb-18bd59057560) -->

![abstraction-and-detail](https://github.com/yyasutakee/ios-todolist-app/assets/11753499/daa1a8b0-7c0f-4dfd-9c94-e5eb7116926e)


this make it possible to use different frameworks (e.g. SwiftUI and UIKit) and easily replace if needed. 

![implementation-2](https://github.com/yyasutakee/ios-todolist-app/assets/11753499/b6713243-a9a8-470e-bfdb-2e85e752dde9)

the client access to the compoment via factories. so that client do not need to care about
which concrete object to create. 

![factory](https://github.com/yyasutakee/ios-todolist-app/assets/11753499/4079e560-f6ea-46dc-9de1-d1ee1553a9c3)

## ViewModel

## Testing

## concepts referenced for this project

* Clean Architecture https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html
* Layered Architecture https://martinfowler.com/bliki/PresentationDomainDataLayering.html






