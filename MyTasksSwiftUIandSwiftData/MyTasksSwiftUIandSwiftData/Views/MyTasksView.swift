//
//  MyTasksView.swift
//  MyTasksSwiftUIandSwiftData
//
//  Created by Anthony H on 4/24/24.
//

import SwiftUI
import SwiftData

struct MyTasksView: View {
    @Environment(\.modelContext) var modelContext
    @State private var sortOrder: Bool = true
    @State private var searchText: String = ""
    @State private var predicate: Predicate<MyTask> = .false
    @State private var path = [MyTask]()
    
    var body: some View {
        HStack {
            CurrDateView()
                .modifier(RoundedSquareModifier())
            Spacer()
            TaskCountView()
                .modifier(RoundedSquareModifier())
        }
        .padding()
        
        TabView {
            // Demonstrating new iOS 18 tab option instead of .tabItem modifier
            Tab("Pending", systemImage: "square") {
                NavigationStack(path: $path) {
                    TaskListView(sortOrder: sortOrder, filterString: searchText, predicate: predicate)
                        .navigationTitle("Tasks")
                        .navigationDestination(for: MyTask.self, destination: AddTaskView.init)
                        .searchable(text: $searchText)
                        .toolbar {
                            Button("sort", systemImage: "arrow.up.arrow.down") {
                                sortOrder.toggle()
                            }
                            Button("", systemImage: "plus", action: addTask)
                        }
                }
                .onAppear {
                    predicate = #Predicate<MyTask> { $0.isDone == false && ($0.name.localizedStandardContains(searchText) || searchText.isEmpty)
                    }
                }
                .onChange(of: searchText) {oldValue, newValue in
                    predicate = #Predicate<MyTask> { $0.isDone == false && ($0.name.localizedStandardContains(newValue) || newValue.isEmpty)
                    }
                }
            }
                        
            Tab("Completed", systemImage: "checkmark.square") {
                NavigationStack(path: $path) {
                    TaskListView(sortOrder: sortOrder, filterString: searchText, predicate: predicate)
                        .navigationTitle("Tasks")
                        .navigationDestination(for: MyTask.self, destination: AddTaskView.init)
                        .searchable(text: $searchText)
                        .toolbar {
                            Button("sort", systemImage: "arrow.up.arrow.down") {
                                sortOrder.toggle()
                            }
                            Button("", systemImage: "plus", action: addTask)
                        }
                }
                .onAppear {
                    predicate = #Predicate<MyTask> { $0.isDone == true && ($0.name.localizedStandardContains(searchText) || searchText.isEmpty)
                    }
                }
                .onChange(of: searchText) {oldValue, newValue in
                    predicate = #Predicate<MyTask> { $0.isDone == true && ($0.name.localizedStandardContains(newValue) || newValue.isEmpty)
                    }
                }
            }
        }
    }
    
    func addTask() {
        let task = MyTask()
        path = [task]
    }
}

#Preview {
    MyTasksView()
}
