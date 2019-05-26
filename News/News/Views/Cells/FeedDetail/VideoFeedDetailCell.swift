//
//  VideoFeedDetailCell.swift
//  News
//
//  Created by DUYLINH on 5/26/19.
//  Copyright © 2019 Duy Linh. All rights reserved.
//

import UIKit

protocol VideoFeedDetailCellDelegate: class {
    func videoCell(didRequestShowVideo cell: VideoFeedDetailCell, indexPath: IndexPath?)
}

final class VideoFeedDetailCell: UITableViewCell {
    
    static let ID = "VideoFeedDetailCell"
    static var nib: UINib {
        return UINib.init(nibName: ID, bundle: Bundle.main)
    }
    
    @IBOutlet weak var previewImageView: UIImageView!
    @IBOutlet weak var captionLabel: UILabel!
    
    weak var delegate: VideoFeedDetailCellDelegate?
    
    var indexPath: IndexPath? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        previewImageView.image = nil
        previewImageView.cancelDownloadTask()
        
        delegate = nil
    }
    
    func configure(with model: FeedDetailSection.VideoContent, indexPath: IndexPath) {
        captionLabel.text = model.caption
        previewImageView.setWebImage(model.preview.href)
        self.indexPath = indexPath
    }
    
    @IBAction func playButtonClicked(_ sender: Any) {
        delegate?.videoCell(didRequestShowVideo: self, indexPath: self.indexPath)
    }
    
}
