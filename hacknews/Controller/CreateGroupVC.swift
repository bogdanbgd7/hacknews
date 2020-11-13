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
        
        tableView.delegate = self
        tableView.dataSource = self
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

extension CreateGroupVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "userCell") as? UserCell else { return UITableViewCell() }
        let profileImgg = UIImage(named: "first")
        cell.configureCell(profileImage: profileImgg!, email: "random@email.com", isSelected: true)
        return cell
    }
}
