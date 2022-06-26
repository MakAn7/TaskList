//  RealmManager.swift
//  TaskList
//  Created by Антон Макаров on 23.03.2022.

import RealmSwift

class RealmManager {
    private let realm = try! Realm()
    static let shared = RealmManager()
    private init() { }
    
    func writeToDo(todo: ToDo) {
        try! realm.write({
            realm.add(todo)
            
        })
    }

    func makeDone(task:ToDo) {
        try! realm.write {
            task.isComplete = true
        }
    }
    
    func getCompletedTodos(category:Category? = nil) -> [ToDo] {
        var todos = [ToDo]()
        let taskInDB = realm.objects(ToDo.self)
        
        if let category = category {
            for todo in taskInDB  where todo.category == category.rawValue && todo.isComplete {
                todos.append(todo)
            }
        } else {
            for todo in taskInDB where todo.isComplete {
                todos.append(todo)
                
            }
        }
        return todos
    }
    
    func getNewTodos(category: Category? = nil) -> [ToDo] {
        var todos = [ToDo]()
        
        let taskInDB = realm.objects(ToDo.self)
        
        if let category = category {
            for todo in taskInDB  where todo.category == category.rawValue && !todo.isComplete {
                todos.append(todo)
            }
        } else {
            for todo in taskInDB where !todo.isComplete {
                todos.append(todo)
                
            }
        }
        return todos
    }
    
    func printConfig() {
        print(realm.configuration.fileURL!.absoluteString)
    }
    
    func removeFromDB(todo: ToDo)  {
        try! realm.write({
            realm.delete(todo)
        })
    }
}

