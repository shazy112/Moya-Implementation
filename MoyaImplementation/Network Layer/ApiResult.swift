//
//  ApiResult.swift
//  SwiftUIDemoApp
//
//  Created by Shiraz Ahmed Khan on 13/08/2020.
//  Copyright © 2020 Shiraz Ahmed Khan. All rights reserved.
//

import Foundation

enum APIResult<T>{
    case success(T)
    case failure(String)
}
