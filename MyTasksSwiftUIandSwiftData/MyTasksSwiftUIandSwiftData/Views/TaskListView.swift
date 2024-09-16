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
    private let dateViewModel = GetDateViewModel()
    
    init(sortOrder: Bool, filterString: String) {
        let sortDescriptors: [SortDescriptor<MyTask>] = switch sortOrder {
        case true:
            [SortDescriptor(\MyTask.name)]
        case false:
            [SortDescriptor(\MyTask.name, order: .reverse)]
        }

        let predicate = #Predicate<MyTask> { task in
            task.name.localizedStandardContains(filterString)
            || filterString.isEmpty
        }
        _myTasks = Query(filter: predicate, sort: sortDescriptors)
    }

    var body: some View {
        NavigationStack {
            List {
                ForEach(myTasks, id: \.id) { task in
                    NavigationLink(value: task) {
                        VStack(alignment: .leading) {
                            Text(task.name)
                                .font(.title3)
                            Text(dateViewModel.convertDate(date: task.dueDate))
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }.onDelete(perform: deleteTask)
            }
            .navigationDestination(for: MyTask.self, destination: TaskDetailView.init)
        }
    }
    
    private func deleteTask(indexChosen: IndexSet) {
        indexChosen.forEach { index in
            let task = myTasks[index]
            context.delete(task)
            
            do {
                // Try to save the deletion in storage
                try context.save()
            } catch {
                // TODO: Create proper notification
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    TaskListView(sortOrder: true, filterString: "")
}
