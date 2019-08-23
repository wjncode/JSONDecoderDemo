//
//  ViewController.swift
//  JSONDecoderDemo
//
//  Created by mainone001 on 23/8/2019.
//  Copyright © 2019 wjn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let decoder = JSONDecoder()
        let product = try? decoder.decode(GroceryProduct.self, from: json)

        print(product?.description ?? "nil")
        
        
        do {
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let product2 = try decoder.decode(GroceryProduct.self, from: json2)
            print(product2.parameters?.quality ?? "unknown")

        } catch let error {
            print(error)
        }
        
        guard let urlPath = Bundle.main.path(forResource: "ProductList", ofType: "json") else { return }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: urlPath))
            let jsonData: Any = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)
            print("present = ", jsonData)
            
            let product3 = try decoder.decode(ProductListModel.self, from: data)
            print(product3.datas[2].ID)

        } catch let error {
            print(error)
        }
        
        
    }

//    let json = [
//        "name": "Durian",
//        "point": 600,
//        "description": "A fruit with a distinctive scent.",
//        ] as [String : Any]
//
        let json = """
    {
        "name": "Durian",
        "points": 600,
        "description": "A fruit with a distinctive scent."
    }
    """.data(using: .utf8)!
    
    
    
    let json2 = """
{
    "id": 1001,
    "name": "Durian",
    "points": 600,
    "parameters": {
        "size": "80*80",
        "area": "Thailand",
        "quality": "bad"
    },
    "description": "A fruit with a distinctive scent."
}
""".data(using: .utf8)!
    
}

