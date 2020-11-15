//
//  GroupCell.swift
//  hacknews
//
//  Created by Bogdan Ponocko on 15.11.20..
//  Copyright © 2020 Bogdan Ponocko. All rights reserved.
//

import UIKit

class GroupCell: UITableViewCell {

    //MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var membersLabel: UILabel!
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    //MARK: - Configure cell
    func configureCell(title: String, description: String, memberCounter: Int){
        self.titleLabel.text = title
        self.descriptionLabel.text = description
        membersLabel.text = "\(memberCounter) members."
    }
}
