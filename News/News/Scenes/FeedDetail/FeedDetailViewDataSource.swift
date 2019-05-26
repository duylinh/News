//
//  FeedDetailViewDataSource.swift
//  News
//
//  Created by DUYLINH on 5/26/19.
//  Copyright © 2019 Duy Linh. All rights reserved.
//

import Foundation
import UIKit


protocol FeedDetailViewDataSourceDelegate: class {
    func didTapOnVideo(with model: FeedDetailSection, indexPath: IndexPath)
}

final class FeedDetailViewDataSource: NSObject {
    
    // MARK: - Properties
    weak var delegate: FeedDetailViewDataSourceDelegate?
    private unowned let viewModel: FeedDetailViewModel
    
    // MARK: - Con(De)structor
    
    init(viewModel: FeedDetailViewModel) {
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
        tableView.allowsSelection = false
        tableView.allowsMultipleSelection = false
        
        tableView.register(TextFeedDetailCell.nib, forCellReuseIdentifier: TextFeedDetailCell.ID)
        tableView.register(ImageFeedDetailCell.nib, forCellReuseIdentifier: ImageFeedDetailCell.ID)
        tableView.register(VideoFeedDetailCell.nib, forCellReuseIdentifier: VideoFeedDetailCell.ID)
    }
    
}

// MARK: - UITableViewDataSource
extension FeedDetailViewDataSource: UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 2
        }
        print(viewModel.numberOfItems)
        return viewModel.getSections().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            return titleOfTable(in: tableView, at: indexPath)
        }
        
        return sectionOfTable(in: tableView, at: indexPath)
    }
    
    private func titleOfTable(in tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell ()
        if let textCell = tableView.dequeueReusableCell(withIdentifier: TextFeedDetailCell.ID, for: indexPath) as? TextFeedDetailCell {
            textCell.textView.text = (indexPath.row == 0) ? (viewModel.title ?? "") : (viewModel.description ?? "")
            return textCell
        }
        return cell
    }
    
    private func sectionOfTable(in tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        let data = viewModel.getSections()[indexPath.row]
        
        switch data.content {
        case .image(let image):
            let cell = UITableViewCell ()
            if let imageCell = tableView.dequeueReusableCell(withIdentifier: ImageFeedDetailCell.ID, for: indexPath) as? ImageFeedDetailCell {
                imageCell.configure(with: image, indexPath: indexPath)
                return imageCell
            }
            return cell
        case .text(let text):
            let cell = UITableViewCell ()
            if let textCell = tableView.dequeueReusableCell(withIdentifier: TextFeedDetailCell.ID, for: indexPath) as? TextFeedDetailCell {
                textCell.configure(with: text, indexPath: indexPath)
                return textCell
            }
            return cell
        case .video(let video):
            let cell = UITableViewCell ()
            if let videoCell = tableView.dequeueReusableCell(withIdentifier: VideoFeedDetailCell.ID, for: indexPath) as? VideoFeedDetailCell {
                videoCell.configure(with: video, indexPath: indexPath)
                videoCell.delegate = self
                return videoCell
            }
            return cell
        }
    }
    
}
// MARK: - UITableViewDelegate
extension FeedDetailViewDataSource: UITableViewDelegate {}

// MARK: - VideoFeedDetailCellDelegate
extension FeedDetailViewDataSource: VideoFeedDetailCellDelegate {
    func videoCell(didRequestShowVideo cell: VideoFeedDetailCell, indexPath: IndexPath?) {
        guard let index = indexPath else {return}
        delegate?.didTapOnVideo(with: viewModel.getSections()[index.row], indexPath: index)
    }
}

