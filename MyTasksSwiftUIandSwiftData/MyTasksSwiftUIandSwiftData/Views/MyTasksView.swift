//
//  MyTasksView.swift
//  MyTasksSwiftUIandSwiftData
//
//  Created by Anthony H on 4/24/24.
//

import SwiftUI
import SwiftData

struct MyTasksView: View {
    @State private var sortOrder: Bool = true
    @State private var searchText: String = ""
    @State private var addingTask: Bool = false
    // Fetches the data from storage
    @Query private var tasks: [MyTask]
    
    var body: some View {
        HStack {
            CurrDateView()
                .modifier(RoundedSquareModifier())
            Spacer()
            TaskCountView()
                .modifier(RoundedSquareModifier())
        }
        .padding()
        
        NavigationStack {
            TaskListView(myTasks: tasks)
                .navigationTitle("Tasks")
                .searchable(text: $searchText)
                .toolbar {
                    Button("sort", systemImage: "arrow.up.arrow.down") {
                        sortOrder.toggle()}

                    Button {
                        addingTask = true
                    }label: {
                        Image(systemName: "plus")
                            .imageScale(.large)
                    }
                }
                .sheet(isPresented: $addingTask) {
                    AddTaskView()
                        .presentationDetents([.medium])
                }
        }
    }
}

#Preview {
    MyTasksView()
}
