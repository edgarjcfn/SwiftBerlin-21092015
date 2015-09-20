//
//  SmallAdViewController.swift
//  SwiftBerlinDemo1
//
//  Created by Edgar Neto on 20/09/15.
//  Copyright © 2015 Edgar Neto. All rights reserved.
//

import Foundation
import UIKit

class SmallAdViewController : AdViewController {

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.titleLabel.alpha = 1.0
        self.descriptionLabel.alpha = 0

        UIView.animateWithDuration(1.0, delay: 0,
            options: [.Repeat, .Autoreverse],
            animations: { () -> Void in
                self.titleLabel.alpha = 0.0
                self.descriptionLabel.alpha = 1.0
            }, completion: nil)

    }
    
}