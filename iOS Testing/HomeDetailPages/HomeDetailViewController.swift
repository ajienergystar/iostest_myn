//
//  HomeDetailViewController.swift
//  iOS Testing
//
//  Created by Aji Prakosa on 08/02/24.
//

import UIKit

class HomeDetailViewController: UIViewController {
    @IBOutlet weak var labelTittle: UILabel!
    @IBOutlet weak var imageData: UIImageView!
    
    @IBOutlet weak var imageArrow: UIImageView!
    
    @IBOutlet weak var StarStackView: UIStackView!
    
    var titles = String()
    var imageStr = String()
    
    private var selectedRate: Int = 0
        
    private let feedbackGenerator = UISelectionFeedbackGenerator()
        
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.labelTittle.text = titles
        self.imageData.image = UIImage(named: imageStr)
        
        StarStackView.axis = .horizontal
        StarStackView.distribution = .fillEqually
                
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didSelectRate))
        StarStackView.addGestureRecognizer(tapGesture)
        
        createStars()
                
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    
    @IBAction func backTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
  
    
    private func makeStarIcon() -> UIImageView {
        /// declare default icon and highlightedImage
        let imageView = UIImageView(image: #imageLiteral(resourceName: "star"), highlightedImage: #imageLiteral(resourceName: "star-2"))
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        return imageView
    }
    
    private func createStars() {
        for index in 1...Constants.starsCount {
            let star = makeStarIcon()
            star.tag = index
            StarStackView.addArrangedSubview(star)
        }
    }
    
    @objc private func didSelectRate(gesture: UITapGestureRecognizer) {
        let location = gesture.location(in: StarStackView)
        let starWidth = StarStackView.bounds.width / CGFloat(Constants.starsCount)
        let rate = Int(location.x / starWidth) + 1
            
            /// if current star doesn't match selectedRate then we change our rating
        if rate != self.selectedRate {
            feedbackGenerator.selectionChanged()
        self.selectedRate = rate
    }
            
    StarStackView.arrangedSubviews.forEach { subview in
            guard let starImageView = subview as? UIImageView else {
                return
            }
            starImageView.isHighlighted = starImageView.tag <= rate
        }
    }
    
    private struct Constants {
        static let starsCount: Int = 3
            
        static let sendButtonHeight: CGFloat = 50
        static let containerHorizontalInsets: CGFloat = 30
        static let starContainerHeight: CGFloat = 40
    }
    
}
