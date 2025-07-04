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
    private func markTaskAsComplete() {
        if self.taskCompletedButtonPressed {
            print("Task is now complete")
        } else {
            print("Task is incomplete")
        }
        saveTask()
    }
    private func saveTask() {
        print("Task is now saved")
    }
}
