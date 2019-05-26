//
//  Feed.swift
//  News
//
//  Created by DUYLINH on 5/26/19.
//  Copyright © 2019 Duy Linh. All rights reserved.
//

import Foundation

struct FeedList: Codable {
    var items: [Feed]
    
    enum CodingKeys: String, CodingKey {
        case items
    }
}

struct Feed: Codable {
    let id: String
    let title: String
    let description: String
    let dateString: String
    let type: ContentType
    let originURL: String
    let publisher: Publisher?
    let avatar: ImageItem?
    let images: [ImageItem]?
    let content: FeedVideo?
    
    enum CodingKeys: String, CodingKey {
        case id = "document_id"
        case title
        case description
        case dateString = "published_date"
        case type = "content_type"
        case originURL = "origin_url"
        case publisher
        case avatar
        case images
        case content
    }
    
    func getPreviewUrl() -> String? {
        if let avatar = avatar {
            return avatar.href
        } else if let images = images {
            return images.first?.href
        }
        return nil
    }
}

extension Feed {
    enum ContentType: String, Codable {
        case overview
        case story
        case gallery
        case video
        case article
        case long_form
    }
}
