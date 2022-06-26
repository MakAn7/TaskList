//  LabelExt.swift
//  TaskList
//  Created by  Антон Макаров on 21.03.2022.

import UIKit

extension UILabel {
    convenience init(text: String, font: UIFont?) {
        self.init(frame: CGRect())
        self.text = text
        self.font = font
    }
}
