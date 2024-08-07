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
    @State private var name = ""
    @State private var priority: Priority = .low
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Task Name", text: $name)
                
            }
            .navigationTitle("Task")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
        Button("Save") {
            let task = MyTask(name: name, priority: "Low", dueDate: .now, isDone: false)
            context.insert(task)
            do {
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
            dismiss()
        }.disabled(name.trimmingCharacters(in: .whitespaces).isEmpty)
    }
}

#Preview {
    AddTaskView()
}
