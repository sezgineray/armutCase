//
//  OtherServiceCollectionViewCell.swift
//  armutCase
//
//  Created by Eray Sezgin on 9/8/20.
//  Copyright © 2020 Eray Sezgin. All rights reserved.
//

import UIKit

class OtherServiceCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    func configure(_ viewModel: Service) {
        image.imageFromUrl(urlString: viewModel.imageURL)
        nameLabel.text = viewModel.name
        let countLabelText = (viewModel.proCount == 1) ? " Pro near you" : " Pros near you"
        countLabel.text = "\(viewModel.proCount)" + countLabelText
    }
}
