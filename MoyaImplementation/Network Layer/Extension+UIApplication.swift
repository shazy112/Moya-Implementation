//
//  Extension+UIApplication.swift
//  SwiftUIDemoApp
//
//  Created by Shiraz Ahmed Khan on 13/08/2020.
//  Copyright © 2020 Shiraz Ahmed Khan. All rights reserved.
//

import Foundation
import JGProgressHUD

extension UIApplication {
    class func startActivityIndicator(with message: String? = "") {
        DispatchQueue.main.async {
            let hud = JGProgressHUD(style: .dark)
            hud.tag = 999
            hud.textLabel.text = message
            if let view = UIApplication.shared.keyWindow {
                hud.show(in: view)
            }
        }
    }
    
    class func stopActivityIndicator() {
        DispatchQueue.main.async {
            if let hud = UIApplication.shared.keyWindow?.viewWithTag(999) as? JGProgressHUD {
                hud.dismiss()
                hud.removeFromSuperview()
            }
        }
    }
}
