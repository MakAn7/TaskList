//  TaskView.swift
//  TaskList
//  Created by Антон Макаров on 28.03.2022.

import UIKit

class TaskView: UIView {
    
    let titleLabel = UILabel(text: "Название задачи", font: FontsLibrary.largeTitle)
    let descriptionTextView = UITextView()
    let categoryLabel = UILabel(text:"Неважное не срочное", font: FontsLibrary.smallTitle)
    let completeButton = UIButton(title: "Выполнить", bgColor: ColorsLibrary.darkGreen, textColor: .white, font: FontsLibrary.fieldButton)

    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        setConstraints()
    }
    
    private func setViews() {
        descriptionTextView.isEditable = false
        descriptionTextView.font = FontsLibrary.positionText
        backgroundColor = .white
        titleLabel.numberOfLines = 3
    }
    
    private func setConstraints() {
        Helper.addSubview(views: [titleLabel,
                                  descriptionTextView,
                                  categoryLabel,
                                  completeButton],
                          to: self)
        
        Helper.tamicOff(views: [titleLabel,
                                descriptionTextView,
                                categoryLabel,
                                completeButton])
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            titleLabel.topAnchor.constraint(equalTo:safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            categoryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            categoryLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),

            descriptionTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            descriptionTextView.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 8),
            descriptionTextView.centerXAnchor.constraint(equalTo: centerXAnchor),
            descriptionTextView.bottomAnchor.constraint(equalTo: completeButton.topAnchor, constant: -24),

            completeButton.widthAnchor.constraint(equalToConstant: 140),
            completeButton.heightAnchor.constraint(equalToConstant: 40),
            completeButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
            completeButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
