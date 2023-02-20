//
//  ServiceModel.swift
//  VKServices
//
//  Created by muntyanu on 20.02.2023.
//

import Foundation

struct Services: Codable {
    let items: [Service]
}

struct Service: Codable {
    let name: String
    let description: String
    let iconURL: String
    let serviceURL: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case description
        case iconURL = "icon_url"
        case serviceURL = "service_url"
    }
}
