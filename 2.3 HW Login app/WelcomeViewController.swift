//
//  WelcomeViewController.swift
//  2.3 HW Login app
//
//  Created by Дмитрий Мирошников on 19.03.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var welcomeTextLabel: UILabel!
    
    // MARK: - public properties
    var userName: String!
    
    // MARK: - private properties
    private var gradientLayer: CAGradientLayer! {
        didSet {
            gradientLayer.startPoint = CGPoint(x: 0, y: 0)
            gradientLayer.endPoint = CGPoint(x: 0, y: 1)
            let startColor = #colorLiteral(red: 0.8235294118, green: 0.4941176471, blue: 0.5803921569, alpha: 1).cgColor
            let endColor = #colorLiteral(red: 0.4745098039, green: 0.6235294118, blue: 0.8784313725, alpha: 1).cgColor
            gradientLayer.colors = [startColor, endColor]
        }
    }
    
    // MARK: - Override functions
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeTextLabel.text = ("Welcome, \(userName!)!")
        gradientLayer = CAGradientLayer()
        view.layer.insertSublayer(gradientLayer, at: 0)
    }

    override func viewDidLayoutSubviews() {
        gradientLayer.frame = CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height)
    }
    
    // MARK: - IB Actions
    @IBAction func LogOutButtonPressed() {
        dismiss(animated: true)
    }
    
}
