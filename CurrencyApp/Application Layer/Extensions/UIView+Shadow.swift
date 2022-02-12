//
//  UIView+Shadow.swift
//  CurrencyApp
//
//  Created by Majit Uteniyazov on 12/02/22.
//

import UIKit

extension UIView {
    
    func addShadow(
        with color: UIColor = .gray,
        offset: CGSize = CGSize(width: 0, height: 2),
        opacity: Float = 0.5,
        radius: CGFloat = 2.0,
        cornerRadius: CGFloat = 0.0
    ) {
        layer.cornerRadius = cornerRadius
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
    }
    
}
