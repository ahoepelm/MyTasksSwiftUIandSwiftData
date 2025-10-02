//
//  TaskListView.swift
//  MyTasksSwiftUIandSwiftData
//
//  Created by Anthony H on 5/10/24.
//

import SwiftUI
import SwiftData

struct TaskListView: View {
    // Get the context from the environment
    @Environment(\.modelContext) private var context
    // Fetches the data from storage
    @Query private var myTasks: [MyTask]
    
    init(sortOrder: Bool, filterString: String, predicate: Predicate<MyTask>) {
        let sortDescriptors: [SortDescriptor<MyTask>] = switch sortOrder {
        case true:
            [SortDescriptor(\MyTask.name)]
        case false:
            [SortDescriptor(\MyTask.name, order: .reverse)]
        }
        _myTasks = Query(filter: predicate, sort: sortDescriptors)
    }
    
    var body: some View {
        if myTasks.isEmpty {
            ContentUnavailableView.search
        } else {
            List {
                ForEach(myTasks, id: \.id) { task in
                    NavigationLink(value: task) {
                        TaskRowView(myTask: task)
                    }
                    // By default list divider will align to text. This aligns to whole row.
                    .alignmentGuide(.listRowSeparatorLeading) { d in
                        d[.leading]
                    }
                }.onDelete(perform: deleteTask)
            }
        }
    }
    
    private func deleteTask(indexChosen: IndexSet) {
        indexChosen.forEach { index in
            let task = myTasks[index]
            let myTasksViewModel = MyTasksViewModel(modelContext: context)
            myTasksViewModel.deletTask(task: task)
        }
    }
}

//#Preview {
//    TaskListView(sortOrder: true, filterString: "")
//}
