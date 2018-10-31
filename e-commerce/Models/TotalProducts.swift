//
//  TotalProducts.swift
//  e-commerce
//
//  Created by Hesham Ali on 10/27/18.
//  Copyright © 2018 Hesham Ali. All rights reserved.
//

import Foundation
import ObjectMapper
class TotalProducts: NSObject, Mappable {
    var page:Int!
    var pages:Int!
    var products:[SingleProduct]!
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        page    <- map["page"]
        pages         <- map["pages"]
        let embeddedItems = map.JSON["_embedded"] as! [String:Any]
        products = Mapper<SingleProduct>().mapArray(JSONArray: embeddedItems["items"] as! [[String : Any]])
        
    }
}
