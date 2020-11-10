//
//  ProfileVC.swift
//  hacknews
//
//  Created by Bogdan Ponocko on 04/11/2020.
//  Copyright © 2020 Bogdan Ponocko. All rights reserved.
//

import UIKit
import Firebase

class ProfileVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    //MARK: - Outlets
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Actions
    
    @IBAction func logoutButtonPressed(_ sender: Any) {
        
        let popup = UIAlertController(title: "logout?", message: "wanna logout?", preferredStyle: .actionSheet)
        let logoutAction = UIAlertAction(title: "logout", style: .destructive) { (action) in
            do {
                try Auth.auth().signOut()
                let authVC = self.storyboard?.instantiateViewController(identifier: "AuthVC") as? AuthVC
                self.present(authVC!, animated: true, completion: nil)
            }
            catch {
                print(error)
            }
            
        }
        
        popup.addAction(logoutAction)
        present(popup, animated: true, completion: nil)
        
    }
    
    
    


}
