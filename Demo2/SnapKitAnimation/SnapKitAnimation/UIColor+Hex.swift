//
//  UIColor+Hex.swift
//  Memorado
//
//  Created by Tadas Ziemys on 01/06/15.
//  Copyright (c) 2015 Memorado GmbH. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int, alphaValue: CGFloat = 1.0) {
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alphaValue)
    }
    
    convenience init(_ hex: Int, alpha: CGFloat = 1.0) {
        self.init(red:(hex >> 16) & 0xff, green:(hex >> 8) & 0xff, blue:hex & 0xff, alphaValue: alpha)
    }
    
}