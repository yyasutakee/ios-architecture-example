import Persistence
import Foundation
import CoreData

func deleteAllCoreDataTasks(_ password: String) {
    
#if DEBUG
    
    if password != "delete all tasks in core data" { fatalError("Delete all core data tasks password invalid") }
    
    let context = getContext(); let fetchRequest = getFetchRequest()
    
    let results = try! context.fetch(fetchRequest)
    
    results.forEach { e in
        
        context.delete(e)
        
    }
    
    try! context.save()
    
#endif
    
}

struct SaveTaskCoreData: SaveTask {
    
    init() {}
    
    func saveTask(task: TaskData) -> Bool {
        let context = CoreDataContainer().viewContext
        let entity = TaskEntity(context: context)
        entity.id = task.id; entity.name = task.name; entity.isChecked = task.isChecked; entity.date = task.date
        try! context.save()
        return true
    }
    
}

struct LoadTasksCoreData: LoadTasks {
    
    init() {}
    
    func loadTasks() -> [TaskData] {
        let context = CoreDataContainer().viewContext
        let fetchRequest = TaskEntity.fetchRequest()
        var entities: [TaskEntity]!
        entities = try! context.fetch(fetchRequest)
        var tasks: [TaskData] = []
        entities.forEach { e in
            let task = TaskData(id: e.id!, name: e.name!, date: e.date!, isChecked: e.isChecked)
            tasks.append(task)
        }
        return tasks
    }
    
}

func getContext() -> NSManagedObjectContext {
    return CoreDataContainer().viewContext
}

func getFetchRequest() -> NSFetchRequest<TaskEntity> {
    return TaskEntity.fetchRequest()
}

struct DeleteTaskCoreData: DeleteTask {
    
    init() {}
    
    func deleteTask(id: UUID) -> Bool {
        let context = getContext(); let fetchRequest = getFetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id.uuidString)
        let results = try! context.fetch(fetchRequest)
        let entityToRemove = results.first!
        context.delete(entityToRemove)
        try! context.save()
        return true
    }
    
}

struct CheckTaskCoreData: CheckTask {
    
    init() {}
    
    func checkTask(id: UUID, toCheck: Bool) -> Bool {
        let context = getContext(); let fetchRequest = getFetchRequest()
        let predicate = NSPredicate(format: "id == '\(id)'")
        fetchRequest.predicate = predicate
        let taskEntities = try! context.fetch(fetchRequest)
        taskEntities.first!.isChecked = toCheck
        try! context.save()
        return true
    }
    
}

func makeDataAccessCoreData() -> DataAccess {
    
    return DataAccess(saveTask: SaveTaskCoreData(), loadTasks: LoadTasksCoreData(), deleteTask: DeleteTaskCoreData(), checkTask: CheckTaskCoreData())
    
}


public struct DataAccessFactoryImpl: DataAccessFactory {
#if DEBUG
    public func makeDataAccess(_ defaultTaskCount: Int) -> DA {
        let task = TaskData(id: UUID(), name: "some task", date: Date(), isChecked: false)
        let saveTask = SaveTaskCoreData()
        _ = saveTask.saveTask(task: task)
        return DataAccess(saveTask: saveTask, loadTasks: LoadTasksCoreData(), deleteTask: DeleteTaskCoreData(), checkTask: CheckTaskCoreData())
    }
#endif
    
    public typealias DA = DataAccess
    public init() {}
    public func makeDataAccess() -> DataAccess {
        return DataAccess(saveTask: SaveTaskCoreData(), loadTasks: LoadTasksCoreData(), deleteTask: DeleteTaskCoreData(), checkTask: CheckTaskCoreData())
    }
}

public extension DataAccessFactoryImpl {
    func deleteAllData(_ password: String) {
        deleteAllCoreDataTasks(password)
    }
}
