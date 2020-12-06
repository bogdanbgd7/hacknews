//
//  GroupFeedVC.swift
//  hacknews
//
//  Created by Bogdan Ponocko on 18.11.20..
//  Copyright © 2020 Bogdan Ponocko. All rights reserved.
//

import UIKit
import Firebase

class GroupFeedVC: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var friendsLabel: UILabel!
    @IBOutlet weak var groupTitleLabel: UILabel!
    @IBOutlet weak var messageTxtField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Receive data from GroupVC
    var group:  Group?
    var groupMessages = [Message]()
    
    func getGroupData(forGroup group: Group){
        self.group = group
        
    }
    
    //MARK: - viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        groupTitleLabel.text = group?.title
        DataService.instance.getEmails(group: group!) { (returnedEMails) in
            self.friendsLabel.text = returnedEMails.joined(separator: ", ")
        }
        
        DataService.instance.REF_GROUPS.observe(.value) { (snap) in
            DataService.instance.getAllMessagesForEachGroup(selectedGroup: self.group!) { (returnedGroupMessages) in
                self.groupMessages = returnedGroupMessages
                self.tableView.reloadData()
                
                //nice and pretty animation
                if self.groupMessages.count > 0{
                    self.tableView.scrollToRow(at: IndexPath.init(row: self.groupMessages.count - 1, section: 0), at: .none, animated: true)
                }
            }
        }
        
    }
    
    //MARK: - didLoad()
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    //MARK: - Actions
    @IBAction func backBtnWasPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendMessageBtnPressed(_ sender: Any) {
        let currentUser = Auth.auth().currentUser?.uid
        if messageTxtField.text != "" {
            DataService.instance.uploadPost(withMessage: messageTxtField.text!, forUID: currentUser!, withGroupKey: group?.senderID) { (completed) in
                if completed{
                    self.messageTxtField.text = ""
                }
            }
        }
    }
    

}

extension GroupFeedVC: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupMessages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "groupFeedCell", for: indexPath) as? GroupFeedCell else {return UITableViewCell()}
        let message = groupMessages[indexPath.row]
        DataService.instance.getEmail(forUID: message.senderID) { (email) in
            cell.configureCell(profileImage: UIImage(named: "first")!, email: email, content: message.content)
        }
        return cell
        
    }
    
}
