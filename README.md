# ios-todolist-app
iOS project for a todo list application

![todo-gif](https://github.com/yyasutakee/ios-todolist-app/assets/11753499/87279491-b740-40dc-9f3b-aed138fdcb5f)

## Architecture

![Untitled Diagram drawio](https://github.com/yyasutakee/ios-todolist-app/assets/11753499/e7f98096-c7d4-4674-8a12-b2506d187a68)

Layering

![layer drawio](https://github.com/yyasutakee/ios-todolist-app/assets/11753499/bc27ecfb-dd7d-4883-adcf-912bae9b466e)

![layer drawio](https://github.com/yyasutakee/ios-todolist-app/assets/11753499/03541c46-8a2e-4a0f-b51c-57baab55757b)






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






