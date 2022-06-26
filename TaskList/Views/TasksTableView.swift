//  TasksTableView.swift
//  TaskList
//  Created by Антон Макаров on 23.03.2022.

import UIKit


class TasksTableView: UITableView {
    init() {
        super.init(frame: CGRect(), style: .plain)

        register(TaskCell.self, forCellReuseIdentifier: TaskCell.reuseId)
        separatorStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
