//
//  ChatView.swift
//  Chatzapp
//
//  Created by Ankit Saxena on 17/02/19.
//  Copyright © 2019 Ankit Saxena. All rights reserved.
//

import UIKit
import Firebase

class ChatView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        do {
        try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        }
        catch{
            print(error)
        }
    }
    
}
