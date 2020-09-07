//
//  ServiceDetail.swift
//  armutCase
//
//  Created by Eray Sezgin on 9/7/20.
//  Copyright © 2020 Eray Sezgin. All rights reserved.
//

import Foundation

class ServiceDetail: Codable {
    var id: Int
    var serviceId: Int
    var name: String
    var longName: String
    var imageURL: String
    var proCount: Int
    var averageRating: Double
    var completedJobs: Int
    
    enum CodingKeys: String, CodingKey {
        case id, serviceId = "service_id", name, longName = "long_name", imageURL = "image_url", proCount = "pro_count", averageRating = "average_rating", completedJobs = "completed_jobs_on_last_month"
    }
}
