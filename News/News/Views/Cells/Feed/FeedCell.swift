//
//  FeedCell.swift
//  News
//
//  Created by DUYLINH on 5/26/19.
//  Copyright © 2019 Duy Linh. All rights reserved.
//

import UIKit
import CollectionViewShelfLayout

class FeedCell: UITableViewCell {
    
    static let ID = "FeedCell"
    static let font = UIFont.systemFont(ofSize: 16.0)
    
    @IBOutlet weak var backView: ShadowView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    var model: Feed?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with model: Feed?, indexPath: IndexPath) {
        titleLabel.text = model?.title
        contentLabel.text = model?.description
        
        let shelfLayout = CollectionViewShelfLayout()
//        shelfLayout.itemSize = CGSize(width: 100, height: 100)
        collectionView.collectionViewLayout = shelfLayout
    }
}

extension FeedCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let images = self.model?.images else {
            return 1
        }
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = UICollectionViewCell ()
        cell.contentView.layer.cornerRadius = 15
        if let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCell.ID, for: indexPath) as? ImageCell {
            itemCell.configure(with: self.model?.images == nil ? nil : self.model?.images?[indexPath.row] ?? nil)
            return itemCell
        }
        return cell
    }
    
}
