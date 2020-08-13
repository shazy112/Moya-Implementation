//
//  ContentView.swift
//  MoyaImplementation
//
//  Created by Shiraz Ahmed Khan on 13/08/2020.
//  Copyright © 2020 Shiraz Ahmed Khan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
            .onAppear {
                NetworkManager.apiCall(request: .popularMovies(page:1)) { (result:Movies?, error) in
                    if let _result = result {
                        print(_result)
                    }
                    else {
                        print(error ?? "")
                    }
                }
        }
    }
}
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
}
