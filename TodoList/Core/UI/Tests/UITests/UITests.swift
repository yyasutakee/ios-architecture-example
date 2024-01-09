import XCTest
@testable import UI
import LogicImpl
import Persistence

final class UITests: XCTestCase {
    
    override func tearDown() {
        deleteAllTestTasks()
    }
    
    func testViewLoaded() throws {
        
        let viewModel = ListViewModel(viewElement: ListViewElement(listElements: []), model: ListModelFactoryImpl(daf: DataAccessFactoryTest()).makeListModel(1))
        
        viewModel.onListViewAppeared()
        
        XCTAssertTrue(viewModel.viewElement.listItems.count == 1)
        
    }
    
    func testAddTapped() {
        
        let viewModel = ListViewModel(viewElement: ListViewElement(listElements: []), model: ListModelFactoryImpl(daf: DataAccessFactoryTest()).makeListModel())
        
        XCTAssertTrue(viewModel.viewElement.listItems.count == 0)
        
        viewModel.onAddTaskButtonTapped(taskName: "some task")
        
        XCTAssertTrue(viewModel.viewElement.listItems.count == 1)
        
    }
    
    func testDeleteTapped() {
        
        let viewModel = ListViewModel(viewElement: ListViewElement(listElements: []), model: ListModelFactoryImpl(daf: DataAccessFactoryTest()).makeListModel())
        
        viewModel.onAddTaskButtonTapped(taskName: "some task")
        
        XCTAssertTrue(viewModel.viewElement.listItems.count == 1)

        viewModel.onListElementRemoved(IndexSet([0]))
        
        XCTAssertTrue(viewModel.viewElement.listItems.count == 0)

    }
    
    func testCheckTapped() {
        
        let viewModel = ListViewModel(viewElement: ListViewElement(listElements: []), model: ListModelFactoryImpl(daf: DataAccessFactoryTest()).makeListModel())
        
        viewModel.onAddTaskButtonTapped(taskName: "some task")
        
        XCTAssertTrue(viewModel.viewElement.listItems.first!.isChecked == false)

        let idToBeTapped = viewModel.viewElement.listItems.first!.id
        
        viewModel.onCheckBoxTapped(id: idToBeTapped, isChecked: true)
        
        XCTAssertTrue(viewModel.viewElement.listItems.first!.isChecked == true)

        
    }
    
}
