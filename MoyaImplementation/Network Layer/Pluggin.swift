//
//  Pluggin.swift
//  SwiftUIDemoApp
//
//  Created by Shiraz Ahmed Khan on 13/08/2020.
//  Copyright © 2020 Shiraz Ahmed Khan. All rights reserved.
//

import Foundation
import Moya

struct Plugin {
    
    private init() {}
    static let networkPlugin = NetworkActivityPlugin(networkActivityClosure: { (changeType, _) in
        switch changeType {
        case .began:
            print("🌍 -->> Network Call Started... Data & Time -->> \(Date()) <<--")
           // UIApplication.startActivityIndicator()
           // UIApplication.showLoader()
        case .ended:
            //UIApplication.stopActivityIndicator()
            //UIApplication.hideLoader()
            print("🌍 -->> Network Call Ended... Data & Time -->> \(Date()) <<--")
        }
    })
    
    static let loggerPlugin = NetworkLoggerPlugin()
}
public enum NetworkActivityChangeType {
    case began, ended
}

/// Notify a request's network activity changes (request begins or ends).
public final class NetworkActivityPlugin: PluginType {

    public typealias NetworkActivityClosure = (_ change: NetworkActivityChangeType, _ target: TargetType) -> Void
    let networkActivityClosure: NetworkActivityClosure

    /// Initializes a NetworkActivityPlugin.
    public init(networkActivityClosure: @escaping NetworkActivityClosure) {
        self.networkActivityClosure = networkActivityClosure
    }

    // MARK: Plugin
    /// Called by the provider as soon as the request is about to start
    public func willSend(_ request: RequestType, target: TargetType) {
        networkActivityClosure(.began, target)
    }

    /// Called by the provider as soon as a response arrives, even if the request is canceled.
    public func didReceive(_ result: Result<Moya.Response, MoyaError>, target: TargetType) {
        networkActivityClosure(.ended, target)
    }
}
