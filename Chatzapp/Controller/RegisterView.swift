//
//  RegisterView.swift
//  Chatzapp
//
//  Created by Ankit Saxena on 17/02/19.
//  Copyright © 2019 Ankit Saxena. All rights reserved.
//

import UIKit
import Firebase

extension UIViewController{
    func hideKeyboard(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
}

class RegisterView: UIViewController {
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboard()
        configureButton()
    }
    
    func configureButton(){
        registerButton.titleLabel?.numberOfLines = 1
        registerButton.titleLabel?.adjustsFontSizeToFitWidth = true
        registerButton.titleLabel?.lineBreakMode = NSLineBreakMode.byClipping
    }
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
        Auth.auth().createUser(withEmail: usernameTextField.text!, password: passwordTextField.text!) { (user, error) in
            if error != nil{
                print(error ?? "Error Registering User")
            }
            else{
                self.performSegue(withIdentifier: "goToChat", sender: self)
            }
        }
    }
    
}
