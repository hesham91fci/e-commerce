//
//  ProductsViewModel.swift
//  e-commerce
//
//  Created by Hesham Ali on 10/27/18.
//  Copyright © 2018 Hesham Ali. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
class ProductsViewModel:NSObject {
    
    var pages:Int!
    var products = [SingleProduct]()
    
    var bindToProductViewModels :(() -> ()) = {  }
    func getProdcuts(forPage page: Int){
        let productsObservable = APIManager.getInstance().createProductServices().getProducts(page: "\(page)")
        productsObservable.subscribe(onNext:{ (totalProducts) in
            self.products = totalProducts.products
            self.pages = totalProducts.pages
            self.bindToProductViewModels()
        },
                                     onError:{ (error) in
                                        print("error")
                                        
        },
                                     onCompleted:{
                                        print("completed")
                                        
        },
                                     onDisposed:{
                                        print("disposed")
                                        
        })
        
        
    }
    
    override init() {
    }
    
    
    
    
}
