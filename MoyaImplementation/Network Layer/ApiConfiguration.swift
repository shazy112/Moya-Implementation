//
//  ApiConfiguration.swift
//  SwiftUIDemoApp
//
//  Created by Shiraz Ahmed Khan on 13/08/2020.
//  Copyright © 2020 Shiraz Ahmed Khan. All rights reserved.
//

import Foundation
// Struct that holds all the variables related to api.
struct APIConfiguration{
    static let apiKey = "bec3fd859f36402c62bda0fb7346ca5b"
    static let baseURL = "http://api.themoviedb.org/3?api_key=\(apiKey)"
    static let imagesBaseURL = "http://image.tmdb.org/t/p/w342/"
}
