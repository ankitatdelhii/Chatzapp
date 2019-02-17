//
//  customCell.swift
//  Chatzapp
//
//  Created by Ankit Saxena on 18/02/19.
//  Copyright © 2019 Ankit Saxena. All rights reserved.
//

import UIKit

class customCell: UITableViewCell {

    @IBOutlet weak var senderLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var senderPic: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
}
