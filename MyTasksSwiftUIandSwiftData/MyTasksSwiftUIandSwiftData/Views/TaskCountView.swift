//
//  TaskCountView.swift
//  MyTasksSwiftUIandSwiftData
//
//  Created by Anthony H on 5/9/24.
//

import SwiftUI

struct TaskCountView: View {
    var taskCount: Int = 3
    
    var body: some View {
        VStack {
            Text("\(taskCount)")
                .font(.system(size:60))
                .fontWeight(.bold)
                //.padding(.horizontal)
                .minimumScaleFactor(0.5)
                .foregroundColor(.blue)
            Text(taskCount > 1 ? "Tasks" : "Task")
        }
    }
}

#Preview {
    TaskCountView()
}
