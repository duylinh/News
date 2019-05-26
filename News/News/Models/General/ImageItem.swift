//
//  ImageItem.swift
//  News
//
//  Created by DUYLINH on 5/26/19.
//  Copyright © 2019 Duy Linh. All rights reserved.
//

import Foundation

struct ImageItem: Codable {
    let href: String
    let color: String
    let width: Int
    let height: Int
    
    enum CodingKeys: String, CodingKey {
        case href
        case color = "main_color"
        case width
        case height
    }
}
