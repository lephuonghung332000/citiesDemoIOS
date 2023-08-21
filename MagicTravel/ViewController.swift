//
//  ViewController.swift
//  MagicTravel
//
//  Created by Rolan Marat on 1/21/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var citiesTableView: UITableView!
    
    var cities: [String: String] = ["HaNoi" : "VietNam", "Paris": "France", "Tokyo": "Japan", "BacKinh": "China", "Sydney": "Australia", "Bangkok": "Thailand", "Seoul": "Korean","Washington":"America","London":"England","Berlin":"Germany","Toronto":"Canada"]
    
    struct Constants {
       static let cellIdentifier = "citiesCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        citiesTableView.register(UITableViewCell.self,
                                    forCellReuseIdentifier: Constants.cellIdentifier)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath)

        var cellContentConfiguration = tableViewCell.defaultContentConfiguration()
        let cityName = Array(cities.keys)[indexPath.row]
        cellContentConfiguration.text = cityName
        cellContentConfiguration.secondaryText = cities[cityName] ?? ""
        tableViewCell.contentConfiguration = cellContentConfiguration

        return tableViewCell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        print("user tapped on cell at \(indexPath) indexPath")
        tableView.deselectRow(at: indexPath,
                              animated: true)
    }
}
