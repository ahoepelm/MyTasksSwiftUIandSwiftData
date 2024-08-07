//
//  MyTasksSwiftUIandSwiftDataApp.swift
//  MyTasksSwiftUIandSwiftData
//
//  Created by Anthony H on 4/24/24.
//

import SwiftUI
import SwiftData

@main
struct MyTasksSwiftUIandSwiftDataApp: App {
    var body: some Scene {
        WindowGroup {
            MyTasksView()
        }
        // Adding the container for storing the data
        .modelContainer(for: [MyTask.self])
    }
}
