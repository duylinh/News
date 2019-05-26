//
//  ImageFeedDetailCell.swift
//  News
//
//  Created by DUYLINH on 5/26/19.
//  Copyright © 2019 Duy Linh. All rights reserved.
//

import UIKit

final class ImageFeedDetailCell: UITableViewCell {
    
    static let ID = "ImageFeedDetailCell"
    static var nib: UINib {
        return UINib.init(nibName: ID, bundle: Bundle.main)
    }
    
    @IBOutlet weak var previewImageView: UIImageView!
    @IBOutlet weak var captionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        previewImageView.image = nil
        previewImageView.cancelDownloadTask()
    }
    
    func configure(with model: FeedDetailSection.ImageContent, indexPath: IndexPath) {
        captionLabel.text = model.caption
        previewImageView.setWebImage(model.href)
    }
}
