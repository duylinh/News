//
//  HomeViewDataSource.swift
//  News
//
//  Created by DUYLINH on 5/26/19.
//  Copyright © 2019 Duy Linh. All rights reserved.
//

import UIKit

protocol HomeViewDataSourceDelegate: class {
    func didSelectRowAt(with model: Feed, indexPath: IndexPath)
}

final class HomeViewDataSource: NSObject {
    
    // MARK: - Properties
    weak var delegate: HomeViewDataSourceDelegate?
    private unowned let viewModel: HomeViewModel
    
    // MARK: - Con(De)structor
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - Internal methods
    
    func configure(with tableView: UITableView) {
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 200
        tableView.tableFooterView = UIView()
        tableView.allowsSelection = true
        tableView.allowsMultipleSelection = false
    }
    
}

// MARK: - UITableViewDataSource
extension HomeViewDataSource: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell ()
        if let feedCell = tableView.dequeueReusableCell(withIdentifier: FeedCell.ID, for: indexPath) as? FeedCell {
            feedCell.configure(with: viewModel.item(at: indexPath.row), indexPath: indexPath)
            return feedCell
        }
        return cell
    }
    
}

// MARK: - UITableViewDelegate
extension HomeViewDataSource: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectRowAt(with: viewModel.item(at: indexPath.row), indexPath: indexPath)
    }
}
