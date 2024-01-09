import SwiftUI
import Production_Main
import Test_Main

@main
struct TodoListApp: App {
    
    // If UI test is running, view is created with dummy database
    func makeView() -> AnyView {
        
        if ProcessInfo.processInfo.arguments.contains("uitest_for_test_loading-test") {
            return Test_Main.viewFactory.makeListView(1)
        } else if ProcessInfo.processInfo.arguments.contains("uitest_for_test") {
            return Test_Main.viewFactory.makeListView()
        } else if ProcessInfo.processInfo.arguments.contains("uitest_for_production") {
            Production_Main.resetData()
            return Production_Main.viewFactory.makeListView()
        } else {
            return Production_Main.viewFactory.makeListView()
        }

    }
   
    var body: some Scene {
        WindowGroup {
           makeView()
        }
    }
}


