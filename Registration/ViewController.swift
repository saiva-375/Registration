//
//  ViewController.swift
//  Registration
//
//  Created by sai on 1/16/26.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var userNameTF: UITextField!
    
    
    @IBOutlet weak var passwordTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func nextButton(_ sender: Any) {
        if !validateLogin() {
            showAlert(title: "Login Failed", message: "Please enter valid credentials")
            return
        }
        navgiateToNextScreen()
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func validateLogin() -> Bool {
        guard let username = userNameTF.text, let password = passwordTF.text else {
            return false
        }
        
        return username.count > 0 && username.count < 10 && password.count > 0 && password.count < 8
        
    }
    
    func navgiateToNextScreen() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let objNextVC = storyboard.instantiateViewController(withIdentifier: "NextVC") as? NextVC
        
        if let nextVC = objNextVC {
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
    }
}

