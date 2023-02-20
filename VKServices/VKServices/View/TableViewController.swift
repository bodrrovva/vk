//
//  TableViewController.swift
//  VKServices
//
//  Created by muntyanu on 20.02.2023.
//

import UIKit

class TableViewController: UITableViewController {

    var service = [Service]()
    var viewModel: TableViewViewModelType?

    override func viewDidLoad() {
        super.viewDidLoad()

        fetchData()
        viewModel = ViewModel()
    }

    // MARK: - Table view data source

    func fetchData() {
        NetworkManager.fetchData() { data in
            self.service = data
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return service.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell

        cell.nameLabel.text = service[indexPath.row].name

        DispatchQueue.global().async {
            guard let imageUrl = URL(string: self.service[indexPath.row].iconURL) else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }

            DispatchQueue.main.async {
                cell.iconImage.image = UIImage(data: imageData)
            }
        }
        return cell
    }

    // MARK: - Navigation
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detailSegue", sender: nil)

        guard let viewModel = viewModel else { return }
        viewModel.selectRow(atIndexPath: indexPath)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier, let viewModel = viewModel else { return }

        if identifier == "detailSegue" {
            if let dvc = segue.destination as? DetailViewController {
                dvc.viewModel = viewModel.viewModelForSelectedRow()
            }
        }
    }
}
