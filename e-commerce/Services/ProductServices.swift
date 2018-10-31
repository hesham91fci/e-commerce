//
//  ProductServices.swift
//  e-commerce
//
//  Created by Hesham Ali on 10/27/18.
//  Copyright © 2018 Hesham Ali. All rights reserved.
//

import Foundation
import RxSwift
protocol ProductServices{
    func getProducts(page:String)->Observable<TotalProducts>
    static func getInstance() -> ProductServices
}
