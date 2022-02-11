//
//  UIView+addSubviews.swift
//  CurrencyApp
//
//  Created by Majit Uteniyazov on 11/02/22.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
    
}
