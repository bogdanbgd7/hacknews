//
//  GroupFeedVC.swift
//  hacknews
//
//  Created by Bogdan Ponocko on 18.11.20..
//  Copyright © 2020 Bogdan Ponocko. All rights reserved.
//

import UIKit

class GroupFeedVC: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var friendsLabel: UILabel!
    @IBOutlet weak var groupTitleLabel: UILabel!
    @IBOutlet weak var messageTxtField: UITextField!
    
    //MARK: - didLoad()
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    //MARK: - Actions
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendMessageBtnPressed(_ sender: Any) {
    }
    

}
