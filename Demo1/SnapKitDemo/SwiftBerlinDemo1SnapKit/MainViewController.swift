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
    var adView1: AdView!
    var adView2: AdView!
    var button: UIButton!

    var dockTop: DockAdToTopComponent!
    var dockBottomRight: DockAdToBottomRightComponent!

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

        adView1 = AdView()
        adView1.setupViews()
        adView1.viewModel = AdViewModel.demo()
        view.addSubview(adView1)

        adView2 = AdView()
        adView2.setupViews()
        adView2.viewModel = AdViewModel.demo()
        view.addSubview(adView2)

        button = UIButton()
        button.setTitle("Continue", forState: .Normal)
        button.setTitleColor(UIColor.color(r: 6, g: 255, b: 242), forState: .Normal)
        button.setTitleColor(UIColor.whiteColor(), forState: .Highlighted)
        button.addTarget(self, action: "onButtonTapped:", forControlEvents: .TouchUpInside)
        view.addSubview(button)


        // Let's make this ad a banner on the top
        dockTop = DockAdToTopComponent(adView: adView1, container: self.view)
        adView1.addComponent(dockTop)

        // Let's make this ad a small one
        dockBottomRight = DockAdToBottomRightComponent(adView: adView2, container: self.view)
        adView2.addComponent(dockBottomRight)
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

        adView1.setupConstraints()
        adView2.setupConstraints()
    }

    func onButtonTapped(sender: UIView) {
        UIView.animateWithDuration(2) { () -> Void in
            self.adView1.removeComponent(self.dockTop)
            self.adView1.addComponent(
                DockAdToBottomRightComponent(adView: self.adView1, container: self.view)
            )

            self.adView1.setupConstraints()
        }

    }
}
