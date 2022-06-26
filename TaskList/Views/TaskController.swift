//  TaskController.swift
//  TaskList
//  Created by Антон Макаров on 28.03.2022.

import UIKit

class TaskController: UIViewController {
    let taskView = TaskView()
    var delegate: addTaskDelegate?
    var toDo: ToDo
    
    init(toDo: ToDo) {
        self.toDo = toDo
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        view = taskView
        setupView()
        addTarget()
        checkDone()
    }

    func checkDone() {
        guard toDo.isComplete else { return }
        taskView.completeButton.isEnabled = false
        taskView.completeButton.setTitle("Yже выполнено", for: .disabled)
    }

    func addTarget() {
        taskView.completeButton.addTarget(self, action: #selector(makeComplete), for: .touchUpInside)
    }
    
    @objc func makeComplete() {
        RealmManager.shared.makeDone(task: toDo)
        delegate?.getToDos()
        navigationController?.popToRootViewController(animated: true)
        
    }
    
    func setupView() {
        taskView.categoryLabel.text = toDo.category
        taskView.descriptionTextView.text = toDo.descript
        taskView.titleLabel.text = toDo.title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
