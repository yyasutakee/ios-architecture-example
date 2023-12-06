# ios-todolist-app
iOS project for a todo list application

![todo-gif](https://github.com/yyasutakee/ios-todolist-app/assets/11753499/87279491-b740-40dc-9f3b-aed138fdcb5f)

## Architecture

![Untitled Diagram drawio](https://github.com/yyasutakee/ios-todolist-app/assets/11753499/e7f98096-c7d4-4674-8a12-b2506d187a68)

https://martinfowler.com/bliki/PresentationDomainDataLayering.html

Es kann ohne User-Interaktion getestet werden (UITest)

Ohne Änderung sondern Erweiterung

UI, Model, DataAccess werden häufig mit anderen Frameworks entwickelt (z.B in UI werden UIKit oder SwiftUI verwendet). Deshalb werden diese Komponente zuerst als ein abstraktes Form dargestellt und eine detaillierte Implementation erfolgt als eine konkrete Klasse.


