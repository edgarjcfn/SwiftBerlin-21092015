//
//  DockAdToTopComponent.swift
//  SwiftBerlinDemo1SnapKit
//
//  Created by Edgar Neto on 20/09/15.
//  Copyright © 2015 Edgar Neto. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class DockAdToTopComponent : ViewComponent {
    var container: UIView

    init(adView: AdView, container: UIView) {
        self.container = container
        super.init(view: adView)
    }

    override func onAdd() {
        adView.titleLabel.font = UIFont.systemFontOfSize(22)
        adView.descriptionLabel.font = UIFont.systemFontOfSize(17)
    }

    override func setupConstraints() {
        adView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(container)
            make.left.equalTo(container)
            make.right.equalTo(container)
            make.height.equalTo(140)
        }

        adView.image.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(80)
            make.height.equalTo(80)
            make.left.equalTo(adView).offset(8)
            make.top.equalTo(adView).offset(20)
        }

        adView.titleLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(adView).offset(20)
            make.left.equalTo(adView.image.snp_right).offset(4)
            make.right.equalTo(adView).offset(-8)
        }

        adView.descriptionLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(adView.titleLabel).offset(4)
            make.left.equalTo(adView.image.snp_right).offset(4)
            make.right.equalTo(adView).offset(-8)
            make.bottom.equalTo(adView).offset(-4)
        }
    }

    var adView: AdView {
        get {
            return self.view as! AdView
        }
    }

}