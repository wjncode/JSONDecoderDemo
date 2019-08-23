//
//  ProductListModel.swift
//  JSONDecoderDemo
//
//  Created by mainone001 on 23/8/2019.
//  Copyright © 2019 wjn. All rights reserved.
//

import UIKit

struct ProductListModel: Codable {
    var code: Int
    var msg: String
    var datas: [GroceryProduct]
}
