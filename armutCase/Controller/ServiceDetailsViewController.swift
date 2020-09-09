//
//  ServiceDetailsViewController.swift
//  armutCase
//
//  Created by Eray Sezgin on 9/7/20.
//  Copyright © 2020 Eray Sezgin. All rights reserved.
//

import UIKit
import Alamofire

class ServiceDetailsViewController: UIViewController {
    var serviceId: Int?
    
    @IBOutlet weak var serviceImage: UIImageView!
    @IBOutlet weak var serviceTitleLabel: UILabel!
    
    @IBOutlet weak var prosNearbyLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var completedJobsLabel: UILabel!
    
    @IBOutlet weak var roundView1: UIView!
    @IBOutlet weak var roundView2: UIView!
    @IBOutlet weak var roundView3: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        roundView1.layer.borderWidth = 1
        roundView1.layer.cornerRadius = roundView1.bounds.size.width/2
        roundView2.layer.borderWidth = 1
        roundView2.layer.cornerRadius = roundView2.bounds.size.width/2
        roundView3.layer.borderWidth = 1
        roundView3.layer.cornerRadius = roundView3.bounds.size.width/2

        getServiceDetails(id: serviceId!)
    }
    
    func getServiceDetails(id: Int) {
        let baseUrl = "https://my-json-server.typicode.com/engincancan/case/service/"
        let url = baseUrl + String(id)
        AF.request(url)
            .validate()
            .responseDecodable(of: ServiceDetail.self) { response in
                if let content = response.value {
                    self.serviceTitleLabel.text = content.name
                    self.serviceImage.imageFromUrl(urlString: content.imageURL)
                    
                    let prosNearbyLabelText = (content.proCount == 1) ? " Pro near you" : " Pros near you"
                    self.prosNearbyLabel.text = "\(content.proCount)" + prosNearbyLabelText
                    self.ratingLabel.text = "\(content.averageRating) average rating"
                    self.completedJobsLabel.text = "Last month \(content.completedJobs) jobs completed"
                }
            }
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
