//
//  UIImageView+Ex.swift
//  News
//
//  Created by DUYLINH on 5/26/19.
//  Copyright © 2019 Duy Linh. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    func setImage(_ urlString: String?, placeholder: UIImage? = nil, completed: ((Bool) -> ())? = nil) {
        if let urlStr = urlString?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed){
            guard let url = URL(string: urlStr) else {
                completed?(false)
                return
            }
            let processor = DownsamplingImageProcessor(size: self.bounds.size)
            self.kf.setImage(
                with: url,
                placeholder: placeholder,
                options: [
                    .processor(processor),
                    .scaleFactor(UIScreen.main.scale),
                    .transition(.fade(0.3)),
                    .cacheOriginalImage
                ]){
                result in
                switch result {
                case .success(_):
                    completed?(true)
                case .failure(let _):
                    completed?(false)
                }
            }
        }
    }
    
    func cancelDownload() {
        self.kf.cancelDownloadTask()
    }
}
