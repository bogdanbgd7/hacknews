//
//  FeedCell.swift
//  hacknews
//
//  Created by Bogdan Ponocko on 09/11/2020.
//  Copyright © 2020 Bogdan Ponocko. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {

    
    //MARK: Outlets
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    
    //MARK: Functions for cells
    func configureCell(profileImage: UIImage, email: String, content: String){
    
        self.profileImage.image = profileImage
        self.emailLabel.text = email
        self.contentLabel.text = content
        
        
    }
    
}
