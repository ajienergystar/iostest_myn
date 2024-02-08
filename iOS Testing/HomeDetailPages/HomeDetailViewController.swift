//
//  HomeDetailViewController.swift
//  iOS Testing
//
//  Created by mymac on 08/02/24.
//

import UIKit

class HomeDetailViewController: UIViewController {
    @IBOutlet weak var labelTittle: UILabel!
    @IBOutlet weak var imageData: UIImageView!
    
    @IBOutlet weak var imageArrow: UIImageView!
    
    var titles = String()
    var imageStr = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.labelTittle.text = titles
        self.imageData.image = UIImage(named: imageStr)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    
    @IBAction func backTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    
    }
    
}
