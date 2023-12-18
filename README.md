# ios-todolist-app
iOS project for a todo list application

![todo-gif](https://github.com/yyasutakee/ios-todolist-app/assets/11753499/87279491-b740-40dc-9f3b-aed138fdcb5f)

## Architecture

In this example, the application is structured in three layers (UI, business logic and persistence).

![layer](https://github.com/yyasutakee/ios-todolist-app/assets/11753499/1013dfe7-b278-4df1-9e73-ce0ecf6d63ad)

Each layer exposes an interface as swift protocol which expose abstract behaviour of that layer.

![layer-interface](https://github.com/yyasutakee/ios-todolist-app/assets/11753499/f9979da3-2cc0-46ef-909c-5be9109fefa2)



![Untitled Diagram drawio](https://github.com/yyasutakee/ios-todolist-app/assets/11753499/e7f98096-c7d4-4674-8a12-b2506d187a68)

Layering
 

![layer drawio](https://github.com/yyasutakee/ios-todolist-app/assets/11753499/9c4fea42-e8b6-4778-b59d-f69616e48aa7)

Everything only depends on interface (abstraction)







https://martinfowler.com/bliki/PresentationDomainDataLayering.html

Es kann ohne User-Interaktion getestet werden (UITest)

Ohne Änderung sondern Erweiterung

UI, Model, DataAccess werden häufig mit anderen Frameworks entwickelt (z.B in UI werden UIKit oder SwiftUI verwendet). Deshalb werden diese Komponente zuerst als ein abstraktes Form dargestellt und eine detaillierte Implementation erfolgt als eine konkrete Klasse.

So können neue UIs schnell getestet werden und dann eingesetzt werden.

you can make your own components by extending core components.

view model -> view relevante logik

詳細への密結合を防ぐために、抽象に依存させる

詳細に依存していたら変更が大変になる

なので抽象化して、詳細を切り離す -> 詳細に依存でなく、詳細が抽象に依存してくる

jedes modul ist separat getestet und ganz ende app ist durch ui test getestet






