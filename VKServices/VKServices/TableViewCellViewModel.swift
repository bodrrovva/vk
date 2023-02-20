//
//  TableViewCellViewModel.swift
//  VKServices
//
//  Created by muntyanu on 20.02.2023.
//

import Foundation

class TableViewCellViewModel: TableViewCellViewModelType {
    
    private var service: Service
    
    var name: String {
        return service.name
    }
    
    var iconURL: String {
        return service.iconURL
    }
    
    init(service: Service) {
        self.service = service
    }
}
