//
//  FeedVideo.swift
//  News
//
//  Created by DUYLINH on 5/26/19.
//  Copyright © 2019 Duy Linh. All rights reserved.
//

import Foundation

struct FeedVideo: Codable {
    let href: String
    let preview: ImageItem?
    let duration: Int
    
    enum CodingKeys: String, CodingKey {
        case href
        case preview = "preview_image"
        case duration
    }
}
