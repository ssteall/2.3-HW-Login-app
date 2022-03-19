//
//  ViewController.swift
//  2.3 HW Login app
//
//  Created by Дмитрий Мирошников on 19.03.2022.
//

import UIKit

class ViewController: UIViewController {

    private let password = "password"
    private let username = "user"

    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.userName = userNameTextField.text
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }

    @IBAction func LoginButtonPressed() {
        let inputUserName = userNameTextField.text ?? ""
        let inputPassword = passwordTextField.text ?? ""
        
        if inputUserName == username && inputPassword == password {
            performSegue(withIdentifier: "welcomeSegue", sender: nil)
        } else {
            showAlert(title: "Invalid username or Password",
                      massage: "Please, enter correct username and password",
                      style: .alert)
        }
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        passwordTextField.text = ""
    }
    
    @IBAction func ForgotPasswordButtonPressed() {
        showAlert(title: "Password is",
                  massage: password,
                  style: .alert)
    }
    
    @IBAction func ForgotUserNameButtonPressed() {
        showAlert(title: "User name is",
                  massage: username,
                  style: .alert)
    }
    
    private func showAlert(title: String, massage: String, style: UIAlertController.Style){
        let alert = UIAlertController(title: title,
                                      message: massage,
                                      preferredStyle: style)
        alert.addAction(UIAlertAction(title: "Ок",
                                      style: .default))
        self.present(alert, animated: true)
    }
}

extension ViewController: UITextFieldDelegate {
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


