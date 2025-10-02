//
//  AddTaskView.swift
//  MyTasksSwiftUIandSwiftData
//
//  Created by Anthony H on 5/10/24.
//

import SwiftUI

struct AddTaskView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    @Bindable var myTask: MyTask
    
    var body: some View {
        Form {
            TextField("Task Name", text: $myTask.name)
            DatePicker("Date", selection: $myTask.dueDate)
            
            Section {
                Picker("Priority", selection: $myTask.priority) {
                    Text("Low").tag("low")
                    Text("Medium").tag("medium")
                    Text("High").tag("high")
                }
                .pickerStyle(.segmented)
            }
        }
        .navigationTitle("Task")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Cancel") {
                    dismiss()
                }
            }
        }
        
        Button("Save") {
            let myTasksViewModel = MyTasksViewModel(modelContext: context)
            
            myTasksViewModel.insertTask(task: myTask)
            dismiss()
        }.disabled(myTask.name.trimmingCharacters(in: .whitespaces).isEmpty)
    }
}

//#Preview {
//    AddTaskView()
//}
