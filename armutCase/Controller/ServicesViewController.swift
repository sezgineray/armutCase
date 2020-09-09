//
//  ServicesViewController.swift
//  armutCase
//
//  Created by Eray Sezgin on 9/7/20.
//  Copyright © 2020 Eray Sezgin. All rights reserved.
//

import UIKit
import Alamofire

class ServicesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var trendingCollectionView: UICollectionView!
    @IBOutlet weak var cleaningCollectionView: UICollectionView!
    @IBOutlet weak var blogCollectionView: UICollectionView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var trendingServices = [Service]()
    var otherServices = [Service]()
    var blogItems = [BlogItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getHomeContent()

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
        
        trendingCollectionView.delegate = self
        trendingCollectionView.dataSource = self
        cleaningCollectionView.delegate = self
        cleaningCollectionView.dataSource = self
        blogCollectionView.delegate = self
        blogCollectionView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        scrollView.contentSize = CGSize(width: view.bounds.width, height: 943)
    }
    
    func getHomeContent(){
        let url = "https://my-json-server.typicode.com/engincancan/case/home"
        AF.request(url)
          .validate()
          .responseDecodable(of: HomeContent.self) { response in
            if let content = response.value {
                self.trendingServices = content.trendingServices ?? []
                self.otherServices = content.otherServices ?? []
                self.blogItems = content.blogItems ?? []
                
                self.trendingCollectionView.reloadData()
                self.cleaningCollectionView.reloadData()
                self.blogCollectionView.reloadData()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == trendingCollectionView {
            return self.trendingServices.count
        }
        else if collectionView == cleaningCollectionView {
            return self.otherServices.count
        }
        else {
            return self.blogItems.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == trendingCollectionView {
            let trendingCell = collectionView.dequeueReusableCell(withReuseIdentifier: "trendingService", for: indexPath) as! ServiceCollectionViewCell
            let trendingService = trendingServices[indexPath.row]
            trendingCell.configure(trendingService)
            return trendingCell
        }
        else if collectionView == cleaningCollectionView {
            let otherCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cleaningService", for: indexPath) as! OtherServiceCollectionViewCell
            let otherService = otherServices[indexPath.row]
            otherCell.configure(otherService)
            return otherCell
        }
        else {
            let blogCell = collectionView.dequeueReusableCell(withReuseIdentifier: "blogItem", for: indexPath) as! BlogCollectionViewCell
            let blogItem = blogItems[indexPath.row]
            blogCell.configure(blogItem)
            return blogCell
        }
    }

    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "serviceDetailSegue") {
            let serviceDetailViewController = segue.destination as! ServiceDetailsViewController
            let serviceCollectionViewCell = sender as! ServiceCollectionViewCell
            let serviceId = serviceCollectionViewCell.id
            serviceDetailViewController.serviceId = serviceId
        }
    }
    

}
