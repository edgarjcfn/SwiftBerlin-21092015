//
//  DockAdToBottomRightComponent.swift
//  SwiftBerlinDemo1SnapKit
//
//  Created by Edgar Neto on 20/09/15.
//  Copyright © 2015 Edgar Neto. All rights reserved.
//

import Foundation
import UIKit

class DockAdToBottomRightComponent: ViewComponent {
    var container: UIView

    init(adView: AdView, container: UIView) {
        self.container = container
        super.init(view: adView)
    }

    override func onAdd() {
        adView.titleLabel.font = UIFont.systemFontOfSize(17)
        adView.titleLabel.textAlignment = .Center
        adView.titleLabel.alpha = 1.0

        adView.descriptionLabel.font = UIFont.systemFontOfSize(10)
        adView.descriptionLabel.textAlignment = .Center
        adView.descriptionLabel.alpha = 0.0

        UIView.animateWithDuration(1.0, delay: 0,
            options: [.Repeat, .Autoreverse],
            animations: { () -> Void in
                self.adView.titleLabel.alpha = 0.0
                self.adView.descriptionLabel.alpha = 1.0
            }, completion: nil)
    }

    override func setupConstraints() {
        adView.snp_updateConstraints { (make) -> Void in
            make.height.equalTo(130)
            make.width.equalTo(130)
            make.bottom.equalTo(container)
            make.right.equalTo(container)
        }

        adView.image.snp_updateConstraints { (make) -> Void in
            make.top.equalTo(adView).offset(10)
            make.width.equalTo(80)
            make.height.equalTo(80)
            make.centerX.equalTo(adView)
        }

        adView.titleLabel.snp_updateConstraints { (make) -> Void in
            make.bottom.equalTo(adView).offset(-5)
            make.top.equalTo(adView.image.snp_bottom).offset(5)
            make.left.equalTo(adView)
            make.right.equalTo(adView)
        }

        adView.descriptionLabel.snp_updateConstraints { (make) -> Void in
            make.bottom.equalTo(adView).offset(-5)
            make.top.equalTo(adView.image.snp_bottom).offset(5)
            make.left.equalTo(adView)
            make.right.equalTo(adView)
        }
    }

    override func onRemove() {
        adView.snp_removeConstraints()
        adView.image.snp_removeConstraints()
        adView.titleLabel.snp_removeConstraints()
        adView.descriptionLabel.snp_removeConstraints()
    }

    var adView: AdView {
        get {
            return self.view as! AdView
        }
    }

}
