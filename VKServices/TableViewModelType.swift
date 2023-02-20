//
//  TableViewModelType.swift
//  VKServices
//
//  Created by muntyanu on 20.02.2023.
//

import Foundation

protocol TableViewViewModelType {
//    func fetchData()
    
    func numberOfRows() -> Int
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelType?

    func viewModelForSelectedRow() -> DetailViewModelType?
    func selectRow(atIndexPath indexPath: IndexPath)
}
