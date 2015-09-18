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
                let viewModel = AdViewModel()
                viewModel.description = "This is the most awesome product"
                viewModel.image = "light-bulb-icon"
                viewModel.title = "MemoSpark"

                view.viewModel = viewModel
            }
        default:
            print("Don't know this segue")
        }
    }

}