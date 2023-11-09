//
//  UIImageView+Ext.swift
///  MealsCategoryApp
//
//  Created by Neosoft on 07/11/23.
//

import UIKit
import SDWebImage

extension UIImageView {
    
    func setImageWith(url: String, placeHolder: UIImage = ImageAsset.placeholder.image) {
        self.sd_setImage(with: URL(string: url), placeholderImage: placeHolder, options: [], context: [:])
    }

}
