//
//  APIManager.swift
//  e-commerce
//
//  Created by Hesham Ali on 10/27/18.
//  Copyright © 2018 Hesham Ali. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift
class APIManager:NSObject{
    static var authorizationHeader = "Bearer SampleToken"
    static var contentTime = "application/json"
    static var baseURL = "https://demo.sylius.com/"
    fileprivate static var apiInstance:APIManager!
    func createProductServices() -> ProductServices{
        return ProductServicesImpl.getInstance()
    }
    fileprivate override init() {
        
    }
    static func getToken(completionHandler: @escaping (_ token: String) -> Void){
        let urlPath = baseURL+"api/oauth/v2/token"
        let parameters = ["client_id":"demo_client",
            "client_secret":"secret_demo_client",
            "grant_type":"password",
            "username":"api@example.com",
            "password":"sylius-api"]
                    let request = Alamofire.request(URL(string: urlPath)!,
                                      method: .get,
                                      parameters: parameters)
                        .validate()
                        .responseJSON { response in
                            switch(response.result){
                            case .success(let value):
                                let jsonValue = value as! [String:Any]
                                completionHandler(jsonValue["access_token"] as! String)
                                break
                            case .failure(let error):
                                
                                break
                            }
                    }

    }
    static func getInstance() -> APIManager {
        if(apiInstance==nil){
           apiInstance = APIManager()
        }
        return apiInstance
    }
}
