//
//  FeedCell.swift
//  News
//
//  Created by DUYLINH on 5/26/19.
//  Copyright © 2019 Duy Linh. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {
    
    static let ID = "FeedCell"
    static var nib: UINib {
        return UINib.init(nibName: ID, bundle: Bundle.main)
    }
    static let font = UIFont.systemFont(ofSize: 16.0)
    
    @IBOutlet weak var shadowView: ShadowView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var previewImageView: UIImageView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var typeImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configViews()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        previewImageView.cancelDownloadTask()
        previewImageView.image = nil
        avatarImageView.cancelDownloadTask()
        avatarImageView.image = nil
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func configViews() {
        containerView.layer.cornerRadius = 20
        containerView.layer.masksToBounds = true
        
        shadowView.setShadow(shadowColor: UIColor.darkGray.cgColor, shadowRadius: 5)
        
        previewImageView.clipsToBounds = true
        previewImageView.contentMode = .scaleAspectFill
        
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.layer.cornerRadius = avatarImageView.bounds.width/2
        avatarImageView.layer.masksToBounds = true
    }
    
    func configure(with model: Feed, indexPath: IndexPath) {
        
        titleLabel.text = model.title
        contentLabel.text = model.description
        previewImageView.setWebImage(model.getPreviewUrl())
        avatarImageView.setWebImage(model.publisher?.icon, placeholder: UIImage(named: "img_placeholder_user"))
        
        switch model.type {
        case .video:
            typeImageView.image = UIImage(named: "icon_video")
        case .gallery:
            typeImageView.image = UIImage(named: "icon_gallery")
        default:
            typeImageView.image = nil
        }
    }
}
