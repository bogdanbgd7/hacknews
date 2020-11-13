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
        addPeopleTxtField.delegate = self
        addPeopleTxtField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(){
        if addPeopleTxtField.text == "" {
            emailArray = []
            tableView.reloadData()
        } else{
            DataService.instance.getEmail(forSearchQuery: addPeopleTxtField.text!) { (returnedEmailArray) in
                self.emailArray = returnedEmailArray
                self.tableView.reloadData()
            }
        }
    }
    
    //MARK: - Outlets
    @IBOutlet weak var titleTxtField: UITextField!
    @IBOutlet weak var descriptionTxtField: UITextField!
    @IBOutlet weak var addPeopleTxtField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var emailArray = [String]()
    
    
    //MARK: - Actions
    @IBAction func addGroupButtonPressed(_ sender: Any) {
    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
    }
    
}

//MARK: - Extensions
extension CreateGroupVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emailArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "userCell") as? UserCell else { return UITableViewCell() }
        let profileImgg = UIImage(named: "first")
        cell.configureCell(profileImage: profileImgg!, email: emailArray[indexPath.row], isSelected: true)
        return cell
    }
}

extension CreateGroupVC: UITextFieldDelegate{
    
    
    
}
