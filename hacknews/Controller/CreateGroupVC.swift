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
    @IBOutlet weak var membersLabel: UILabel!
    
    var emailArray = [String]()
    var chosenUsersArray = [String]()
    
    
    //MARK: - Actions
    @IBAction func addGroupButtonPressed(_ sender: Any) {
    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
        
        if chosenUsersArray.contains(emailArray[indexPath.row]){
            cell.configureCell(profileImage: profileImgg!, email: emailArray[indexPath.row], isSelected: true)
        }else {
            cell.configureCell(profileImage: profileImgg!, email: emailArray[indexPath.row], isSelected: false)
        }
        
        return cell
    }
    
    //MARK: - Adding selected users to chosenUsersArray
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? UserCell else {return}
        if !chosenUsersArray.contains(cell.emailLabel.text!){
            chosenUsersArray.append(cell.emailLabel.text!)
            membersLabel.text = chosenUsersArray.joined(separator: ", ")
        }
        else {
            chosenUsersArray = chosenUsersArray.filter({ $0 != cell.emailLabel.text! })
            if chosenUsersArray.count >= 1{
                membersLabel.text = chosenUsersArray.joined(separator: ", ")
            } else {
                membersLabel.text = "add people to group"
            }
        }
    }
}

extension CreateGroupVC: UITextFieldDelegate{
    
}
