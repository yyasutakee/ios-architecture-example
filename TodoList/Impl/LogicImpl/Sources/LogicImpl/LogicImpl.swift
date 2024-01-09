import Logic
import Persistence
import Combine
import Foundation

class ListModelImpl: ListModel {
    
    init(dataAccess: DataAccess, state: ListState) {
        self.dataAccess = dataAccess
        self.state = state
        self.publisher = PassthroughSubject()
    }
    
    let dataAccess: DataAccess
    
    var state: ListState  {
        didSet {
            publisher.send(state)
        }
    }
    
    var publisher: PassthroughSubject<ListState, Never>
    
    func addTask(_ task: TodoTask) {
        
        if dataAccess.saveTask.saveTask(task: task.toTaskData()) {
            self.state.tasks = dataAccess.loadTasks.loadTasks().map({ d in
                d.toTodoTask()
            })
        }
        
    }
    
    func loadTasks() {
        
        self.state.tasks = dataAccess.loadTasks.loadTasks().map({ d in
            d.toTodoTask()
        })
        
    }
    
    func deleteTask(_ task: TodoTask) {
        
        if dataAccess.deleteTask.deleteTask(id: task.id) {
            self.state.tasks = dataAccess.loadTasks.loadTasks().map({ d in
                d.toTodoTask()
            })
        }
        
    }
    
    func checkTask(id: UUID, toCheck: Bool) {
        
        if dataAccess.checkTask.checkTask(id: id, toCheck: toCheck) {
            self.state.tasks = dataAccess.loadTasks.loadTasks().map({ d in
                d.toTodoTask()
            })
        }
        
    }
    
}

extension TodoTask {
    
    public func toTaskData() -> TaskData {
        return TaskData(id: self.id, name: self.name, date: self.date, isChecked: self.isChecked)
    }
    
}

extension TaskData {
    
    public func toTodoTask() -> TodoTask {
        return TodoTask(id: self.id, name: self.name, date: self.date, isChecked: self.isChecked)
    }
    
}

public struct ListModelFactoryImpl<DAF: DataAccessFactory>: ListModelFactory where DAF.DA == DataAccess {
    let daf: DAF
    public init(daf: DAF) {
        self.daf = daf
    }
    public func makeListModel() -> ListModel {
        return ListModelImpl(dataAccess: daf.makeDataAccess(), state: ListState(tasks: []))
    }
#if DEBUG
    public func makeListModel(_ defaultTaskCount: Int) -> ListModel {
        return ListModelImpl(dataAccess: daf.makeDataAccess(defaultTaskCount), state: ListState(tasks: []))
    }
#endif
}
