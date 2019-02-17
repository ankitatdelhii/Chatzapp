//
//  ChatView.swift
//  Chatzapp
//
//  Created by Ankit Saxena on 17/02/19.
//  Copyright © 2019 Ankit Saxena. All rights reserved.
//

import UIKit
import Firebase

class ChatView: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var messageBoxTF: UITextField!
    @IBOutlet weak var customTableView: UITableView!
    @IBOutlet weak var sendButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customTableView.delegate = self
        customTableView.dataSource = self

        // Do any additional setup after loading the view.
        customTableView.register(UINib(nibName: "customCell", bundle: nil), forCellReuseIdentifier: "customCell")
        self.hideKeyboard()
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
    
    //MARK: Send Button
    @IBAction func sendButtonPressed(_ sender: UIButton) {
        self.dismissKeyboard()
        sendButton.isEnabled = false
        messageBoxTF.isEnabled = false
        
        // Creating Child db for messages
        let db = Database.database().reference().child("Messages")
        let messageDict = ["Sender" : Auth.auth().currentUser?.email!, "MessageBody" : messageBoxTF.text!]
        db.childByAutoId().setValue(messageDict){
            (error, user) in
            if error != nil{
                print(error ?? "Error Sending Message")
            }
            else{
                self.sendButton.isEnabled = true
                self.messageBoxTF.isEnabled = true
                self.messageBoxTF.text = ""
            }
        }
    }
    
    //MARK: TableView Methods
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
}
