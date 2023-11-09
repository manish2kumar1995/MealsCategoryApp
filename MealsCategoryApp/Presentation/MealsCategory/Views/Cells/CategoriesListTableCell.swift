//
//  CategoriesListTableCell.swift
//  MealsCategoryApp
//
//  Created by Neosoft on 07/11/23.
//

import UIKit

protocol CategoriesListTableCellDelegate {
    func didTapOnViewMoreOrLess(at index: Int)
}

class CategoriesListTableCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var viewMoreButton: UIButton!

    var index: Int?
    var delegate: CategoriesListTableCellDelegate?
    var categoryData: Category? {
        didSet {
            if let data = categoryData {
                self.titleLabel.text = data.categoryName
                self.descriptionLabel.text = data.categoryDescription
                if let imageURL = data.categoryThumbImage {
                    categoryImageView.setImageWith(url: imageURL)
                } else {
                    categoryImageView.image = ImageAsset.placeholder.image
                }
                self.descriptionLabel.numberOfLines = (data.isExpanded ?? false) ? 0 : 2

                if (data.isExpanded ?? false) {
                    self.viewMoreButton.setTitle("View Less", for: .normal)
                    self.viewMoreButton.isHidden = false
                } else {
                    self.viewMoreButton.setTitle("View More", for: .normal)
                    self.viewMoreButton.isHidden = !self.descriptionLabel.isTruncated
                }
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func viewMoreAction(_ sender: UIButton) {
        if let index = self.index, let data = self.categoryData {
           // self.descriptionLabel.numberOfLines = (data.isExpanded ?? false) ? 2 : 0
            self.delegate?.didTapOnViewMoreOrLess(at: index)
        }
    }
    
}
