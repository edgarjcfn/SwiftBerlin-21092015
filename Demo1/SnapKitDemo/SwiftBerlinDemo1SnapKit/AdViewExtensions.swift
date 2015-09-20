//
//  AdViewExtensions.swift
//  SwiftBerlinDemo1SnapKit
//
//  Created by Edgar Neto on 20/09/15.
//  Copyright © 2015 Edgar Neto. All rights reserved.
//

import Foundation

extension AdView {
    func addComponent(component: ViewComponent) {
        self.components.append(component)
        component.onAdd()
    }

    func removeComponent(component: ViewComponent) {
        if let index = components.indexOf(component) {
            component.onRemove()
            components.removeAtIndex(index)
        }
    }
}