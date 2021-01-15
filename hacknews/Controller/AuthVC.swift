//
//  AuthVC.swift
//  hacknews
//
//  Created by Bogdan Ponocko on 27/10/2020.
//  Copyright © 2020 Bogdan Ponocko. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
import FBSDKLoginKit

class AuthVC: UIViewController, LoginButtonDelegate {
    
    //MARK: - Facebook Login Delegate methods
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        let token = result?.token?.tokenString
        
        let request = FBSDKLoginKit.GraphRequest(graphPath: "me",
                                                 parameters: ["fields" : "email, name"],
                                                 tokenString: token,
                                                 version: nil,
                                                 httpMethod: .get)
        request.start { (connection, result, error) in
            print("\(result)")
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        print("logged out")
    }
    
    
    //Outlets
    @IBOutlet weak var stackView: UIView!
    @IBOutlet weak var signInBTN: GIDSignInButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stackView.layer.cornerRadius = 17
        
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.signIn()
        
        //MARK: - Facebook Sign In
        if let token = AccessToken.current, !token.isExpired{
            //user is logged in, proceed to feed vc
            let token = token.tokenString
            
            let request = FBSDKLoginKit.GraphRequest(graphPath: "me",
                                                     parameters: ["fields" : "email, name"],
                                                     tokenString: token,
                                                     version: nil,
                                                     httpMethod: .get)
            request.start { (connection, result, error) in
                print("\(result)")
            }
            //asd
            let feedVC = storyboard?.instantiateViewController(withIdentifier: "FeedVC")
            present(feedVC!, animated: true, completion: nil)
            print("You are logged in.\nfacebook")
        } else {
            //show button for login
            let loginButton = FBLoginButton()
            loginButton.center = view.center
            loginButton.delegate = self
            loginButton.permissions = ["email", "public_profile"]
            view.addSubview(loginButton)
        }
      
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //if there IS a user
        if Auth.auth().currentUser != nil {
            dismiss(animated: true, completion: nil)
        }
        
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

