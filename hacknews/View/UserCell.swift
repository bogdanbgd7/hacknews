//
//  UserCell.swift
//  hacknews
//
//  Created by Bogdan Ponocko on 12/11/2020.
//  Copyright © 2020 Bogdan Ponocko. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {
    
    var showing = false

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if selected{
            if showing == false{
                checkImage.isHidden = false
                showing = true
            }
        } else {
            checkImage.isHidden = true
            showing = false
        }
        
    }
    
    //MARK: - Outlets
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var checkImage: UIImageView!
    
    //MARK: - Cell Config
    func configureCell(profileImage image: UIImage, email: String, isSelected: Bool) {
        
        self.profileImg.image = image
        self.emailLabel.text = email
        
        if isSelected {
            checkImage.isHidden = false
        } else {
            checkImage.isHidden = true
        }
        
    }
    
}
