//
//  UIViewExtension.swift
//  Popvies
//
//  Created by Dhiya Ulhaq Zulha Alamsyah on 12/03/19.
//  Copyright © 2019 Logivity. All rights reserved.
//

import UIKit

extension UIView {
    
    func dropShadow() {
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 6
    }
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}
