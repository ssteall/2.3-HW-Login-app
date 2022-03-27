//
//  ResumeViewController.swift
//  2.3 HW Login app
//
//  Created by Дмитрий Мирошников on 24.03.2022.
//

import UIKit

class ResumeViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var surname: UILabel!
    @IBOutlet var name: UILabel!
    @IBOutlet var age: UILabel!
    @IBOutlet var city: UILabel!
    @IBOutlet var email: UILabel!
    @IBOutlet var phoneNumber: UILabel!
    @IBOutlet var about: UILabel!
    @IBOutlet var profileImage: UIImageView! {
        didSet {
            profileImage.layer.cornerRadius = profileImage.frame.size.height / 2
            profileImage.layer.masksToBounds = true
            profileImage.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            profileImage.layer.borderWidth = 10
        }
    }
    
    // MARK: - public properties
    var user: User!
    
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
    
    // MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gradientLayer = CAGradientLayer()
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        profileImage.image = UIImage(named: user.person.photo)
        surname.text = user.person.surname
        name.text = user.person.name
        age.text = String(user.person.age)
        city.text = user.person.city
        email.text = user.person.email
        phoneNumber.text = user.person.contactNumber
        about.text = user.person.about
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let educationVC = segue.destination as? EducationViewController else { return }
        educationVC.university = user.person.education[0].educationalOrganization
        educationVC.specialization = user.person.education[0].specialization
        educationVC.eduLevel = user.person.education[0].typeOfEducation.rawValue
        educationVC.eduStartYear = user.person.education[0].startYear
        educationVC.eduEndYear = user.person.education[0].endYear
    }
    
    override func viewDidLayoutSubviews() {
        gradientLayer.frame = CGRect(x: 0,
                                     y: 0,
                                     width: self.view.bounds.size.width,
                                     height: self.view.safeAreaInsets.top + 20 + profileImage.frame.size.height / 2)
        gradientLayer.cornerRadius = 20
        gradientLayer.maskedCorners = [.layerMaxXMaxYCorner,
                                       .layerMinXMaxYCorner]
    }
}
