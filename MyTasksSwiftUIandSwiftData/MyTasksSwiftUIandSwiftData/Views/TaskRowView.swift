//
//  TaskRowView.swift
//  MyTasksSwiftUIandSwiftData
//
//  Created by Anthony H on 5/14/25.
//

import SwiftUI

struct TaskRowView: View {
    private let myTasksViewModel = MyTasksViewModel()
    private let dateViewModel = GetDateViewModel()
    
    let myTask: MyTask
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button("", systemImage: myTasksViewModel.taskCompletedButtonPressed ? "circle.fill" : "circle") {
                    print("Complete button was tapped")
                    myTasksViewModel.toggleTaskCompletedButtonPressed()
                }
                .buttonStyle(PlainButtonStyle())
                
                Text(myTask.name)
                    .font(.title3)
                    .foregroundColor(myTask.priority == "low" ?  Color.green : myTask.priority == "medium" ? Color.orange : myTask.priority == "high" ? Color.gray : Color.red)
            }
            Text(dateViewModel.convertDate(date: myTask.dueDate))
                .font(.subheadline)
                .foregroundColor(.gray)
        }
    }
}

//#Preview {
//    TaskRowView(task: MyTask(name: "Sample Row", priority: "Low", dueDate: .now, isDone: false))
//}
