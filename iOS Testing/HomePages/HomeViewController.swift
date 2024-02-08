//
//  HomeViewController.swift
//  iOS Testing
//
//  Created by Aji Prakosa on 08/02/24.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableData: UITableView!
    
    var menuItems: NSArray = [
        ["Image" : "superman", "Title" : "Superman", "Rating": "Very Good"],
        ["Image" : "avenger_ironman", "Title" : "Iron Man", "Rating": "Normal"],
        ["Image" : "avenger_hulk", "Title" : "Hulk", "Rating": "Awesome"],
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableData.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        self.tableData.delegate = self
        self.tableData.dataSource = self
        self.tableData.separatorStyle = .none
        self.tableData.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 117
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath as IndexPath) as! TableViewCell
        
        
        let images: String = String(describing: (menuItems.value(forKey: "Image") as! NSArray).object(at: indexPath.row))
        let titles: String = String(describing: (menuItems.value(forKey: "Title") as! NSArray).object(at: indexPath.row))
        let ratings: String = String(describing: (menuItems.value(forKey: "Rating") as! NSArray).object(at: indexPath.row))


        cell.selectionStyle = .none
        cell.configureView(imageData: images, name: titles, rating: ratings)
        cell.accessoryType = .disclosureIndicator

        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let images: String = String(describing: (menuItems.value(forKey: "Image") as! NSArray).object(at: indexPath.row))
        let titles: String = String(describing: (menuItems.value(forKey: "Title") as! NSArray).object(at: indexPath.row))
        let ratings: String = String(describing: (menuItems.value(forKey: "Rating") as! NSArray).object(at: indexPath.row))

        let viewController = HomeDetailViewController()
        viewController.titles = titles
        viewController.imageStr = images
        viewController.ratting = ratings
        self.navigationController?.pushViewController(viewController, animated: true)

    }

}
