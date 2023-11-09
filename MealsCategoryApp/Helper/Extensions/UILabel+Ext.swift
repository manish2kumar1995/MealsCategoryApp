//
//  UILabel+Ext.swift
//  MealsCategoryApp
//
//  Created by Neosoft on 08/11/23.
//

import UIKit

extension UILabel {
    var isTruncated: Bool {
        
        guard let labelText = text else {
            return false
        }
        
        let labelTextSize = (labelText as NSString).boundingRect(with: CGSize(width: frame.size.width, height: .greatestFiniteMagnitude),options: .usesLineFragmentOrigin,attributes: [NSAttributedString.Key.font: font!],context: nil).size
        
        return labelTextSize.height > bounds.size.height
    }

}
