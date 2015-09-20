//
//  ViewComponent.swift
//  SwiftBerlinDemo1SnapKit
//
//  Created by Edgar Neto on 20/09/15.
//  Copyright © 2015 Edgar Neto. All rights reserved.
//

import Foundation
import UIKit

class ViewComponent: NSObject {

    var view: UIView
    init(view: UIView) {
        self.view = view
    }

    func onAdd() {}
    func onRemove() {}
    func setupConstraints() {}
}