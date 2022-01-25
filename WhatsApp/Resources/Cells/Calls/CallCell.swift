//
//  CallCell.swift
//  WhatsApp
//
//  Created by Nicolas Famularo on 24/01/2022.
//

import UIKit

class CallCell: UITableViewCell {

    @IBOutlet weak var UserNameLabel: UILabel!
    @IBOutlet weak var ArrowCallImage: UIImageView!
    @IBOutlet weak var CallDataLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setData(_ user : UserDataModel){
        UserNameLabel.text = user.userName
        
        if user.direction == true {
            ArrowCallImage.image = UIImage(systemName: "arrow.up.forward")
            ArrowCallImage.tintColor = .green
        } else {
            ArrowCallImage.image = UIImage(systemName: "arrow.down.forward")
            ArrowCallImage.tintColor = .red
        }
        
        CallDataLabel.text = user.callData
        
    }
    
}
