import XCTest

class TodoListUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments = ["uitest_for_test"]
        app.launch()
    }
    
    private func addTask() {
        
        let button = app.buttons["RoundedCircleButton"]

        button.tap()
        
        let alert = app.alerts["Add"]
        
        let textField = alert.textFields["Task"]
        
        textField.tap()

        textField.typeText("Go to shopping")
        
        alert.buttons["OK"].tap()
        
    }
    
    
    func testAddTask() {
        
        let button = app.buttons["RoundedCircleButton"]

        button.tap()
        
        let alert = app.alerts["Add"]
        
        XCTAssertTrue(alert.exists)

        let textField = alert.textFields["Task"]
        
        XCTAssertTrue(textField.exists)

        textField.tap()

        textField.typeText("Go to shopping")
        
        alert.buttons["OK"].tap()
        
        let predicate = NSPredicate(format: "identifier == 'list'")
        
        let list = app.descendants(matching: .any).matching(predicate).firstMatch
        
        XCTAssertTrue(list.exists)
        
        let texts = list.staticTexts
        
        let texts_count = texts.count
        
        XCTAssertEqual(texts_count, 1)
        
    }
    
    func testDeleteTask() {
        
        self.addTask()
        
        let predicate = NSPredicate(format: "identifier == 'list'")
        
        let list = app.descendants(matching: .any).matching(predicate).firstMatch
        
        XCTAssertTrue(list.exists)
        
        let texts = list.staticTexts
        
        texts.element.swipeLeft(velocity: XCUIGestureVelocity.slow)

        let db = app.buttons["Delete"]

        XCTAssertTrue(db.exists)

        db.tap()
        
        let list1 = app.descendants(matching: .any).matching(predicate).firstMatch
        
        let texts1 = list1.staticTexts
        
        let texts_count1 = texts1.count
       
        XCTAssertEqual(texts_count1, 0)
        
    }
    
    func testCheckTask() {
        
        self.addTask()
        
        let img = app.images["check_img"]

        XCTAssertTrue(img.exists)
        
        XCTAssertEqual(img.label, "Square")
        
        img.tap()
        
        XCTAssertEqual(img.label, "Selected")

    }
    
    func testViewLoaded() {
        
        let app = XCUIApplication()
        app.launchArguments = ["uitest_for_test_loading-test"]
        app.launch()
        
        let predicate = NSPredicate(format: "identifier == 'list'")
       
        let list = app.descendants(matching: .any).matching(predicate).firstMatch
        
        XCTAssertTrue(list.exists)
        
        let texts = list.staticTexts
       
        let texts_count = texts.count
        
        XCTAssertEqual(texts_count, 1)
        
    }
   
}
