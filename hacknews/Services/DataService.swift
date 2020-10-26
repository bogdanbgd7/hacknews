//
//  DataService.swift
//  hacknews
//
//  Created by Bogdan Ponocko on 23/10/2020.
//  Copyright © 2020 Bogdan Ponocko. All rights reserved.
//

import Foundation
import Firebase

//constant for accessing firebase database
let DB_BASE = Database.database().reference()

class DataService{

    
    //Singleton class instance
    static let instance = DataService()
    
    //Encapsulation
    private var _REF_BASE = DB_BASE
    private var _REF_USERS = DB_BASE.child("users")
    private var _REF_GROUPS = DB_BASE.child("groups")
    private var _REF_FEED = DB_BASE.child("feed")
        
    
    var REF_BASE: DatabaseReference {
        
        return _REF_BASE
        
    }
    
    var REF_USERS: DatabaseReference{
        return _REF_USERS
    }
    
    var REF_GROUPS: DatabaseReference{
           return _REF_GROUPS
       }
    
    var REF_FEED: DatabaseReference{
           return _REF_FEED
       }
    
    
    
    //push a user into the user's field.
    func createDBUser(uid: String, userData: Dictionary<String, Any>){
        REF_USERS.child(uid).updateChildValues(userData)
    }
    
}
