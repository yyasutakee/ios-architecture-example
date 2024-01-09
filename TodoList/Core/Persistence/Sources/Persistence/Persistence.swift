import Foundation

public class DataAccess {
    
    public var saveTask: SaveTask
    public var loadTasks: LoadTasks
    public var deleteTask: DeleteTask
    public var checkTask: CheckTask
    
    public init(saveTask: SaveTask, loadTasks: LoadTasks, deleteTask: DeleteTask, checkTask: CheckTask) {
        self.saveTask = saveTask; self.loadTasks = loadTasks; self.deleteTask = deleteTask; self.checkTask = checkTask
    }
    
}

public struct TaskData: Equatable {
    
    public var id: UUID
    public var name: String
    public var date: Date
    public var isChecked: Bool
    
    public init(id: UUID, name: String, date: Date, isChecked: Bool) {
        self.id = id
        self.name = name
        self.date = date
        self.isChecked = isChecked
    }
    
}

public struct SaveTaskFail: SaveTask {
    public init() {}
    public func saveTask(task: TaskData) -> Bool {
        return false
    }
}

public protocol SaveTask {
    func saveTask(task: TaskData) -> Bool
}

public protocol LoadTasks {
    func loadTasks() -> [TaskData]
}

public protocol DeleteTask {
    func deleteTask(id: UUID) -> Bool
}

public protocol CheckTask {
    func checkTask(id: UUID, toCheck: Bool) -> Bool
}

public struct CheckTaskTest: CheckTask {
    
    public func checkTask(id: UUID, toCheck: Bool) -> Bool {
        
        let index = testTasks.firstIndex(where: { $0.id == id })!
        testTasks[index].isChecked = toCheck
        return true
    }
    
}

var testTasks: [TaskData] = []

public struct SaveTaskTest: SaveTask {
    
    public func saveTask(task: TaskData) -> Bool {
        testTasks.append(task)
        return true
    }
    
}

public struct LoadTasksTest: LoadTasks {
    
    public func loadTasks() -> [TaskData] {
        return testTasks
    }
    
}

public struct DeleteTaskTest: DeleteTask {
    
    public func deleteTask(id: UUID) -> Bool {
        testTasks = testTasks.filter( { t in
            return t.id != id
        })
        return true
    }
    
}

public func deleteAllTestTasks() {
    testTasks = []
}

public protocol DataAccessFactory {
    associatedtype DA
    func makeDataAccess() -> DA
    #if DEBUG
    func makeDataAccess(_ defaultTaskCount: Int) -> DA
    #endif
}


public struct DataAccessFactoryTest: DataAccessFactory {
    public typealias DA = DataAccess
    public init() {}
    public func makeDataAccess() -> DataAccess {
       
        return DataAccess(saveTask: SaveTaskTest(), loadTasks: LoadTasksTest(), deleteTask: DeleteTaskTest(), checkTask: CheckTaskTest())
    }
    #if DEBUG
    public func makeDataAccess(_ defaultTaskCount: Int) -> DA {
        if defaultTaskCount > 0 {
            for _ in 0..<defaultTaskCount {
                testTasks.append(TaskData(id: UUID(), name: "some task", date: Date(), isChecked: false))
            }
        }
        return DataAccess(saveTask: SaveTaskTest(), loadTasks: LoadTasksTest(), deleteTask: DeleteTaskTest(), checkTask: CheckTaskTest())
    }
    #endif
}
