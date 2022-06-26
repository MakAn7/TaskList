//  AddTaskView.swift
//  TaskList
//  Created by Антон Макаров on 22.03.2022.

import UIKit

class AddTaskView: UIView {
    let titleTF = UITextField(placeholder: "Назавание задачи", isShadow: true)
    let descriptionTF = UITextField(placeholder: "Описание задачи", isShadow: true)
    
    let isUrgentLabel = UILabel(text: "Cрочно?", font: FontsLibrary.cellText)
    let isImportantLabel = UILabel(text: "Важно?", font: FontsLibrary.cellText)
    
    let isUrgentsSwitch = UISwitch()
    let isImportantSwitch = UISwitch()
    
    let saveButton = UIButton(title: "Сохранить",
                              bgColor: ColorsLibrary.darkGreen,
                              textColor: .white,
                              font: FontsLibrary.fieldButton)
    
    init() {
        super.init(frame: CGRect())
        backgroundColor = .white
        setConstraints()
    }
    
    private func setConstraints() {
        let uStack = UIStackView(views: [isUrgentLabel,isUrgentsSwitch],
                                 axis: .vertical,
                                 spacing: 4)
        
        let iStach = UIStackView(views: [isImportantLabel,isImportantSwitch],
                                 axis: .vertical,
                                 spacing: 4)
        
        let iuStack = UIStackView(views: [iStach,uStack],
                                  axis: .horizontal,
                                  spacing: 24)
        let stack = UIStackView(views: [titleTF,descriptionTF,iuStack,saveButton],
                                axis: .vertical,
                                spacing: 18)
        
        Helper.tamicOff(views: [stack])
        Helper.addSubview(views: [stack], to: self)
        
        NSLayoutConstraint.activate([
            stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 36),
            stack.centerXAnchor.constraint(equalTo: centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
