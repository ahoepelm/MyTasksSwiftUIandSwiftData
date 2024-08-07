//
//  TaskListView.swift
//  MyTasksSwiftUIandSwiftData
//
//  Created by Anthony H on 5/10/24.
//

import SwiftUI
import SwiftData

struct TaskListView: View {
    // Get the context from the environment
    @Environment(\.modelContext) private var context
    let myTasks: [MyTask]
    
    var body: some View {
        List {
            ForEach(myTasks, id: \.id) { task in
                NavigationLink(value: task) {
                    VStack(alignment: .leading) {
                        Text(task.name)
                            .font(.title2)
                    }
                }
            }.onDelete(perform: deleteTask)
        }
    }
    
    private func deleteTask(indexChosen: IndexSet) {
        indexChosen.forEach { index in
            let task = myTasks[index]
            context.delete(task)
            
            do {
                // Try to save the deletion in storage
                try context.save()
            } catch {
                // TODO: Create proper notification
                print(error.localizedDescription)
            }
        }
    }
}

//#Preview {
//    TaskListView()
//}
