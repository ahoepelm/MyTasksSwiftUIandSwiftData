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

    var body: some View {
        VStack(alignment: .leading) {
            if let myTasksViewModel = myTasksViewModel {
                HStack {
                    Button("", systemImage: myTask.isDone ? "checkmark.square" : "square") {
                        myTasksViewModel.toggleTaskCompletedButtonPressed(task: myTask)
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    VStack(alignment: .leading) {
                        Text(myTask.name)
                            .font(.title3)
                            .foregroundColor(myTask.priority == "low" ?  Color.green : myTask.priority == "medium" ? Color.orange : myTask.priority == "high" ? Color.red : Color.gray)
                        
                        // formatted is supposed to remove the "at" before time stamp. It is still there. Leaving in case it's a bug.
                        Text(myTask.dueDate.formatted(.dateTime.day().month(.abbreviated).hour().minute()))
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
