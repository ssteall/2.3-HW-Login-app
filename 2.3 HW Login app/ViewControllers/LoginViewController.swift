//
//  ViewController.swift
//  2.3 HW Login app
//
//  Created by Дмитрий Мирошников on 19.03.2022.
//

import UIKit

class LoginViewController: UIViewController {

    
    // MARK: - IB Outlets
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!

    // MARK: - private properties
    private var user = User.getUser()
    
    // MARK: - Override functions
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        for viewController in tabBarController.viewControllers! {
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.name = user.person.name
                welcomeVC.surname = user.person.surname
            } else if let navigationVC = viewController as? UINavigationController {
                let resumeVC = navigationVC.topViewController as! ResumeViewController
                resumeVC.user = user
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }

    // MARK: - IB Actions
    @IBAction func LoginButtonPressed() {
        let inputUserName = userNameTextField.text ?? ""
        let inputPassword = passwordTextField.text ?? ""
        
        if inputUserName == user.userName && inputPassword == user.password {
            performSegue(withIdentifier: "welcomeSegue", sender: nil)
        } else {
            showAlert(title: "Invalid username or password",
                      massage: "Please, enter correct user name and password")
            passwordTextField.text = ""
        }
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        passwordTextField.text = ""
    }
    
    @IBAction func forgotPasswordButtonPressed() {
        showAlert(title: "Password is",
                  massage: user.password)
    }
    
    @IBAction func forgotUserNameButtonPressed() {
        showAlert(title: "User name is",
                  massage: user.userName)
    }
    
    // MARK: - Private methods
    private func showAlert(title: String, massage: String){
        let alert = UIAlertController(title: title,
                                      message: massage,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ок",
                                      style: .default))
        self.present(alert, animated: true)
    }
}

// MARK: - Extentions
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
            LoginButtonPressed()
        }
        return true
    }
}


