//  ViewController.swift
//  TaskList
//  Created by Антон Макаров on 21.03.2022.

import UIKit

class MainController: UIViewController, addTaskDelegate {
    let mainView = MainView()
    var completedTodos = [ToDo]()
    var todos = [ToDo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        
        addTargets()
        getToDos()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        mainView.tableView.reloadData()
    }

    func getToDos () {
        todos = RealmManager.shared.getNewTodos()
        completedTodos = RealmManager.shared.getCompletedTodos()
        mainView.tableView.reloadData()
    }
    
}

extension MainController : UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.reuseId, for: indexPath) as! CategoryCell
        
        cell.layer.cornerRadius = 15
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowRadius = 4
        cell.layer.shadowOpacity = 0.8
        cell.layer.shadowOffset = CGSize(width: 2, height: 2)
        
        switch indexPath.item {
        case 0:
            cell.imageView.image = UIImage(systemName: "tornado")
            cell.categoryTitleLabel.text = "Важное Срочное"
        case 1:
            cell.imageView.image = UIImage(systemName: "tortoise")
            cell.categoryTitleLabel.text = "Важное Несрочное"
        case 2:
            cell.imageView.image = UIImage(systemName: "hare")
            cell.categoryTitleLabel.text = "Неважное Срочное"
        case 3:
            cell.imageView.image = UIImage(systemName: "shippingbox")
            cell.categoryTitleLabel.text = "Неважное Несрочное"
        default:
            break
        }
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let category: Category
        
        switch indexPath.item {
        case 0:
            category = .impUrg
        case 1:
            category = .impNotUrg
        case 2:
            category = .notImpUrg
        default:
            category = .notImpNotUrg
        }
        
        let categoryVC = CategoryController(category: category)
        categoryVC.modalPresentationStyle = .fullScreen
        navigationController?.show(categoryVC, sender: nil)
    }
    
    private func addTargets() {
        mainView.addButton.addTarget(self, action: #selector (presentAddVC), for: .touchUpInside)
    }
    
    @objc private func presentAddVC() {
        
        let addVC = AddTaskController()
        addVC.delegate = self
        present(addVC, animated: true, completion: nil)
    }
}

extension MainController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return todos.count
        case 1:
            return completedTodos.count
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TaskCell.reuseId, for: indexPath) as! TaskCell
        cell.selectionStyle = .none
        
        switch indexPath.section {
        case 0:
            cell.titleLabel.text = todos[indexPath.row].title
            switch todos[indexPath.row].category {
            case Category.impUrg.rawValue:
                cell.categoryIndicator.backgroundColor = .yellow
            case Category.impNotUrg.rawValue:
                cell.categoryIndicator.backgroundColor = .systemBlue
            case Category.notImpUrg.rawValue:
                cell.categoryIndicator.backgroundColor = .orange
            default:
                cell.categoryIndicator.backgroundColor = .systemMint
            }
        case 1:
            cell.titleLabel.text = completedTodos[indexPath.row].title
            cell.categoryIndicator.backgroundColor = .red
        default: break
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        42
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return todos.count > 0 ? "Новая задача" : nil
        case 1:
            return completedTodos.count > 0 ? "Выполненная задача" : nil
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            let taskVC = TaskController(toDo: todos[indexPath.row])
            navigationController?.show(taskVC, sender: nil)
            taskVC.delegate = self
        case 1:
            let taskVC = TaskController(toDo: completedTodos[indexPath.row])
            navigationController?.show(taskVC, sender: nil)
            taskVC.delegate = self
        default: break
        }
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive,
                                              title: "Delete") { _, _, _ in
            switch indexPath.section {
            case 0:
                RealmManager.shared.removeFromDB(todo: self.todos[indexPath.row])
                self.todos.remove(at: indexPath.row)
            case 1:
                RealmManager.shared.removeFromDB(todo: self.completedTodos[indexPath.row])
                self.completedTodos.remove(at: indexPath.row)
            default: break
            }
            tableView.reloadData()
        }
        let trailingConfig = UISwipeActionsConfiguration(actions: [deleteAction])
        return trailingConfig
    }
}

