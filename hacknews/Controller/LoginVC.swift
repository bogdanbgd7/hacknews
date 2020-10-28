//
//  LoginVC.swift
//  hacknews
//
//  Created by Bogdan Ponocko on 27/10/2020.
//  Copyright © 2020 Bogdan Ponocko. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    
    //Outlets
    
    @IBOutlet weak var usernameTextField: RoundedTextField!
    @IBOutlet weak var passwordTextField: RoundedTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Rounded textfields programatically
        usernameTextField.layer.cornerRadius = 12
        passwordTextField.layer.cornerRadius = 12
    
    }
    
    //Actions
    @IBAction func closeButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signInButtonPressed(_ sender: Any) {
        
        if usernameTextField.text != nil && passwordTextField.text != nil {
            
            AuthService.instance.loginUser(withEmail: usernameTextField.text!, andPassword: passwordTextField.text!) { (success, loginError) in
                if success {
                    self.dismiss(animated: true, completion: nil)
                    print("Great! You've logged in!")
                }
                else {
                    print(String(describing: loginError?.localizedDescription))
                }
                
                //if user doesn't have an account, register with credentials that have been prompt
                
                AuthService.instance.registerUser(withEmail: self.usernameTextField.text!, andPassword: self.passwordTextField.text!) { (success, registrationError) in
                    if success {
                        AuthService.instance.loginUser(withEmail: self.usernameTextField.text!, andPassword: self.passwordTextField.text!) { (success, nil) in
                            self.dismiss(animated: true, completion: nil)
                            print("Created account and signed in!")
                        }
                    }
                }
            }
            
        }
        
        else {
            
            if usernameTextField.text == "" {
                       
                       print("YOU MUST FILL THE FIELDS!!!")
                       
                       usernameTextField.shake()
                       
                   }
                   else if passwordTextField.text == ""{
                       
                       print("YOU MUST FILL THE FIELDS!!!")
                       
                       passwordTextField.shake()
                       
                   }
            
        }
        
       
        
    }
    

}










//Shake animation
extension UIView {
    func shake(){
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 3
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 10, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 10, y: self.center.y))
        self.layer.add(animation, forKey: "position")
    }
}




















 

extension UITextField {
    @IBInspectable var placeholderColor: UIColor {
        get {
            return attributedPlaceholder?.attribute(.foregroundColor, at: 0, effectiveRange: nil) as? UIColor ?? .clear
        }
        set {
            guard let attributedPlaceholder = attributedPlaceholder else { return }
            let attributes: [NSAttributedString.Key: UIColor] = [.foregroundColor: newValue]
            self.attributedPlaceholder = NSAttributedString(string: attributedPlaceholder.string, attributes: attributes)
        }
    }
    
    
}
