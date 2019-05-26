//
//  UIView+Ex.swift
//  News
//
//  Created by DUYLINH on 5/26/19.
//  Copyright © 2019 Mapple Labs. All rights reserved.
//

import UIKit

extension UIView {
    
    func round(corners: UIRectCorner, radius: CGFloat = 5.0, color: UIColor = .clear, borderWidth: CGFloat = 0.5) {
        let maskPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        
        let shape: CAShapeLayer = CAShapeLayer()
        shape.path = maskPath.cgPath
        self.layer.mask = shape
        
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = borderWidth
    }
    
}
