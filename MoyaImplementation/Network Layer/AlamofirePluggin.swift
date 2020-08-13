//
//  AlamofirePluggin.swift
//  SwiftUIDemoApp
//
//  Created by Shiraz Ahmed Khan on 13/08/2020.
//  Copyright © 2020 Shiraz Ahmed Khan. All rights reserved.
//

import Foundation
import Alamofire

class AlamofireManager: Alamofire.Session {
    static let sharedManager: AlamofireManager = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = HTTPHeaders.default.dictionary
        configuration.timeoutIntervalForRequest = 100 // as seconds, you can set your request timeout
        configuration.timeoutIntervalForResource = 100 // as seconds, you can set your resource timeout
        configuration.requestCachePolicy = .useProtocolCachePolicy
        return AlamofireManager(configuration: configuration)
    }()
}
