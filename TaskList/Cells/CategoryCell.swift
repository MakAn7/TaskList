//  CategoryCell.swift
//  TaskList
//  Created by Антон Макаров on 21.03.2022.

import UIKit

class CategoryCell: UICollectionViewCell {
    static let reuseId = "CategoryCell"
    
    let imageView = UIImageView(image: UIImage(systemName: "ferry.fill"))
    let categoryTitleLabel = UILabel(text: "Имя категории", font: FontsLibrary.smallButton)
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        self.imageView.contentMode = .scaleAspectFit
        setupConstraints()
        backgroundColor = .white
    }
    
    func setupConstraints() {
        let stack = UIStackView(views: [imageView,categoryTitleLabel],
                                axis: .vertical,
                                spacing: 2)
        
        Helper.tamicOff(views: [stack])
        Helper.addSubview(views: [stack], to: self)
        
        categoryTitleLabel.textAlignment = .center
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: topAnchor,constant: 2),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 2),
            stack.centerXAnchor.constraint(equalTo: centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: centerYAnchor)
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
