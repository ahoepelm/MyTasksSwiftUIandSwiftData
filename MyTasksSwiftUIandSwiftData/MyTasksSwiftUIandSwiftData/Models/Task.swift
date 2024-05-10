//
//  Task.swift
//  MyTasksSwiftUIandSwiftData
//
//  Created by Anthony H on 5/9/24.
//

import Foundation
import SwiftData

class Task {
    var name: String = ""
    var priority: Priority.RawValue = Priority.low.rawValue
    var dueDate: Date = Date()
    var isDone: Bool = false
    
    init(name: String, priority: Priority.RawValue, dueDate: Date, isDone: Bool) {
        self.name = name
        self.priority = priority
        self.dueDate = dueDate
        self.isDone = isDone
    }
}

enum Priority: String, Codable, Identifiable, CaseIterable {
    case low, medium, high
    var id: Self {
        self
    }
    var descr: LocalizedStringResource {
        switch self {
        case .low:
            "Low"
        case .medium:
            "Medium"
        case .high:
            "High"
        }
    }
}
