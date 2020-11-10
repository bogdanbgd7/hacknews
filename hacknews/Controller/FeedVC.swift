//
//  FeedVC.swift
//  hacknews
//
//  Created by Bogdan Ponocko on 23/10/2020.
//  Copyright © 2020 Bogdan Ponocko. All rights reserved.
//

import UIKit

class FeedVC: UIViewController {
    
    
    //MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    

    var messageArray = [Message]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tableView delegates
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        DataService.instance.getAllMessages { (returnedMessagesArray) in
            self.messageArray = returnedMessagesArray
            self.tableView.reloadData()
        }
    }
    

}

extension FeedVC: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell") as? FeedCell else { return UITableViewCell() }

        let image = UIImage(named: "first")
        let message = messageArray[indexPath.row]

        cell.configureCell(profileImage: image!, email: message.senderID, content: message.content)

        return cell
    }

}

