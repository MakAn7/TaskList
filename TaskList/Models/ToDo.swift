//  ToDo.swift
//  TaskList
//  Created by Антон Макаров on 21.03.2022.

import Foundation
import RealmSwift

enum Category: String {
    
    case impUrg = "Важное срочное"
    case impNotUrg = "Важное несрочное"
    case notImpUrg = "Неважное срочное"
    case notImpNotUrg = "Неважное несрочное"
}

class ToDo: Object {
    
    @Persisted var title: String = ""
    @Persisted var id: String = UUID().uuidString
    @Persisted var descript : String
    @Persisted var category: String
    @Persisted var isComplete: Bool = false

    override class func primaryKey() -> String? { "id" }

    convenience init(title: String, descript: String, category: Category) {
        self.init()
        self.title = title
        self.descript = descript
        self.category = category.rawValue
    }
}



