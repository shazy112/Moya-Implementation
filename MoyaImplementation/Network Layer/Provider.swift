//
//  Provider.swift
//  SwiftUIDemoApp
//
//  Created by Shiraz Ahmed Khan on 13/08/2020.
//  Copyright © 2020 Shiraz Ahmed Khan. All rights reserved.
//

import Foundation
import Alamofire
import Moya

struct Provider {
    
    static let services = MoyaProvider<MovieService>(session: AlamofireManager.sharedManager, plugins: [Plugin.loggerPlugin,Plugin.networkPlugin, VerbosePlugin(verbose: true)])
    
    static let backgroundServices = MoyaProvider<MovieService>(session: AlamofireManager.sharedManager, plugins: [Plugin.loggerPlugin])
    
    
    //    static var sharedIns : Provider = Provider()
    //    let serverTrustPolicies: [String: ServerTrustPolicy] = [
    //        "https://mydomainthatwasdrivingmebananas.com": .pinCertificates(
    //            certificates: ServerTrustPolicy.certificates(),
    //            validateCertificateChain: true,
    //            validateHost: true),
    //        "mydomainthatwasdrivingmebananas.com": .disableEvaluation
    //    ]
    //    lazy var manager = Manager(
    //        configuration: URLSessionConfiguration.default,
    //        serverTrustPolicyManager: ServerTrustPolicyManager(policies: serverTrustPolicies)
    //    )
    //
    //    lazy var sslService = MoyaProvider<Services>(manager: manager, plugins: [NetworkLoggerPlugin(verbose: true),Plugin.networkPlugin])
}
struct VerbosePlugin: PluginType {
    let verbose: Bool
    func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
        #if DEBUG
        switch result {
        case .success(let body):
            if verbose {
                print("Response:")
                if let json = try? JSONSerialization.jsonObject(with: body.data, options: .mutableContainers) {
                    print(json)
                } else {
                    let response = String(data: body.data, encoding: .utf8)!
                    print(response)
                }
            }
        case .failure( _):
            break
        }
        #endif
    }
}
