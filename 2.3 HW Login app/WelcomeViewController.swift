//
//  WelcomeViewController.swift
//  2.3 HW Login app
//
//  Created by Дмитрий Мирошников on 19.03.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    var userName: String!
    @IBOutlet var welcomeTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeTextLabel.text = ("Welcome, \(userName!)!")
        // Do any additional setup after loading the view.
    }

    @IBAction func LogOutButtonPressed() {
        dismiss(animated: true)
    }
    
}
