//
//  ImageCell.swift
//  News
//
//  Created by DUYLINH on 5/26/19.
//  Copyright © 2019 Mapple Labs. All rights reserved.
//

import UIKit

final class ImageCell: UICollectionViewCell {
    
    static let ID = "ImageCell"

    @IBOutlet private weak var itemImageView: UIImageView!
    
    override public func prepareForReuse() {
        itemImageView.image = nil
        itemImageView.backgroundColor = UIColor.clear
    }
    
    func configure(with model: ImageItem?) {
        itemImageView.round(corners: .allCorners)
        if let href = model?.href {
            itemImageView.setImage(href)
        } else {
            itemImageView.image = Asset.General.icNews.image
        }
    }
    
}
