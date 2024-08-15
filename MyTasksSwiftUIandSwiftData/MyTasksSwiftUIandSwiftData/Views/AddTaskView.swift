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
    @State private var priority: Priority = .none
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    TextField("Task Name", text: $name)
                    HStack {
                        Button("Low") {
                            priority = .low
                        }
                        .background(priority == .low ? .green : .gray, in: Capsule())
                        Button("Medium") {
                            priority = .medium
                        }
                        .background(priority == .medium ? .orange : .gray, in: Capsule())
                        Button("High") {
                            priority = .high
                        }
                        .background(priority == .high ? .red : .gray, in: Capsule())
                    }
                    .buttonStyle(OvalButton())
                    .frame(maxWidth: .infinity, alignment: .center)
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
