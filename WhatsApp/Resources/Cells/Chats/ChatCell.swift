//
//  ChatCell.swift
//  WhatsApp
//
//  Created by Nicolas Famularo on 24/01/2022.
//

import UIKit

class ChatCell: UITableViewCell {
    
    
    @IBOutlet weak var userNameLabel:           UILabel!
    @IBOutlet weak var lastConnectionLabel:     UILabel!
    @IBOutlet weak var lastMessageLabel:        UILabel!
    @IBOutlet weak var nonViewedMessagesLabel:  UILabel!
    @IBOutlet weak var popUpNumberBackground:   UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setData(_ user : UserDataModel){
        userNameLabel.text          = user.userName
        lastConnectionLabel.text    = user.lastConnection
        lastMessageLabel.text       = user.lastMessage
        
        setNonViewedGlobe(user)
    }
    
    func setNonViewedGlobe(_ user : UserDataModel) {
        if user.nonViewedMessage > 0 {
            nonViewedMessagesLabel.textColor            = .white
            nonViewedMessagesLabel.text                 = "\(user.nonViewedMessage)"
            popUpNumberBackground.isHidden = false
            popUpNumberBackground.layer.masksToBounds   = true
            popUpNumberBackground.layer.cornerRadius    = popUpNumberBackground.frame.height / 2
            popUpNumberBackground.backgroundColor       = UIColor(named: "selectedItemsColor")
            
            
        } else {
            nonViewedMessagesLabel.text = ""
            popUpNumberBackground.isHidden = true
        }
        
    }

}
