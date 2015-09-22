//
//  AdViewModel.swift
//  SwiftBerlinDemo1
//
//  Created by Edgar Neto on 16/09/15.
//  Copyright © 2015 Edgar Neto. All rights reserved.
//

import Foundation

class AdViewModel {

    var title:String = ""
    var description:String = ""
    var image:String = ""
    
}

extension AdViewModel {

    static func demo() -> AdViewModel {
        let viewModel = AdViewModel()
        viewModel.description = "This is the most awesome product EVER!"
        viewModel.image = "light-bulb-icon"
        viewModel.title = "Memorado"
        return viewModel
    }

}