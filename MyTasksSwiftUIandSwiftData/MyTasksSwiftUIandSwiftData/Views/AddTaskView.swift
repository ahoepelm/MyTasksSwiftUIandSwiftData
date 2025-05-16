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
    @State private var taskPriority: Priority = .none
    @State private var priorityString = ""
    @State private var date = Date()
    @State private var sheetShowing: Bool = false
    private let dateViewModel = GetDateViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    TextField("Task Name", text: $name)
                    HStack {
                        Text(dateViewModel.convertDate(date: date))
                        
                        Button("", systemImage: "calendar") {
                            sheetShowing.toggle()
                        }
                        .font(.title3)
                    }
                    if sheetShowing {
                        DatePicker("", selection: $date, in: Date()..., displayedComponents: [.date, .hourAndMinute])
                            //.datePickerStyle(.graphical)
                            .datePickerStyle(.compact)
                    }
                    HStack {
                        Button("Low") {
                            taskPriority = .low
                            priorityString = "low"
                        }
                        .background(taskPriority == .low ? .green : .gray, in: Capsule())
                        Button("Medium") {
                            taskPriority = .medium
                            priorityString = "medium"
                        }
                        .background(taskPriority == .medium ? .orange : .gray, in: Capsule())
                        Button("High") {
                            taskPriority = .high
                            priorityString = "high"
                        }
                        .background(taskPriority == .high ? .red : .gray, in: Capsule())
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
            let task = MyTask(name: name, priority: priorityString, dueDate: date, isDone: false)
            context.insert(task)
            do {
                try context.save()
            } catch {
                // TODO: create proper alert
                print(error.localizedDescription)
            }
            dismiss()
        }.disabled(name.trimmingCharacters(in: .whitespaces).isEmpty)
    }
}

#Preview {
    AddTaskView()
}
