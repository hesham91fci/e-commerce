//
//  ProductServicesImpl.swift
//  e-commerce
//
//  Created by Hesham Ali on 10/27/18.
//  Copyright © 2018 Hesham Ali. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import RxSwift
class ProductServicesImpl: ProductServices {
    
    static fileprivate var instance:ProductServices!
    func getProducts(page:String)-> (Observable<TotalProducts>){
        let urlPath=APIManager.baseURL+"api/v2/products"
        let headers = ["Content-Type":"application/json","Authorization":" Bearer SampleToken","X-Authorization":" Bearer SampleToken","Auth":" Bearer SampleToken","auth":" Bearer SampleToken"]
        var request = URLRequest(url:  NSURL(string: urlPath)! as URL)
        
        // Your request method type Get or post etc according to your requirement
        request.httpMethod = "GET"
        
//        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.setValue(" Bearer \(token)", forHTTPHeaderField: "X-Authorization")
//        request.setValue(" Bearer \(token)", forHTTPHeaderField: "auth")
         APIManager.getToken {(token) in
         
            
            
        }
        return Observable.create({observer -> Disposable in
            Alamofire.request(request)
                .responseJSON { response in
                    switch(response.result){
                    case .success(let value):
                        
                        if let path = Bundle.main.path(forResource: "products", ofType: "json") {
                            do {
                                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as! [String : Any]
                                let totalProducts = Mapper<TotalProducts>().map(JSON: jsonResult)!
                                observer.onNext(totalProducts)
                                observer.onCompleted()
                            } catch {
                                // handle error
                            }
                        }
                        break
                    case .failure(let error):
                        print("something went wrong \(error.localizedDescription)")
                        observer.onError(NSError(domain: "com.businessBoomers", code: -1, userInfo: nil))
                        break
                    }
            }.session.finishTasksAndInvalidate()
            return Disposables.create{
                
            }
        })
        
    }
    
    func getTotalProducts(page:String, completionHandler: @escaping (_ totalProducts: TotalProducts) -> Void){
        let urlPath=APIManager.baseURL+"api/v2/products"
        let headers = ["Content-Type":"application/json","Authorization":"Bearer SampleToken","X-Authorization":"Bearer SampleToken","Auth":"Bearer SampleToken","auth":"Bearer SampleToken"]
        var request = URLRequest(url:  NSURL(string: urlPath)! as URL)
        
        // Your request method type Get or post etc according to your requirement
        request.httpMethod = "GET"
        
        request.setValue("Bearer SampleToken", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer SampleToken", forHTTPHeaderField: "X-Authorization")
        request.setValue("Bearer SampleToken", forHTTPHeaderField: "auth")
        
        Alamofire.request(request)
            .responseJSON { response in
                switch(response.result){
                case .success(let value):
                    print(value)
                    let totalProducts = Mapper<TotalProducts>().map(JSON: value as! [String : Any])!
                    completionHandler(totalProducts)
                    break
                case .failure(let error):
                    print("something went wrong \(error.localizedDescription)")
                    break
                }
            }.session.finishTasksAndInvalidate()
    }
    
    fileprivate init(){
    }
    
    static func getInstance() -> ProductServices {
        if(instance==nil){
            instance = ProductServicesImpl()
        }
        return instance
    }
    
}
