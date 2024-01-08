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

![layer](https://github.com/yyasutakee/ios-todolist-app/assets/11753499/c6d8cbcd-88ad-406b-9b51-947b24781168)

details are implementes as concrete class (or struct)

![layer-concrete](https://github.com/yyasutakee/ios-todolist-app/assets/11753499/d1120f00-2c24-41bf-ae9e-36b69f0ea0f3)

this make it possible to use different frameworks (e.g. SwiftUI and UIKit) and easily replace if needed. 

![layer-frameworks](https://github.com/yyasutakee/ios-todolist-app/assets/11753499/dfef5c87-2904-4f1c-8dd9-9af43d3edb65)

## Factory


To create a concrete component a factory is used

![factory](https://github.com/yyasutakee/ios-todolist-app/assets/11753499/5c7ce516-0408-46b9-a7ac-e0da187ac98e)

Thus that client do not need to care about
which concrete object to create. 

![factory-concrete](https://github.com/yyasutakee/ios-todolist-app/assets/11753499/ee47881d-7f9d-43e1-b494-a4330502bc64)

## Main


In main module all concrete factories for each layer are initialized and prepared for the client to use

<img src="https://github.com/yyasutakee/ios-todolist-app/assets/11753499/fc61ceb3-28c6-4dc9-a40e-b5633e5dccea" width="400">

The main module is used as a plugin

![main2](https://github.com/yyasutakee/ios-todolist-app/assets/11753499/76c6795e-094b-43f2-987f-b68e9848edd4)

 
Different main modules can be created so that the client can use different version of todo list view application

![main3](https://github.com/yyasutakee/ios-todolist-app/assets/11753499/25feb16f-4501-4907-8f31-c63419b5ac89)





## ViewModel

## Testing

## concepts referenced for this project

* Clean Architecture https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html
* Layered Architecture https://martinfowler.com/bliki/PresentationDomainDataLayering.html






