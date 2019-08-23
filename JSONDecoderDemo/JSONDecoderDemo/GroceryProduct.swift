//
//  GroceryProduct.swift
//  JSONDecoderDemo
//
//  Created by mainone001 on 23/8/2019.
//  Copyright © 2019 wjn. All rights reserved.
//

import UIKit

struct GroceryProduct: Codable {
    var ID: Int
    var name: String
    var points: Int?
    var description: String?
    var parameters: Parameters?
    
    enum CodingKeys: String, CodingKey {
        case ID = "id"
        case name
        case points
        case description
        case parameters
    }
    
  
    struct Parameters: Codable {
        var size: String?
        var area: String?
        var quality: Quality?
    }
    
    enum Quality: String, Codable {
        case good, caporal, bad
    }
    
 
}


