//
//  GroupsVC.swift
//  hacknews
//
//  Created by Bogdan Ponocko on 23/10/2020.
//  Copyright © 2020 Bogdan Ponocko. All rights reserved.
//

import UIKit

class GroupsVC: UIViewController {
    
    var groupsArray = [Group]()
    
    //MARK: - Outlets
    @IBOutlet weak var tableVIew: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableVIew.delegate = self
        tableVIew.dataSource = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        DataService.instance.REF_GROUPS.observe(.value) { (snapshot) in
            DataService.instance.getGroups { (returnedGroupArrayFirebase) in
                self.groupsArray = returnedGroupArrayFirebase
                self.tableVIew.reloadData()
            }
        }
        
        
        
    }

}

extension GroupsVC: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath) as? GroupCell else {return UITableViewCell()}
        
        let group = groupsArray[indexPath.row]
        cell.configureCell(title: group.title, description: group.description, memberCounter: group.membersCounter)
        return cell
    }
    
    //MARK: - func for GroupFeed didSelectRowAt
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let groupFeed = storyboard?.instantiateViewController(identifier: "GroupFeedVC") as? GroupFeedVC else {return}
        groupFeed.getGroupData(forGroup: groupsArray[indexPath.row])
        present(groupFeed, animated: true, completion: nil)
    }
    
    
    
}

