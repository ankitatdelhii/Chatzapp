//
//  RegisterView.swift
//  Chatzapp
//
//  Created by Ankit Saxena on 17/02/19.
//  Copyright © 2019 Ankit Saxena. All rights reserved.
//

import UIKit

class RegisterView: UIViewController {
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButton()
        // Do any additional setup after loading the view.
    }
    
    func configureButton(){
        registerButton.titleLabel?.numberOfLines = 1
        registerButton.titleLabel?.adjustsFontSizeToFitWidth = true
        registerButton.titleLabel?.lineBreakMode = NSLineBreakMode.byClipping
    }
    
    @IBAction func registerButtonPressed(_ sender: UIButton) {
    }
    
}
