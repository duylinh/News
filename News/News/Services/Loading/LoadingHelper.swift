//
//  LoadingHelper.swift
//  News
//
//  Created by DUYLINH on 5/26/19.
//  Copyright © 2019 Mapple Labs. All rights reserved.
//

import Foundation
import KRProgressHUD

class LoadingHelper {
    
    class var shared: LoadingHelper {
        struct Static {
            static let instance : LoadingHelper = LoadingHelper()
        }
        return Static.instance
    }
    
    func showHUD() {
        KRProgressHUD.show()
    }
    
    func dismissHUD() {
        KRProgressHUD.dismiss()
    }
    
}
