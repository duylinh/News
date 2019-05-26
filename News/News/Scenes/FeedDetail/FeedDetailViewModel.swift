//
//  FeedDetailViewModel.swift
//  News
//
//  Created by DUYLINH on 5/26/19.
//  Copyright © 2019 Duy Linh. All rights reserved.
//

import Foundation

protocol FeedDetailViewModelDelegate: class {
    func generateItemsViewModelDidUpdate(_ viewModel: FeedDetailViewModel)
}

final class FeedDetailViewModel {
    
    // MARK: - Properties
    
    weak var delegate: FeedDetailViewModelDelegate?
    var numberOfItems: Int {
        return self.sections.count
    }
    
    lazy var sections: [FeedDetailSection] = {
        return detail?.sections ?? []
    }()
    
    lazy var title: String? = {
        return detail?.title
    }()
    
    lazy var description: String? = {
        return detail?.description
    }()
    
    private var detail: FeedDetail? = nil {
        didSet {
            delegate?.generateItemsViewModelDidUpdate(self)
        }
    }
    
    // MARK: - Internal methods
    
    func getSections() -> [FeedDetailSection] {
        return detail?.sections ?? []
    }
    
    func getTitle() -> String? {
        return detail?.title
    }
    
    func getDescription() -> String? {
        return detail?.description
    }
    
    func generateItems() {
//        do {
//            let result = try FeedDetail.fromJSONFile("detail") as FeedDetail
//            self.detail = result
//        } catch {
//            self.detail = nil
//        }
        
        
        LoadingHelper.shared.showHUD()
        APIService.shared.getdetailAFeed(completion: { [weak self] result in
            switch result {
            case .success(let detail):
                guard detail != nil else {
                    return
                }
                LoadingHelper.shared.dismissHUD()
                self?.detail = detail
            case .failure( _):
                LoadingHelper.shared.dismissHUD()
                self?.detail = nil
                return
            }
        })
    }
    
    
}

