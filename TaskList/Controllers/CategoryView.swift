//  CategoryView.swift
//  TaskList
//  Created by Антон Макаров on 25.03.2022.

import UIKit

class CategoryView: UIView {
    let titleLabel = UILabel(text: "Неважное Несрочное", font: FontsLibrary.fieldButton)
    let tasksTable = TasksTableView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        setConstraints()
        tasksTable.backgroundColor = .clear
    }

    private func setViews() {
        backgroundColor = .white
        titleLabel.backgroundColor = .systemGreen
        titleLabel.textAlignment = .center
        tasksTable.backgroundColor = .clear
    }
    
    private func setConstraints() {
        
        Helper.tamicOff(views: [titleLabel,tasksTable])
        Helper.addSubview(views: [titleLabel,tasksTable], to: self)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            tasksTable.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            tasksTable.leftAnchor.constraint(equalTo: titleLabel.leftAnchor),
            tasksTable.centerXAnchor.constraint(equalTo: centerXAnchor),
            tasksTable.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
