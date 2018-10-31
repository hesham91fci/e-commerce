//
//  Product.swift
//  e-commerce
//
//  Created by Hesham Ali on 10/27/18.
//  Copyright © 2018 Hesham Ali. All rights reserved.
//

import Foundation
import ObjectMapper
class SingleProduct: NSObject, Mappable{
    var mainImage:String!
    var name:String!
    var averageRating:String!
    var code:String!
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        name    <- map["name"]
        mainImage         <- map["images"]["path"]
        averageRating      <- map["averageRating"]
        code       <- map["code"]
    }
}
