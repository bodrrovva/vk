//
//  TableViewCell.swift
//  VKServices
//
//  Created by muntyanu on 20.02.2023.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    
    weak var viewModel: TableViewCellViewModelType? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            
            nameLabel.text = viewModel.name
            
            DispatchQueue.global().async {
                guard let imageUrl = URL(string: self.viewModel!.iconURL) else { return }
                guard let imageData = try? Data(contentsOf: imageUrl) else { return }
                
                DispatchQueue.main.async {
                    self.iconImage.image = UIImage(data: imageData)
                }
            }
        }
    }
}
