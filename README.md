# ios-todolist-app
iOS project for a todo list application

![todo-gif](https://github.com/yyasutakee/ios-todolist-app/assets/11753499/87279491-b740-40dc-9f3b-aed138fdcb5f)

## Architecture

In this example, the application is structured in three layers (UI, business logic and persistence).

![layer](https://github.com/yyasutakee/ios-todolist-app/assets/11753499/1013dfe7-b278-4df1-9e73-ce0ecf6d63ad)

Each layer exposes an interface as swift protocol which expose abstract behaviour of that layer.

![layer-interface](https://github.com/yyasutakee/ios-todolist-app/assets/11753499/f9979da3-2cc0-46ef-909c-5be9109fefa2)

details are implementes as concrete class (or struct)

![implementation](https://github.com/yyasutakee/ios-todolist-app/assets/11753499/5b33ed33-3ec5-409d-87eb-18bd59057560)

this make it possible to use different frameworks (e.x. SwiftUI and UIKit) and easily replace if needed. 

![implementation-2](https://github.com/yyasutakee/ios-todolist-app/assets/11753499/b6713243-a9a8-470e-bfdb-2e85e752dde9)

the client access to the compoment via factories. so that client do not need to care about
which concrete object to create. 

![factory](https://github.com/yyasutakee/ios-todolist-app/assets/11753499/4079e560-f6ea-46dc-9de1-d1ee1553a9c3)






