//
//  TaskDetailView.swift
//  MyTasksSwiftUIandSwiftData
//
//  Created by Anthony H on 9/16/24.
//

import SwiftUI

struct TaskDetailView: View {
    // Temporary view. May combine views
    let myTask: MyTask

    var body: some View {
        VStack {
            Text(myTask.name)
                .font(.title)
            Text(myTask.dueDate.formatted(.dateTime.day().month(.abbreviated).hour().minute()))
                .font(.title2)
        }
    }
}

//#Preview {
//    TaskDetailView()
//}
