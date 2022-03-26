//
//  EducationViewController.swift
//  2.3 HW Login app
//
//  Created by Дмитрий Мирошников on 26.03.2022.
//

import UIKit

class EducationViewController: UIViewController {

    // MARK: - IB Outlets
    @IBOutlet var universityName: UILabel!
    @IBOutlet var specializationName: UILabel!
    @IBOutlet var educationLevel: UILabel!
    @IBOutlet var trainingPeriod: UILabel!
    @IBOutlet var universityPhoto: UIImageView! {
        didSet {
            universityPhoto.layer.cornerRadius = universityPhoto.frame.size.height / 2
            universityPhoto.layer.masksToBounds = true
            universityPhoto.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            universityPhoto.layer.borderWidth = 10
        }
    }
    
    // MARK: - Public properties
    var university: String!
    var specialization: String!
    var eduLevel: String!
    var eduStartYear: Int!
    var eduEndYear: Int!
    
    
    // MARK: -  Private properties
    private var gradientLayer: CAGradientLayer! {
        didSet {
            gradientLayer.startPoint = CGPoint(x: 0, y: 0)
            gradientLayer.endPoint = CGPoint(x: 0, y: 1)
            let startColor = #colorLiteral(red: 0.8235294118, green: 0.4941176471, blue: 0.5803921569, alpha: 1).cgColor
            let endColor = #colorLiteral(red: 0.4745098039, green: 0.6235294118, blue: 0.8784313725, alpha: 1).cgColor
            gradientLayer.colors = [startColor, endColor]
        }
    }
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gradientLayer = CAGradientLayer()
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        universityName.text = university
        specializationName.text = specialization
        educationLevel.text = eduLevel
        trainingPeriod.text = "\(eduStartYear!) - \(eduEndYear!)"
    }
    
    override func viewDidLayoutSubviews() {
        gradientLayer.frame = CGRect(x: 0,
                                     y: 0,
                                     width: self.view.bounds.size.width,
                                     height: self.view.safeAreaInsets.top + 20 + universityPhoto.frame.size.height / 2)
        gradientLayer.cornerRadius = 20
        gradientLayer.maskedCorners = [.layerMaxXMaxYCorner,
                                       .layerMinXMaxYCorner]
    }
}
