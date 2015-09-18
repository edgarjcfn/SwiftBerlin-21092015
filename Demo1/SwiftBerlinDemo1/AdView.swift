//
//  AdView.swift
//  SwiftBerlinDemo1
//
//  Created by Edgar Neto on 16/09/15.
//  Copyright © 2015 Edgar Neto. All rights reserved.
//

import Foundation
import UIKit

class AdView : UIView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!

    var viewModel: AdViewModel! {
        didSet {
            titleLabel?.text = viewModel.title
            image?.image = UIImage(contentsOfFile: viewModel.image)
            descriptionLabel?.text = viewModel.description
        }
    }

}