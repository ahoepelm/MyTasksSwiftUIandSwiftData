//
//  MyTask.swift
//  MyTasksSwiftUIandSwiftData
//
//  Created by Anthony H on 5/9/24.
//

import Foundation
import SwiftData

@Model
final class MyTask: Identifiable {
    @Attribute(.unique) var id: String = UUID().uuidString
    
    var name: String
    var priority: Priority.RawValue
    var dueDate: Date
    var isDone: Bool
    
    init(name: String = "", priority: Priority.RawValue = Priority.low.rawValue, dueDate: Date = .now, isDone: Bool = false) {
        self.name = name
        self.priority = priority
        self.dueDate = dueDate
        self.isDone = isDone
    }
}

enum Priority: String, Codable, Identifiable, CaseIterable {
    case none, low, medium, high
    var id: Self {
        self
    }
    var descr: LocalizedStringResource {
        switch self {
        case .none:
            "None"
        case .low:
            "Low"
        case .medium:
            "Medium"
        case .high:
            "High"
        }
    }
}
