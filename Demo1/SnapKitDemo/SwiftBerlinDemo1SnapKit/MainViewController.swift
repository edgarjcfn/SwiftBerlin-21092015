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
    var button: UIButton!

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
        bannerView.viewModel = AdViewModel.demo()
        view.addSubview(bannerView)

        smallView = AdView()
        smallView.setupViews()
        smallView.viewModel = AdViewModel.demo()
        view.addSubview(smallView)

        dockToTop(bannerView)
        dockToBottomRight(smallView)

        button = UIButton()
        button.setTitle("Continue", forState: .Normal)
        button.setTitleColor(UIColor.color(r: 6, g: 255, b: 242), forState: .Normal)
        button.setTitleColor(UIColor.whiteColor(), forState: .Highlighted)
        button.addTarget(self, action: "onButtonTapped:", forControlEvents: .TouchUpInside)
        view.addSubview(button)
    }

    func setupConstraints() {
        mainLabel.snp_makeConstraints { (make) -> Void in
            make.center.equalTo(view)
            make.leading.equalTo(view)
            make.trailing.equalTo(view)
        }

        button.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(view)
            make.top.equalTo(mainLabel.snp_bottom).offset(10)
        }

        bannerView.setupConstraints()
        smallView.setupConstraints()
    }

    func onButtonTapped(sender: UIView) {

    }

    func dockToTop(adView: AdView) -> ViewComponent {
        let dockComponent = DockAdToTopComponent(adView: adView, container: self.view)
        adView.addComponent(dockComponent)
        return dockComponent
    }

    func dockToBottomRight(adView: AdView) -> ViewComponent {
        let dockComponent = DockAdToBottomRightComponent(adView: adView, container: self.view)
        adView.addComponent(dockComponent)
        return dockComponent
    }
}
