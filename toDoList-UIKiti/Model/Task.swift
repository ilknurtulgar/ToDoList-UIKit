//
//  Task.swift
//  toDoList-UIKiti
//
//  Created by İlknur Tulgar on 26.11.2025.
//

import Foundation

class Task: Codable {
    
    var title: String
    var isDone: Bool
    
    init(title: String, isDone: Bool = false) {
        self.title = title
        self.isDone = isDone
    }
}

