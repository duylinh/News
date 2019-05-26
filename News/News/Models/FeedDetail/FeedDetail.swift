//
//  FeedDetail.swift
//  News
//
//  Created by DUYLINH on 5/26/19.
//  Copyright © 2019 Duy Linh. All rights reserved.
//

import Foundation

struct FeedDetail: Codable {
    let id: String
    let title: String
    let description: String
    let dateString: String
    let originURL: String
    let publisher: Publisher?
    let sections: [FeedDetailSection]?
    
    enum CodingKeys: String, CodingKey {
        case id = "document_id"
        case title
        case description
        case dateString = "published_date"
        case originURL = "origin_url"
        case publisher
        case sections
    }
}

