//
//  OutlineFillButton.swift
//  VitaMind
//
//  Created by Karolis Stasaitis on 10/09/15.
//  Copyright (c) 2015 Memorado GmbH. All rights reserved.
//

import UIKit

class OutlineFillButton : UIButton {
    
    var image: UIImage? {
        didSet {
            setImage(image?.imageWithRenderingMode(.AlwaysTemplate), forState: .Normal)
            setImage(image?.imageWithRenderingMode(.AlwaysTemplate), forState: .Highlighted)
        }
    }
    
    var borderColor: UIColor = UIColor.whiteColor() {
        didSet {
            setTitleColor(borderColor, forState: .Normal)
            highlighted = false
            self.setNeedsDisplay()
        }
    }
    
    var foregroundColor: UIColor = UIColor.blackColor() {
        didSet {
            setTitleColor(foregroundColor, forState: .Highlighted)
            highlighted = false
            self.setNeedsDisplay()
        }
    }
    
    override var highlighted: Bool {
        didSet {
            if highlighted {
                layer.borderColor = borderColor.CGColor
                layer.backgroundColor = borderColor.CGColor
                tintColor = foregroundColor
            } else {
                layer.borderColor = borderColor.CGColor
                layer.backgroundColor = foregroundColor.CGColor
                tintColor = borderColor
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        layer.cornerRadius = 5
        layer.borderWidth = 1
        layer.masksToBounds = true
        contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        highlighted = false
    }
    
}