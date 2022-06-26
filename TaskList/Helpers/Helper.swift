//  Helper.swift
//  TaskList
//  Created by Антон Макаров on 21.03.2022.

import UIKit

class Helper {
    static func tamicOff(views:[UIView]) {
        for view in views {
            view.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    static func addSubview(views: [UIView], to superView: UIView) {
        for view in views {
            superView.addSubview(view)
        }
    }
}

