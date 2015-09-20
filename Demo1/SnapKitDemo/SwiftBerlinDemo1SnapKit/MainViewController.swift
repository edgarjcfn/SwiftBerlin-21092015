//
//  MainViewController.swift
//  SwiftBerlinDemo1SnapKit
//
//  Created by Edgar Neto on 20/09/15.
//  Copyright © 2015 Edgar Neto. All rights reserved.
//

import Foundation
import SnapKit
import UIKit

class MainViewController: UIViewController {

    var mainLabel: UILabel!
    var bannerView: AdView!
    var smallView: AdView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }


    func setupViews() {
        view.backgroundColor = UIColor.color(r:4, g: 161, b: 153)

        mainLabel = UILabel()
        mainLabel.text = "My Awesome App"
        mainLabel.textAlignment = .Center
        mainLabel.font = UIFont.systemFontOfSize(30)
        mainLabel.textColor = UIColor.whiteColor()
        view.addSubview(mainLabel)

        bannerView = AdView()
        bannerView.setupViews()
        bannerView.addComponent(DockAdToTopComponent(adView: bannerView, container: self.view))
        bannerView.viewModel = AdViewModel.demo()
        view.addSubview(bannerView)

        smallView = AdView()
        smallView.setupViews()
        smallView.addComponent(DockAdToBottomRightComponent(adView: smallView, container: self.view))
        smallView.viewModel = AdViewModel.demo()
        view.addSubview(smallView)
    }

    func setupConstraints() {
        mainLabel.snp_makeConstraints { (make) -> Void in
            make.center.equalTo(view)
            make.leading.equalTo(view)
            make.trailing.equalTo(view)
        }

        bannerView.setupConstraints()
        smallView.setupConstraints()
    }
}
