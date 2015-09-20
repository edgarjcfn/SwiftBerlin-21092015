//
//  MainViewController.swift
//  SwiftBerlinDemo1
//
//  Created by Edgar Neto on 16/09/15.
//  Copyright © 2015 Edgar Neto. All rights reserved.
//

import Foundation
import UIKit

class MainViewController : UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        switch (segue.identifier!) {
        case "EmbedBanner", "EmbedSmall":
            if let view = segue.destinationViewController as? AdViewController {
                view.viewModel = AdViewModel.demo()
            }
        default:
            print("Don't know this segue")
        }
    }

}