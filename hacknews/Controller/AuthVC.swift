//
//  AuthVC.swift
//  hacknews
//
//  Created by Bogdan Ponocko on 27/10/2020.
//  Copyright © 2020 Bogdan Ponocko. All rights reserved.
//

import UIKit

class AuthVC: UIViewController {
    
    //Outlets
    @IBOutlet weak var stackView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stackView.layer.cornerRadius = 17
       
    }
    
    
    //Button Actions
    @IBAction func signInWithFacebookButtonPressed(_ sender: Any) {
    }
    
    @IBAction func signInWithGoogleButtonPressed(_ sender: Any) {
    }
    
    
    @IBAction func signInWithEmailButtonPressed(_ sender: Any) {
        
        let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginVC")
        present(loginVC!, animated: true, completion: nil)
    }
    
    
    

}
