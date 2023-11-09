//
//  ImageAssets.swift
//  MealsCategoryApp
//
//  Created by Neosoft on 09/11/23.
//

import UIKit

enum ImageAsset : String {
    case placeholder = "placeholder"
}

extension ImageAsset {
  var image : UIImage {
    return UIImage(named: self.rawValue)!
  }
}
