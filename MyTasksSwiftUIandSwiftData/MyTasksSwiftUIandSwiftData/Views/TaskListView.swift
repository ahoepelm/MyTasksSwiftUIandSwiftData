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
        var sortedTasks = myTasks
        
        List(sortedTasks) { myTask in
            Text(myTask.name)
        }
    }
}

//#Preview {
//    TaskListView()
//}
