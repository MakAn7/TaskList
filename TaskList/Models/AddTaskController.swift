//  AddTaskController.swift
//  TaskList
//  Created by Антон Макаров on 22.03.2022.

import UIKit

protocol addTaskDelegate {
    func getToDos()
}

class AddTaskController: UIViewController {
    let addTaskView = AddTaskView()
    var delegate: addTaskDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = addTaskView
        addTargets()
    }

    private func addTargets() {
        addTaskView.saveButton.addTarget(self, action: #selector(writeTask), for: .touchUpInside)
    }
    
    @objc private func writeTask() {
        guard let title = addTaskView.titleTF.text else { return }
        guard let description = addTaskView.descriptionTF.text else { return }
        
        let isUrgent = addTaskView.isUrgentsSwitch.isOn
        let isImportant = addTaskView.isImportantSwitch.isOn
        
        var category: Category
        
        if isUrgent && isImportant {
            category = .impUrg
        } else if isUrgent && !isImportant {
            category = .notImpUrg
        } else if !isUrgent && isImportant {
            category = .impNotUrg
        } else {
            category = .notImpNotUrg
        }

        let task = ToDo(title: title,
                        descript: description,
                        category: category)
        RealmManager.shared.writeToDo(todo: task)
        delegate?.getToDos()
        dismiss(animated: true)
    }
}
