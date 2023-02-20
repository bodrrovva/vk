//
//  ViewModel.swift
//  VKServices
//
//  Created by muntyanu on 20.02.2023.
//

import Foundation
import UIKit

class ViewModel: TableViewViewModelType {
    
    private var selectedIndexPath: IndexPath?
    private var service = [Service]()

    init() {
        NetworkManager.fetchData() { data in
            self.service = data
        }
    }
    
    
    func numberOfRows() -> Int {
        service.count
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelType? {
        let service = service[indexPath.row]
        return TableViewCellViewModel(service: service)
    }
    
    func viewModelForSelectedRow() -> DetailViewModelType? {
        guard let selectedIndexPath = selectedIndexPath else { return nil }
        return DetailViewModel(service: service[selectedIndexPath.row])
    }
    
    func selectRow(atIndexPath indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
}

