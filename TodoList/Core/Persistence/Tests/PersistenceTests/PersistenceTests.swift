import XCTest
@testable import Persistence

final class DataAccessTests: XCTestCase {
    
    var dataAccess: DataAccess!
    
    override func setUp() {
        dataAccess = DataAccessFactoryTest().makeDataAccess()
        deleteAllTestTasks()
    }
    
    override func tearDown() {
        deleteAllTestTasks()
    }
    
    func makeDummyTask() -> TaskData {
        return TaskData(id: UUID(), name: "Dummy", date: Date(), isChecked: false)
    }
    
    
    func testAddTask() throws {
        
        let dummy = makeDummyTask()
        
        _ = self.dataAccess.saveTask.saveTask(task: dummy)
        
        let expected = [dummy]
        
        let tasks = self.dataAccess.loadTasks.loadTasks()
        
        XCTAssertEqual(tasks, expected)
        
    }
    
    func testLoadTasks2() throws {
        
        self.dataAccess = DataAccessFactoryTest().makeDataAccess(5)
        
        let tasks = self.dataAccess.loadTasks.loadTasks()
        
        XCTAssertEqual(tasks.count, 5)
        
    }
    
    func testCheckTask() throws {
        
        var ids: [UUID] = []
        
        for _ in 0..<5 {
            let dummy = makeDummyTask()
            _ = self.dataAccess.saveTask.saveTask(task: dummy)
            ids.append(dummy.id)
        }
        
        self.dataAccess.checkTask.checkTask(id: ids[1], toCheck: true)
        
        let tasks = self.dataAccess.loadTasks.loadTasks()
        
        XCTAssertEqual(tasks[1].isChecked, true)
        
        XCTAssertEqual(tasks[2].isChecked, false)
        
        
    }
    
    func testDeleteTask() throws {
        
        var dummies: [TaskData] = []
        
        for _ in 0..<5 {
            let dummy = makeDummyTask()
            dummies.append(dummy)
            _ = self.dataAccess.saveTask.saveTask(task: dummy)
        }
        
        _ = self.dataAccess.deleteTask.deleteTask(id: dummies[1].id)
        
        let tasks = self.dataAccess.loadTasks.loadTasks()
        
        dummies.remove(at: 1)
        
        let exp = dummies
        
        XCTAssertEqual(tasks, exp)
        
    }
    
}
