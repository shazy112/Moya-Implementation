////
////  Extension+Result.swift
////  SwiftUIDemoApp
////
////  Created by Shiraz Ahmed Khan on 13/08/2020.
////  Copyright © 2020 Shiraz Ahmed Khan. All rights reserved.
////
//
//import Foundation
//import Moya
//import Result
//
//extension Result {
//    //Extension of An enum from Moya representing either a failure with an explanatory error, or a success with a result value.
//    func resolve() throws -> Value {
//        switch self {
//        case .success(let value):
//            return value
//        case .failure(let error):
//            throw error
//        }
//    }
//}
//
//extension Result where Value == Moya.Response {
//    //Decodes data from json with keypath
//    func decoded<T: Decodable>(keypath:String? = nil) throws -> T {
//        let decoder = JSONDecoder()
//        let response = try resolve()
//        
//        return try response.map(T.self, atKeyPath: keypath, using: decoder)
//    }
//}
