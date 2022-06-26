//  StackViewExt.swift
//  TaskList
//  Created by  Антон Макаров on 21.03.2022.

import UIKit

extension UIStackView {
    convenience init(views: [UIView],
                     axis: NSLayoutConstraint.Axis,
                     spacing: CGFloat) {
        
        self.init(arrangedSubviews: views)
        self.axis = axis
        self.spacing = spacing
    }
}
