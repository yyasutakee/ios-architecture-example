import Foundation
import Logic
import Combine
import SwiftUI

public protocol ListView: View {
    init(listViewModel: ListViewModel)
}

public struct ListViewElement {
    
    public var listItems: [ListItem]
    
    public init(listElements: [ListItem]) {
        self.listItems = listElements
    }
    
}

public struct ListItem {
    
    public var name: String
    public var id: UUID
    public var isChecked: Bool
    
    public init(id: UUID, name: String, isChecked: Bool) {
        self.id = id; self.name = name; self.isChecked = isChecked
    }
    
}

public class ListViewModel: ObservableObject {
    
    var subscriber: AnyCancellable?
    
    public let model: ListModel
    
    @Published public private(set) var viewElement: ListViewElement
    
    public init(viewElement: ListViewElement, model: ListModel) {
        self.viewElement = viewElement
        self.model = model
        subscriber = self.model.publisher.sink { s in
            
            let listItems = s.tasks.map { t in
                return ListItem(id: t.id, name: t.name, isChecked: t.isChecked)
            }
            
            self.viewElement = ListViewElement(listElements: listItems)
            
        }
    }
    
    public func onAddTaskButtonTapped(taskName: String) {
        model.addTask(TodoTask(id: UUID(), name: taskName, date: Date(), isChecked: false))
    }
    
    public func onListElementRemoved(_ indexSet: IndexSet) {
        model.deleteTask(model.state.tasks[indexSet.first!])
    }
    
    public func onCheckBoxTapped(id: UUID, isChecked: Bool) {
        model.checkTask(id: id, toCheck: isChecked)
    }
    
    public func onListViewAppeared() {
        model.loadTasks()
    }
    
}

public protocol ListViewFactory {
    
    associatedtype MF: ListModelFactory
    init(mf: MF)
    func makeListView() -> AnyView
    
#if DEBUG
    func makeListView(_ defaultTasksCount: Int) -> AnyView
#endif
    
}



