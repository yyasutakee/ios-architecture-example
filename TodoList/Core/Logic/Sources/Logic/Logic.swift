import Combine
import Foundation

public struct ListState {
    
    public var tasks: [TodoTask]
    
    public init(tasks: [TodoTask]) {
        self.tasks = tasks
    }
    
}

public struct TodoTask: Equatable {
    
    public var id: UUID
    public var name: String
    public var date: Date
    public var isChecked: Bool
    
    public init(id: UUID, name: String, date: Date, isChecked: Bool = false) {
        self.id = id; self.name = name; self.date = date; self.isChecked = isChecked
    }
    
}

public func makeDummyTask() -> TodoTask {
    return TodoTask(id: UUID(), name: "Dummy", date: Date(), isChecked: false)
}

public protocol ListModel {
    
    var state: ListState { get }
    var publisher: PassthroughSubject<ListState, Never> { get }
    
    func addTask(_ task: TodoTask)
    func loadTasks()
    func deleteTask(_ task: TodoTask)
    func checkTask(id: UUID, toCheck: Bool)
    
}

import Persistence

public protocol ListModelFactory {
    associatedtype DAF: DataAccessFactory
    init(daf: DAF)
    func makeListModel() -> ListModel
#if DEBUG
    func makeListModel(_ defaultTaskCount: Int) -> ListModel
#endif
}



