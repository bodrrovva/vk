//
//  Network.swift
//  VKServices
//
//  Created by muntyanu on 20.02.2023.
//

import Foundation
import UIKit

class NetworkManager {
    static func fetchData(completion: @escaping ([Service]) -> ()) {
        let url = URL(string: "https://mobile-olympiad-trajectory.hb.bizmrg.com/semi-final-data.json")
        guard let url else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data else { return }
            
            do {
                let response = try JSONDecoder().decode(Services.self, from: data)
                completion(response.items)
            } catch {
                print(error)
            }
        }.resume()
    }
}
