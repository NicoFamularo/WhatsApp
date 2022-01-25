//
//  StatusCell.swift
//  WhatsApp
//
//  Created by Nicolas Famularo on 24/01/2022.
//

import UIKit

class StatusCell: UITableViewCell {
    
    
    @IBOutlet weak var imageUser    : UIImageView!
    @IBOutlet weak var userName     : UILabel!
    @IBOutlet weak var storyTime    : UILabel!
    @IBOutlet weak var cellWidth    : NSLayoutConstraint!
    
    
    let screenSize : CGRect = UIScreen.main.bounds
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellWidth.constant = screenSize.width
    }
    
    
    func setData(_ user: UserDataModel){
        userName.text   = user.userName
        storyTime.text  = user.storyTime
        
    }

}
