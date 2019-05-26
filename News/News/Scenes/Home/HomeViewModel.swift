//
//  HomeViewModel.swift
//  News
//
//  Created by DUYLINH on 5/26/19.
//  Copyright © 2019 Duy Linh. All rights reserved.
//

import Foundation

protocol HomeViewModelDelegate: class {
    func generateItemsViewModelDidUpdate(_ viewModel: HomeViewModel)
}

final class HomeViewModel {
    
    // MARK: - Properties
    
    weak var delegate: HomeViewModelDelegate?
    var numberOfItems: Int {
        return items.count
    }
    
    private var items: [Feed] = [] {
        didSet {
            delegate?.generateItemsViewModelDidUpdate(self)
        }
    }
    
    // MARK: - Internal methods
    
    func item(at index: Int) -> Feed {
        return items[index]
    }
    
    func generateItems() {
        do {
            let result = try FeedList.fromJSONFile("newsfeed") as FeedList
            self.items = result.items
        } catch {
            self.items = []
        }
        
        
//        LoadingHelper.shared.showHUD()
//        APIService.shared.getFeeds(completion: { [weak self] result in
//            switch result {
//            case .success(let feeds):
//                LoadingHelper.shared.dismissHUD()
//                if let items = feeds {
//                    self?.items = feeds ?? []
//                }
//            case .failure( _):
//                LoadingHelper.shared.dismissHUD()
//                self?.items = []
//                return
//            }
//        })
    }
}
