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

        let viewModel = AdViewModel()
        viewModel.description = "This is the most awesome product"
        viewModel.image = "light-bulb-icon"
        viewModel.title = "MemoSpark"

        let bannerView = BannerAdView()
        self.view.addSubview(bannerView)
        bannerView.viewModel = viewModel
    }

}