//
//  TaskCountView.swift
//  MyTasksSwiftUIandSwiftData
//
//  Created by Anthony H on 5/9/24.
//

import SwiftUI
import SwiftData

struct TaskCountView: View {
    @Query private var tasks: [MyTask]

    var body: some View {
        VStack {
            Text("\(tasks.count)")
                .font(.system(size:60))
                .fontWeight(.bold)
                .minimumScaleFactor(0.5)
                .foregroundColor(.blue)
            Text(tasks.count > 1 ? "Tasks" : "MyTask")
        }
    }
}

#Preview {
    TaskCountView()
}
