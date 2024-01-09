import XCTest
@testable import PersistenceImpl
import Persistence

final class DataAccessCoreDataTests: XCTestCase {
    
    let dataAccess = DataAccessFactoryImpl().makeDataAccess()
    
    override func setUp() {
        super.setUp()
        deleteAllCoreDataTasks("delete all tasks in core data")
    }
    
    override func tearDown() {
        super.setUp()
        deleteAllCoreDataTasks("delete all tasks in core data")
    }
    
    func makeDummyTask(name: String) -> TaskData {
        return TaskData(id: UUID(), name: name, date: Date(), isChecked: false)
    }
    
    func loadTasks() -> [TaskData] {
        dataAccess.loadTasks.loadTasks()
    }
    
    func saveTask(_ task: TaskData) {
        _ = dataAccess.saveTask.saveTask(task: task)
    }
   
    
    func testAddTask() throws {
        
        self.saveTask(makeDummyTask(name: "Dummy"))
        
        let tasks = loadTasks()
        
        XCTAssertTrue(tasks.count == 1)
        
    }
    
    func deleteTask(id: UUID) {
        
        _ = dataAccess.deleteTask.deleteTask(id: id)
        
    }
    
    func testDeleteTasks() throws {
        
        let dummy = makeDummyTask(name: "Dummy")
        
        self.saveTask(dummy)
        
        var tasks = loadTasks()
        
        XCTAssertTrue(tasks.count == 1)
        
        self.deleteTask(id: dummy.id)
        
        tasks = loadTasks()
        
        XCTAssertEqual(tasks.count, 0)
        
    }
    
    func testCheckTask() throws {
        
        var dummy = makeDummyTask(name: "Dummy")

        self.saveTask(dummy)
        
        let c = CheckTaskCoreData()
        
        _ = dataAccess.checkTask.checkTask(id: dummy.id, toCheck: true)
        
        let tasks = loadTasks()
        
        dummy.isChecked = true
        
        let expected = [dummy]
        
        XCTAssertEqual(tasks, expected)
        
    }
    
    
    func testLoadTasks() throws {
        
        let dummy = makeDummyTask(name: "Dummy")
        
        self.saveTask(dummy)
        
        let tasks = loadTasks()
        
        XCTAssertTrue(tasks.count > 0)
        
    }
    
}
