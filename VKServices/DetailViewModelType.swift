//
//  DetailViewModelType.swift
//  VKServices
//
//  Created by muntyanu on 20.02.2023.
//

import Foundation

protocol DetailViewModelType {
    var name: String { get }
    var description: String { get }
    var iconURL: String { get }
    var serviceURL: String { get }
}
