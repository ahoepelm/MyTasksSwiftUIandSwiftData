//
//  MyTasksViewModel.swift
//  MyTasksSwiftUIandSwiftData
//
//  Created by Anthony H on 7/1/25.
//

import SwiftData

@Observable
class MyTasksViewModel {
    private var modelContext: ModelContext
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }
    
    public func toggleTaskCompletedButtonPressed(task: MyTask) {
        self.markTaskAsComplete(task: task)
    }
    
    public func insertTask(task: MyTask) {
        modelContext.insert(task)
        saveTask(modelContext: modelContext)
    }
    
    public func deletTask(task: MyTask) {
        modelContext.delete(task)
        saveTask(modelContext: modelContext)
    }
    
    private func markTaskAsComplete(task: MyTask) {
        if !task.isDone {
            task.isDone = true
        } else {
            task.isDone = false
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
