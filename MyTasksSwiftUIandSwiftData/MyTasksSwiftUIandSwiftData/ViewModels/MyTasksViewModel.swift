//
//  MyTasksViewModel.swift
//  MyTasksSwiftUIandSwiftData
//
//  Created by Anthony H on 7/1/25.
//

import SwiftData

@Observable
class MyTasksViewModel {
    var taskCompletedButtonPressed: Bool = false
    private var modelContext: ModelContext
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }
    
    public func toggleTaskCompletedButtonPressed() {
        self.taskCompletedButtonPressed.toggle()
        self.markTaskAsComplete()
    }
    
    public func insertTask(task: MyTask) {
        modelContext.insert(task)
        saveTask(modelContext: modelContext)
    }
    
    public func deletTask(task: MyTask) {
        modelContext.delete(task)
        saveTask(modelContext: modelContext)
    }
    
    private func markTaskAsComplete() {
        if self.taskCompletedButtonPressed {
            print("Task is now complete")
        } else {
            print("Task is incomplete")
        }
        saveTask(modelContext: modelContext)
    }
    
    private func saveTask(modelContext: ModelContext) {
        do {
            try modelContext.save()
        } catch {
            // TODO: create proper alert
            print(error.localizedDescription)
        }
    }
}
