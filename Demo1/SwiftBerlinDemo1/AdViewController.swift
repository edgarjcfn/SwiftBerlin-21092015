//
//  AdView.swift
//  SwiftBerlinDemo1
//
//  Created by Edgar Neto on 16/09/15.
//  Copyright © 2015 Edgar Neto. All rights reserved.
//

import Foundation
import UIKit

class AdViewController : UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!

    var viewModel: AdViewModel?

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if let viewModel = self.viewModel {
            titleLabel?.text = viewModel.title
            image?.image = UIImage(named: viewModel.image)
            descriptionLabel?.text = viewModel.description
        }
    }
}