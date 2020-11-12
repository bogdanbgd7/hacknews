//
//  CreateGroupVC.swift
//  hacknews
//
//  Created by Bogdan Ponocko on 12/11/2020.
//  Copyright © 2020 Bogdan Ponocko. All rights reserved.
//

import UIKit

class CreateGroupVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: Outlets
    @IBOutlet weak var titleTxtField: UITextField!
    @IBOutlet weak var descriptionTxtField: UITextField!
    @IBOutlet weak var addPeopleTxtField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Actions
    @IBAction func addGroupButtonPressed(_ sender: Any) {
    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
    }
    
    
    
    
    
}
