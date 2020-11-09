//
//  CreatePostVC.swift
//  hacknews
//
//  Created by Bogdan Ponocko on 09/11/2020.
//  Copyright © 2020 Bogdan Ponocko. All rights reserved.
//

import UIKit
import Firebase

class CreatePostVC: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var textView: CustomTextView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var postButton: RoundButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Delegates
        textView.delegate = self
        
        
    }
    
    //MARK: Actions
    @IBAction func closeButtonPressed(_ sender: Any) {
        
        self.dismiss(animated: true) {
            print("You have just clicked close button")
        }
    }
    
    
    @IBAction func createPostBtnPressed(_ sender: Any) {
        
        if textView.text != nil && textView.text != "say something clever..." {
            
            postButton.isEnabled = false
            
            DataService.instance.uploadPost(withMessage: textView.text, forUID: Auth.auth().currentUser!.uid, withGroupKey: nil) { (true) in
                if true {
                    print("Good Job! Message sent successfuly!")
                    self.dismiss(animated: true, completion: nil)
                    
                }
                else {
                    print("There was an error. Please contact support.")
                    
                    
                }
            }
                
            }
            
        }
        
    }
    





//MARK: Extensions
extension CreatePostVC: UITextViewDelegate{
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
    }
    
}
