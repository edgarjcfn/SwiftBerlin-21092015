//
//  UIButton+Closures.swift
//  VitaMind
//
//  Created by Karolis Stasaitis on 11/09/15.
//  Copyright (c) 2015 Memorado GmbH. All rights reserved.
//

import UIKit

var UIButtonTouchUpInsideHandlerKey: UInt8 = 0

extension UIButton {
    
    typealias UIButtonControlEventHandler = (UIButton) -> ()
    
    var vm_onTouchUpInside: UIButtonControlEventHandler? {
        get {
            return (objc_getAssociatedObject(self, &UIButtonTouchUpInsideHandlerKey) as? ClosureWrapper)?.closure as? UIButtonControlEventHandler
        }
        set {
            if let handler = newValue {
                objc_setAssociatedObject(self, &UIButtonTouchUpInsideHandlerKey, ClosureWrapper(handler), objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                addTarget(self, action: "vm_performTouchUpInside:", forControlEvents: .TouchUpInside)
            }
            else {
                objc_setAssociatedObject(self, &UIButtonTouchUpInsideHandlerKey, nil, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                removeTarget(self, action: "vm_performTouchUpInside:", forControlEvents: .TouchUpInside)
            }
        }
    }
    
    func vm_performTouchUpInside(button: UIButton) {
        vm_onTouchUpInside?(button)
    }
    
}

extension UIControlEvents: Hashable {
    
    public var hashValue: Int {
        return Int(rawValue)
    }
    
}

class ClosureWrapper {
    
    let closure: Any
    
    init (_ closure: Any) {
        self.closure = closure
    }
    
}