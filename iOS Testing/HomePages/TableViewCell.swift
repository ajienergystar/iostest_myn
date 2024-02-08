//
//  TableViewCell.swift
//  iOS Testing
//
//  Created by mymac on 08/02/24.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var imageData: UIImageView!
    
    @IBOutlet weak var labelName: UILabel!
    
    @IBOutlet weak var labelRating: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureView(imageData: String, name: String, rating: String) {
        let newImg: UIImage? = UIImage(named: imageData)
        self.imageData.image = newImg
        self.labelName.text = name
        self.labelRating.text = rating
    }

    
}
