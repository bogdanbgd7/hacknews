//
//  GroupsVC.swift
//  hacknews
//
//  Created by Bogdan Ponocko on 23/10/2020.
//  Copyright © 2020 Bogdan Ponocko. All rights reserved.
//

import UIKit

class GroupsVC: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var tableVIew: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableVIew.delegate = self
        tableVIew.dataSource = self
        
        
    }

}

extension GroupsVC: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
    
}

