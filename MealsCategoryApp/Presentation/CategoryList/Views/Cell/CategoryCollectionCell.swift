//
//  CategoryCollectionCell.swift
//  MealsCategoryApp
//
//  Created by Neosoft on 07/11/23.
//

import UIKit

class CategoryCollectionCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoryImageView: UIImageView!
    
    var meal: Meal? {
        didSet {
            if let data = meal {
                self.titleLabel.text = data.mealName
                if let imageURL = data.mealThumbImage {
                    categoryImageView.setImageWith(url: imageURL)
                }else{
                    categoryImageView.image = ImageAsset.placeholder.image
                }
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
