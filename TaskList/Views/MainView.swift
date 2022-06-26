//  MainView.swift
//  TaskList
//  Created by Антон Макаров on 21.03.2022.

import UIKit

class MainView: UIView {
    let collectionView: UICollectionView!
    let addButton = UIButton(title: "+",
                             bgColor: .clear,
                             textColor: .systemBlue,
                             font: FontsLibrary.fieldButton)
    
    let tableView = TasksTableView()
    
    init() {
        
        collectionView = UICollectionView(frame: CGRect(),
                                          collectionViewLayout: CompositionLayoutManager.createLayout())
        super.init(frame: CGRect())
        backgroundColor = .white
        setViews()
        setConstraints()
    }
    
    private func setViews() {
        collectionView.backgroundColor = .clear
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.reuseId)
        collectionView.isScrollEnabled = false
    }
    
    private func setConstraints() {
        Helper.addSubview(views: [addButton,collectionView,tableView], to: self)
        Helper.tamicOff(views: [addButton,collectionView,tableView])
        
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            addButton.bottomAnchor.constraint(equalTo: collectionView.topAnchor, constant: -10),
            addButton.widthAnchor.constraint(equalToConstant: 50),
            
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 80),
            collectionView.heightAnchor.constraint(equalTo: collectionView.widthAnchor),
            
            tableView.topAnchor.constraint(equalTo: collectionView.bottomAnchor,constant: 5),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -12),
            tableView.leadingAnchor.constraint(equalTo:leadingAnchor,constant: 12),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant:  -20)
        ])
        
        addButton.titleLabel?.font = UIFont(name: "Avenir-black", size: 45)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
