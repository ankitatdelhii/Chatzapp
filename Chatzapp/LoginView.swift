//
//  LoginView.swift
//  Chatzapp
//
//  Created by Ankit Saxena on 16/02/19.
//  Copyright © 2019 Ankit Saxena. All rights reserved.
//

import UIKit

class LoginView: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("In Login")
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
    }
    
}
