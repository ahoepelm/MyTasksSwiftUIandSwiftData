//
//  TaskRowView.swift
//  MyTasksSwiftUIandSwiftData
//
//  Created by Anthony H on 5/14/25.
//

import SwiftUI

struct TaskRowView: View {
    private let dateViewModel = GetDateViewModel()
    
    let task: MyTask
    
    var body: some View {        
        VStack(alignment: .leading) {
            Text(task.name)
                .font(.title3)
            Text(dateViewModel.convertDate(date: task.dueDate))
                .font(.subheadline)
                .foregroundColor(.gray)
        }
    }
}

//#Preview {
//    TaskRowView(task: MyTask(name: "Sample Row", priority: "Low", dueDate: .now, isDone: false))
//}
