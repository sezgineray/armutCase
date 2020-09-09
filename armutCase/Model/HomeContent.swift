//
//  HomeContent.swift
//  armutCase
//
//  Created by Eray Sezgin on 9/7/20.
//  Copyright © 2020 Eray Sezgin. All rights reserved.
//

import Foundation

class HomeContent: Codable {
    var trendingServices: [Service]?
    var otherServices: [Service]?
    var blogItems: [BlogItem]?

    enum CodingKeys: String, CodingKey {
        case trendingServices = "trending", otherServices = "other", blogItems = "posts"
    }
}

class Service: Codable {
    var id: Int
    var serviceId: Int
    var name: String
    var longName: String
    var imageURL: String
    var proCount: Int
    
    enum CodingKeys: String, CodingKey {
        case id, serviceId = "service_id", name, longName = "long_name", imageURL = "image_url", proCount = "pro_count"
    }
}

class BlogItem: Codable {
    var link: String
    var title: String
    var category: String
    var imageURL: String
    
    enum CodingKeys: String, CodingKey {
        case link, title, category, imageURL = "image_url"
    }
}
