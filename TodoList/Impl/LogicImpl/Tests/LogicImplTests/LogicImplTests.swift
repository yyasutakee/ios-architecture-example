import XCTest
@testable import LogicImpl
import Logic
import Persistence

final class ListModelTests: XCTestCase {
    
    var model: ListModel!
    
    override func setUp() {
        model = ListModelFactoryImpl(daf: DataAccessFactoryTest()).makeListModel()
    }
    
    override func tearDown() {
        deleteAllTestTasks()
    }
    
    func testAddTask() throws {
        
        XCTAssertEqual(model.state.tasks.count, 0)
        
        let dummy = makeDummyTask()
        
        model.addTask(dummy)
        
        XCTAssertEqual(model.state.tasks.count, 1)

    }
    
    func testLoadTasks() throws {
        
        model = ListModelFactoryImpl(daf: DataAccessFactoryTest()).makeListModel(5)
        
        model.loadTasks()
        
        XCTAssertEqual(model.state.tasks.count, 5)
        
    }
    
    func testCheckTask() throws {
        
        var ids: [UUID] = []
        
        for _ in 0..<5 {
            let id = UUID()
            let dummy = TodoTask(id: id, name: "Task", date: Date())
            ids.append(id)
            model.addTask(dummy)
        }
        
        model.checkTask(id: ids[1], toCheck: true)
        
        XCTAssertEqual(model.state.tasks[1].isChecked, true)
        
        XCTAssertEqual(model.state.tasks[2].isChecked, false)
        
    }
    
    func testDeleteTask() throws {
        
        var dummies: [TodoTask] = []
        
        for _ in 0..<5 {
            
            let dummy = TodoTask(id: UUID(), name: "Task", date: Date())
            
            dummies.append(dummy)
            
            model.addTask(dummy)
            
        }
        
        XCTAssertEqual(model.state.tasks.count, 5)
        
        model.deleteTask(dummies[1])
        
        XCTAssertEqual(model.state.tasks.count, 4)
        
    }
    
}
