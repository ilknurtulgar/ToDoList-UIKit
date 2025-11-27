//
//  TaskViewModel.swift
//  toDoList-UIKiti
//
//  Created by İlknur Tulgar on 26.11.2025.
//

import Foundation

class TaskViewModel {
    private(set) var tasks: [Task] = []
    
    init() {
        loadTasks()
    }
    
    func addTask(title: String){
        let newTask = Task(title: title)
        tasks.append(newTask)
        saveTasks()
    }
    
    func toggleTask(task: Task){
          task.isDone.toggle()
          saveTasks()
      }
    
    func deleteTask(at index: Int){
        guard tasks.indices.contains(index) else { return }
        tasks.remove(at: index)
        saveTasks()
    }
    
    private func saveTasks(){
        if let encoded = try? JSONEncoder().encode(tasks) {
                 UserDefaults.standard.set(encoded, forKey: "tasks")
                 UserDefaults.standard.synchronize()
             }
      }

    
    private func loadTasks(){
        //json data to swift code
        if let data = UserDefaults.standard.data(forKey: "tasks"),
           let savedTasks = try? JSONDecoder().decode([Task].self, from: data) {
            tasks = savedTasks
        }
    }
}
