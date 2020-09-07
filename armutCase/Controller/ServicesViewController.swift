//
//  ServicesViewController.swift
//  armutCase
//
//  Created by Eray Sezgin on 9/7/20.
//  Copyright © 2020 Eray Sezgin. All rights reserved.
//

import UIKit

class ServicesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the navigation bar title to Armut logo.
        let logoImage = UIImage(named: "armut-logo-color")
        navigationItem.titleView = UIImageView(image: logoImage)
        
        // Add search bar to navigation bar.
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
        let micImage = UIImage(named: "Action")
        searchController.searchBar.setImage(micImage, for: .bookmark, state: .normal)
        searchController.searchBar.showsBookmarkButton = true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
