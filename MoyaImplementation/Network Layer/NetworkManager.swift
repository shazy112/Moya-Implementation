//
//  NetworkManager.swift
//  SwiftUIDemoApp
//
//  Created by Shiraz Ahmed Khan on 13/08/2020.
//  Copyright © 2020 Shiraz Ahmed Khan. All rights reserved.
//

import Foundation
import Moya

class NetworkManager {
    //Here Decoded returns either the model or if it fails it returs error.
    
    class func apiCall<T:Decodable>(showLoader:Bool = true,keyPath:String? = nil,request:MovieService,handler: @escaping (T?, _ error: String?)->()) {
        let serviceProvider = showLoader ? Provider.services : Provider.backgroundServices
        serviceProvider.request(request) { (result) in
            switch result {
            case let .success(response):
                do {
                let decoder = JSONDecoder()
                    let _result:T = try response.map(T.self, atKeyPath: keyPath, using: decoder, failsOnEmptyData: true)
                    handler(_result,nil)
                }
                catch {
                    handler(nil, "An error Occoured")
                }
            case let .failure(error):
                print(error)
                handler(nil,error.localizedDescription)
                
            }
        }
    }
}
