import SwiftUI
import UIKit
import UI

let textFont = "AvenirNextCondensed-Bold"

public struct CheckBox: View {
    
    @Binding var isChecked: Bool
    
    public var body: some View {
        
        Image(systemName: isChecked ? "checkmark.square.fill" : "square")
            .accessibilityIdentifier("check_img")
            .foregroundColor(isChecked ? Color(UIColor.systemBlue) : Color.secondary)
            .onTapGesture {
                self.isChecked.toggle()
            }
    }
    
}

public struct ListRow: View  {
    
    var listItem: ListItem
    
    let viewModel: ListViewModel
    
    public init(listItem: ListItem, viewModel: ListViewModel) {
        self.listItem = listItem; self.viewModel = viewModel
    }
    
    public var body: some View {
        
        HStack {
            
            CheckBox(isChecked: Binding(get: {
                listItem.isChecked
            }, set: { isChecked in
                viewModel.onCheckBoxTapped(id: listItem.id, isChecked: !listItem.isChecked)
            }))
            
            Text(listItem.name)
                .font(.custom(textFont, size: 20))
                .strikethrough(listItem.isChecked)
        }
        .listRowSeparator(.hidden)
    }
    
}

func list(viewModel: ListViewModel) -> some View {
    
    func deleteRow(indexSet: IndexSet) {
        viewModel.onListElementRemoved(indexSet)
    }
    return  List {
        
        ForEach(viewModel.viewElement.listItems, id: \.id) { i in
            ListRow(listItem: i, viewModel: viewModel)
        }
        
        .onDelete(perform: { indexSet in
            viewModel.onListElementRemoved(indexSet)
        })
        
        
        
    }.accessibility(identifier: "list")
    
        .navigationBarTitle("Todolist")
        .font(.custom(textFont, size: 20))
        .onAppear(perform: {
            viewModel.onListViewAppeared()
        })
    
}



struct ListViewSwiftUI : ListView {
    
    @ObservedObject public private(set) var listViewModel: ListViewModel
    
    @State var isPresented = false
    
    @State var text = ""
    
    
    init(listViewModel: ListViewModel) {
        self.listViewModel = listViewModel
    }
    
    var body: some View {
        
        ZStack {
            
            NavigationView {
                list(viewModel: listViewModel)
            }
            
            VStack {
                
                Spacer()
                
                floatingButton($isPresented).padding()
                
                    .alert("Add", isPresented: $isPresented) {
                        
                        TextField("Task", text: $text)
                        
                        Button {
                            text = ""
                        } label: {
                            Text("Cancel")
                        }
                        
                        Button {
                            listViewModel.onAddTaskButtonTapped(taskName: text)
                            text = ""
                        } label: {
                            Text("OK")
                        }
                        
                    } message: {
                        Text("")
                    }
            }.padding(40)
        }.onAppear {
            listViewModel.onListViewAppeared()
        }
    }
}

func floatingButton(_ binding: Binding<Bool>) -> some View {
    
    return RoundedCircleButton {
        binding.wrappedValue = true
    }
    
}

struct RoundedCircleButton: View {
    
    var action: () -> Void
    
    var body: some View {
        
        Button(action: action) {
            Circle()
                .foregroundColor(.blue)
                .frame(width: 50, height: 50)
                .overlay(
                    Text("+")
                        .font(.system(size: 24).bold())
                        .foregroundColor(.white)
                )
        }
        
        .accessibility(identifier: "RoundedCircleButton")
        
    }
}

import Logic

 public struct ListViewFactoryImpl<MF: ListModelFactory>: ListViewFactory {
    
    let mf: MF
    public init(mf: MF) {
        self.mf = mf
    }
     
     public func makeListView() -> AnyView {
         return AnyView(ListViewSwiftUI(listViewModel: ListViewModel(viewElement: ListViewElement(listElements: []), model: mf.makeListModel())))
     }
     
     
#if DEBUG
    public func makeListView(_ defaultTasksCount: Int = 0) -> AnyView {
        return AnyView(ListViewSwiftUI(listViewModel: ListViewModel(viewElement: ListViewElement(listElements: []), model: mf.makeListModel(1))))
    }
#endif
    
}
