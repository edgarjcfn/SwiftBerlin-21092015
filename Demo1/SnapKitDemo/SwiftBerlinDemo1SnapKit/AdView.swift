//
//  AdView.swift
//  SwiftBerlinDemo1SnapKit
//
//  Created by Edgar Neto on 20/09/15.
//  Copyright © 2015 Edgar Neto. All rights reserved.
//

import Foundation
import UIKit

class AdView: UIView {

    var image: UIImageView!
    var titleLabel: UILabel!
    var descriptionLabel: UILabel!

    var components = [ViewComponent]()

    func setupViews() {
        self.backgroundColor = UIColor.whiteColor()
        
        image = UIImageView()
        addSubview(image)

        titleLabel = UILabel()
        addSubview(titleLabel)

        descriptionLabel = UILabel()
        addSubview(descriptionLabel)
    }

    func setupConstraints() {
        for component in components {
            component.setupConstraints()
        }
    }

    var viewModel: AdViewModel! {
        didSet {
            titleLabel.text = viewModel.title
            descriptionLabel.text = viewModel.description
            image.image = UIImage(named: viewModel.image)
        }
    }

}