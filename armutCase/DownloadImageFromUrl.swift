//
//  DownloadImageFromUrl.swift
//  armutCase
//
//  Created by Eray Sezgin on 9/8/20.
//  Copyright © 2020 Eray Sezgin. All rights reserved.
//

import UIKit

extension UIImageView {

    public func imageFromUrl(urlString: String) {
        self.image = UIImage(named: "armut-logo-color")
        if let url = URL(string: urlString) {
                   URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                       DispatchQueue.main.async {
                           if let data = data {
                               if let downloadedImage = UIImage(data: data) {
                                   self.image = downloadedImage
                               }
                           }
                       }
                   }).resume()
        }
    }

}
