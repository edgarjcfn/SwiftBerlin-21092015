//
//  UIView+Convenience.swift
//  VitaMind
//
//  Created by Karolis Stasaitis on 21/08/15.
//  Copyright (c) 2015 Memorado GmbH. All rights reserved.
//

import UIKit

extension UIView {
    
    func addSubviews(views: UIView...) {
        addSubviews(views)
    }
    
    func addSubviews(views: [UIView]) {
        for view in views {
            self.addSubview(view)
        }
    }
    
}