//
//  TaskDetailView.swift
//  MyTasksSwiftUIandSwiftData
//
//  Created by Anthony H on 9/16/24.
//

import SwiftUI

struct TaskDetailView: View {
    // Temporary view. May combine views
    private let dateViewModel = GetDateViewModel()
    let task: MyTask

    var body: some View {
        VStack {
            Text(task.name)
                .font(.title)
            Text("Due: " + dateViewModel.convertDate(date: task.dueDate))
                .font(.title2)
        }
    }
}

//#Preview {
//    TaskDetailView()
//}
