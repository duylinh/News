//
//  Config.swift
//  News
//
//  Created by DUYLINH on 5/26/19.
//  Copyright © 2019 Duy Linh. All rights reserved.
//

import Foundation

// MARK: - Config
enum Config {
    
    enum Format {
        
        static let datePattern = "##/##/####"
        static let datePatternSeparator = Character("/")
        static let datePatternSymbol = Character("#")
        
    }
    
    static let requiredPasswordPeriodByMinute = 1
    static let autoLockTimeoutPeriodByMinute = 1
    
    enum URL {
        static let faq = "https://www."
        static let termsOfUse = "https://www."
        static let appDownloadLink = "https://"
    }
    
    enum Email {
        static let normalUser = ""
    }
    
    enum FacebookPage {
        static let name = ""
        static let url = ""
    }
    
}
