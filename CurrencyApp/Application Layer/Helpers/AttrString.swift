//
//  AttrString.swift
//  CurrencyApp
//
//  Created by Majit Uteniyazov on 12/02/22.
//

import UIKit

class AtrStrStyle {
    
    var font: UIFont?
    var color: UIColor?
    var apply: ((AtrStrStyle) -> Void)?
    
    init(font: UIFont? = nil, color: UIColor? = .label, apply: ((AtrStrStyle) -> Void)? = nil) {
        self.font = font
        self.color = color
        self.apply = apply
    }
    
    func attributes() -> [NSAttributedString.Key: Any]? {
        var att: [NSAttributedString.Key: Any] = [ : ]
        
        if let font = font {
            att[.font] = font
        }
        
        if let color = color {
            att[.foregroundColor] = color
        }
        
        return att.isEmpty ? nil : att
    }
    
}

extension String {
    
    func applyStyle( _ style: AtrStrStyle) -> NSAttributedString {
        NSAttributedString(string: self, attributes: style.attributes())
    }
    
}


func + (left: NSAttributedString, right: NSAttributedString) -> NSAttributedString {
    let result = NSMutableAttributedString()
    result.append(left)
    result.append(right)
    
    return result
}
