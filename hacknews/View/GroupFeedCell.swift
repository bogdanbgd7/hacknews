//
//  GroupFeedCell.swift
//  hacknews
//
//  Created by Bogdan Ponocko on 18.11.20..
//  Copyright © 2020 Bogdan Ponocko. All rights reserved.
//

import UIKit

class GroupFeedCell: UITableViewCell {

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    //MARK: - Outlets
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    
    func configureCell() {
        
    }
    
}