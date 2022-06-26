//  CategoryController.swift
//  TaskList
//  Created by Антон Макаров on 25.03.2022.

import UIKit

class CategoryController: UIViewController {
    let categoryView = CategoryView()
    var category: Category

    var tasks: [ToDo] = [] {
        didSet {
            categoryView.tasksTable.reloadData()
        }
    }

    init(category: Category){
        self.category = category
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Category"
        view = categoryView
        categoryView.titleLabel.text = category.rawValue
        categoryView.tasksTable.delegate = self
        categoryView.tasksTable.dataSource = self
        getTasks()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    private func getTasks() {
        self.tasks = RealmManager.shared.getNewTodos(category: category)
        categoryView.tasksTable.reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CategoryController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TaskCell.reuseId, for: indexPath) as! TaskCell
        cell.titleLabel.text = tasks[indexPath.row].title
        return cell
    }
}
