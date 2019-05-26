//
//  FeedDetailView.swift
//  News
//
//  Created by DUYLINH on 5/26/19.
//  Copyright © 2019 Duy Linh. All rights reserved.
//

import UIKit
import AVKit

final class FeedDetailView: BaseController {
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    
    private lazy var viewModel: FeedDetailViewModel = {
        return .init()
    }()
    
    private lazy var dataSource: FeedDetailViewDataSource = {
        return .init(viewModel: self.viewModel)
    }()
    
    // MARK: - Overridden: UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setProperties()
        
        viewModel.delegate = self
        dataSource.configure(with: tableView)
        dataSource.delegate = self
        viewModel.generateItems()
    }
    
    // MARK: - Private methods
    
    private func setProperties() {
        title = "Feed Detail"
        
    }

    
    // MARK: - Action
    
}

extension FeedDetailView: FeedDetailViewModelDelegate {
    func generateItemsViewModelDidUpdate(_ viewModel: FeedDetailViewModel) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension FeedDetailView: FeedDetailViewDataSourceDelegate {
    func didTapOnVideo(with model: FeedDetailSection, indexPath: IndexPath) {
        guard case let .video(video) = model.content else {return}
        guard let url = URL(string: video.href) else {return}
        
        let player = AVPlayer(url: url)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        
        present(playerViewController, animated: true) {
            player.play()
        }
    }
}
