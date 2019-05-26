//
//  AppCoordinator.swift
//  News
//
//  Created by DUYLINH on 5/26/19.
//  Copyright © 2019 Duy Linh. All rights reserved.
//

import UIKit

final class AppCoordinator {
    
    func homeVC() -> HomeView {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "HomeView") as! HomeView
    }
    
    func feedDetailVC() -> FeedDetailView {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "FeedDetailView") as! FeedDetailView
    }
}

