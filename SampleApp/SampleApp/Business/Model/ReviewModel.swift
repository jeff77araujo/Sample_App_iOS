//
//  ReviewModel.swift
//  SampleApp
//
//  Created by Bruno Sena Nunes da Silva on 29/11/21.
//

import UIKit

struct ReviewModel {

    var items: [Item] = []
    
    struct  Item {
        var key: String
        var value: String
    }
}
