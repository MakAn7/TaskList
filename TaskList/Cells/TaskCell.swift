//  TaskCell.swift
//  TaskList
//  Created by Антон Макаров on 23.03.2022.

import UIKit

class TaskCell: UITableViewCell {
    static let reuseId = "TaskCell"
    
    let titleLabel = UILabel(text: "Название задачи", font: FontsLibrary.cellText)
    let categoryIndicator = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setViews()
        setConstraints()
        
    }
    
    private func setViews() {
        categoryIndicator.layer.cornerRadius = 18
        categoryIndicator.backgroundColor = .gray
    }
    
    private func setConstraints() {
        let stack = UIStackView(views: [categoryIndicator,titleLabel],
                                axis: .horizontal,
                                spacing: 12)
        Helper.addSubview(views: [stack], to: self)
        Helper.tamicOff(views: [stack])
        
        NSLayoutConstraint.activate([
            stack.leadingAnchor.constraint(equalTo: leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor),
            stack.heightAnchor.constraint(equalToConstant: 36),
            stack.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            categoryIndicator.heightAnchor.constraint(equalToConstant: 36),
            categoryIndicator.widthAnchor.constraint(equalTo:categoryIndicator.heightAnchor)
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
