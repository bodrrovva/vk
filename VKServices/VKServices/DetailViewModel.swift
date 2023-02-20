//
//  DetailViewModel.swift
//  VKServices
//
//  Created by muntyanu on 20.02.2023.
//

import Foundation

class DetailViewModel: DetailViewModelType {
    
    private var service: Service
    
    var name: String {
        return service.name
    }
    
    var description: String {
        return service.description
    }
    
    var iconURL: String {
        return service.iconURL
    }
    
    var serviceURL: String {
        return service.serviceURL
    }
    
    init(service: Service){
        self.service = service
    }
}
