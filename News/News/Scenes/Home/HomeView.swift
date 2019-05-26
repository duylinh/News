//
//  HomeView.swift
//  News
//
//  Created by DUYLINH on 5/26/19.
//  Copyright © 2019 Duy Linh. All rights reserved.
//

import UIKit

final class HomeView: BaseController {
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    
    private lazy var viewModel: HomeViewModel = {
        return .init()
    }()
    
    private lazy var dataSource: HomeViewDataSource = {
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
        title = "Home"
        
    }
    
    // MARK: - Action
    
}

extension HomeView: HomeViewModelDelegate {
    
    func generateItemsViewModelDidUpdate(_ viewModel: HomeViewModel) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}

extension HomeView: HomeViewDataSourceDelegate {
    
    func didSelectRowAt(with model: Feed, indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        navigationController?.pushViewController(AppCoordinator().feedDetailVC(), animated: true)
    }
    
}
