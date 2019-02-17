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
    
    var messageArray = [MessagesModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customTableView.delegate = self
        customTableView.dataSource = self

        // Do any additional setup after loading the view.
        customTableView.register(UINib(nibName: "customCell", bundle: nil), forCellReuseIdentifier: "customCell")
        self.hideKeyboard()
        configureTableView()
        retrieveMessage()
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
    
    //MARK: Retrive Messages
    func retrieveMessage(){
        let db = Database.database().reference().child("Messages")
        db.observe(.childAdded) { (snapshot) in
            let snapshotValue = snapshot.value as! [String : String]
            let sender = snapshotValue["Sender"]
            let message = snapshotValue["MessageBody"]
            var messageObj = MessagesModel()
            messageObj.messageBody = message
            messageObj.sender = sender
            self.messageArray.append(messageObj)
            self.configureTableView()
            self.customTableView.reloadData()
        }
    }
    
    //MARK: Configuring Table View
    func configureTableView(){
        customTableView.rowHeight = UITableView.automaticDimension
        customTableView.estimatedRowHeight = 90.0
    }
    
    //MARK: TableView Methods
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! customCell
        cell.messageLabel.text = messageArray[indexPath.row].messageBody!
        cell.senderLabel.text = messageArray[indexPath.row].sender!
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArray.count
    }
    
}
