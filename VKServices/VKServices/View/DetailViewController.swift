//
//  DetailViewController.swift
//  VKServices
//
//  Created by muntyanu on 20.02.2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var serviceURLLabel: UILabel!
        
    var viewModel: DetailViewModelType?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
                
        guard let viewModel = viewModel else { return }
        
        DispatchQueue.global().async {
            guard let imageUrl = URL(string: self.viewModel!.iconURL) else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
            
            DispatchQueue.main.async {
                self.iconImage.image = UIImage(data: imageData)
            }
        }
        
        self.nameLabel.text = viewModel.name
        self.descriptionLabel.text = viewModel.description
        self.serviceURLLabel.text = viewModel.serviceURL
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
