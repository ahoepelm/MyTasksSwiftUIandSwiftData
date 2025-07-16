//
//  TaskRowView.swift
//  MyTasksSwiftUIandSwiftData
//
//  Created by Anthony H on 5/14/25.
//

import SwiftUI

struct TaskRowView: View {
    @Environment(\.modelContext) var context
    @State var myTasksViewModel: MyTasksViewModel? = nil

    let myTask: MyTask
    private let dateViewModel = GetDateViewModel()

    var body: some View {
        VStack(alignment: .leading) {
            if let myTasksViewModel = myTasksViewModel {
                HStack {
                    Button("", systemImage: myTasksViewModel.taskCompletedButtonPressed ? "checkmark.square" : "square") {
                        myTasksViewModel.toggleTaskCompletedButtonPressed()
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    VStack(alignment: .leading) {
                        Text(myTask.name)
                            .font(.title3)
                            .foregroundColor(myTask.priority == "low" ?  Color.green : myTask.priority == "medium" ? Color.orange : myTask.priority == "high" ? Color.red : Color.gray)
                        
                        Text(dateViewModel.convertDate(date: myTask.dueDate))
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
        }
        .onAppear { // this is not working without the upper VStack
            if myTasksViewModel == nil {
                myTasksViewModel = MyTasksViewModel(modelContext: context)
            }
        }
    }
}

//#Preview {
//    TaskRowView(task: MyTask(name: "Sample Row", priority: "Low", dueDate: .now, isDone: false))
//}
