//
//  BlogCollectionViewCell.swift
//  armutCase
//
//  Created by Eray Sezgin on 9/7/20.
//  Copyright © 2020 Eray Sezgin. All rights reserved.
//

import UIKit

class BlogCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var titleText: UITextView!
    @IBOutlet weak var image: UIImageView!
    
    func configure(_ viewModel: BlogItem) {
        image.imageFromUrl(urlString: viewModel.imageURL)
        categoryLabel.text = viewModel.category
        titleText.text = viewModel.title
    }
}
