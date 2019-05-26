//
//  TextFeedDetailCell.swift
//  News
//
//  Created by DUYLINH on 5/26/19.
//  Copyright © 2019 Duy Linh. All rights reserved.
//

import UIKit

final class TextFeedDetailCell: UITableViewCell {
    
    static let ID = "TextFeedDetailCell"
    
    @IBOutlet weak var textView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        textView.font = UIFont.systemFont(ofSize: 16)
    }
    
    func configure(with model: FeedDetailSection.TextContent, indexPath: IndexPath) {
        textView.text = model.text
    }
    
}
