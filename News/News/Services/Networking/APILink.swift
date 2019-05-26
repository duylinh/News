//
//  APILink.swift
//  News
//
//  Created by DUYLINH on 5/26/19.
//  Copyright © 2019 Mapple Labs. All rights reserved.
//

import Foundation

final class APILink {
    private static let baseLink:String = "https://www.dropbox.com/"
    struct API {
        static let feedList = baseLink + "s/fy6ny7syutxl1yd/newsfeed.json?dl=1"
        static let detailAFeed = baseLink + "s/v83n38kvsm6qw62/detail.json?dl=1"
    }
}
