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
    
    
    
    //MARK: - Push a user into the user's field.
    func createDBUser(uid: String, userData: Dictionary<String, Any>){
        REF_USERS.child(uid).updateChildValues(userData)
    }
    
    //MARK: - Convert UID to email
    func getEmail(forUID uid: String, handler: @escaping (_ username: String) -> ())  {
        REF_USERS.observeSingleEvent(of: .value) { (usersSnapshot) in
            guard let usersSnapshot = usersSnapshot.children.allObjects as? [DataSnapshot] else {return}
            for user in usersSnapshot {
                if user.key == uid {
                    handler(user.childSnapshot(forPath: "email").value as! String)
                }
            }
            
        }
    }
    
    //MARK: - Write post into the Firebase
    func uploadPost(withMessage message: String, forUID uid: String, withGroupKey groupKey: String?, sendComplete: @escaping (_ status: Bool) -> ()){
        
        if groupKey != nil {
            //send to group ref
        }
        else {
            //send to feed ref
            REF_FEED.childByAutoId().updateChildValues(["content" : message, "senderId": uid])
            sendComplete(true)
            
        }
        
    }
    
    //MARK: - Get all messages from Firebase and write them into the Model
    func getAllMessages(handler: @escaping (_ messages: [Message]) -> ()) {
        
        var messageArray = [Message]()
        
        //get all messages as [snapshot]
        REF_FEED.observeSingleEvent(of: .value) { (feedMessageSnapshot) in
            guard let feedMessageSnapshot = feedMessageSnapshot.children.allObjects as? [DataSnapshot] else {return}
            
        
            //go through all messages and append them into the messageArray
            for message in feedMessageSnapshot {
                let content = message.childSnapshot(forPath: "content").value as! String
                let senderId = message.childSnapshot(forPath: "senderId").value as! String
                let message = Message(content: content, senderID: senderId)
                messageArray.append(message)
            }
            
            handler(messageArray)
            
        }
        
    }
    
    //MARK: - Search through emails
    func getEmail(forSearchQuery query : String, handler: @escaping (_ emailArray : [String]) -> () ) {
        var emailArray = [String]()
        REF_USERS.observe(.value) { (usersSnapshot) in
            guard let userSnapshot = usersSnapshot.children.allObjects as? [DataSnapshot] else { return }
            for user in userSnapshot {
                let userEmail = user.childSnapshot(forPath: "email").value as! String
                
                if userEmail.contains(query) == true && userEmail != Auth.auth().currentUser?.email{
                    emailArray.append(userEmail)
                }
                
            }
            handler(emailArray)
        }
    }
    
    //MARK: - Get user id by email
    func getIds(forUsername username : [String], handler : @escaping(_ uidArray: [String]) -> () ){
        REF_USERS.observeSingleEvent(of: .value) { (usersSnapshot) in
            var idsArray = [String]()
            guard let userSnapshot = usersSnapshot.children.allObjects as? [DataSnapshot] else {return}
            for user in userSnapshot {
                let userEmail = user.childSnapshot(forPath: "email").value as! String
                if username.contains(userEmail){
                    idsArray.append(user.key)
                }
            }
            
            handler(idsArray)
        }
    }
    
    //MARK: - Create group
    func createGroup(withTitle title: String, withDescription description: String, ids: [String], handler: @escaping (_ groupCreated: Bool) -> ()){
        REF_GROUPS.childByAutoId().updateChildValues(["title" : title, "description" : description, "members" : ids])
        handler(true)
        
    }
    
    //MARK: - Get all groups from Firebase
    func getGroups(handler: @escaping (_ groupsArray: [Group]) -> ()){
        
        var groupsArray = [Group]()
        
        REF_GROUPS.observeSingleEvent(of: .value) { (groupSnapshot) in
            guard let grouppSnapshot = groupSnapshot.children.allObjects as? [DataSnapshot] else {return}
            
        
            //go through all groups and append them into the groupsArray
            for group in grouppSnapshot {
                let members = group.childSnapshot(forPath: "members").value as! [String]
                if(members.contains(Auth.auth().currentUser!.uid)){
                    let title = group.childSnapshot(forPath: "title").value as! String
                    let description = group.childSnapshot(forPath: "description").value as! String
                    //let senderId = group.childSnapshot(forPath: "senderId").value as! String
                    let membersCounter = members.count
                    let group = Group(title: title, description: description, members: members, senderID: group.key, membersCounter: membersCounter)
                    groupsArray.append(group)
                }
                
               
            }
            
            handler(groupsArray)
            
        }
        
    }
    
    //MARK: - Get emails for each group
    func getEmails(group: Group, handler: @escaping (_ emailArray: [String]) -> ()){
        var emailArray = [String]()
        REF_USERS.observeSingleEvent(of: .value) { (userSnapshot) in
            guard let userSnapshot = userSnapshot.children.allObjects as? [DataSnapshot] else {return}
            for user in userSnapshot {
                if group.members.contains(user.key){
                    let email = user.childSnapshot(forPath: "email").value as! String
                    emailArray.append(email)
                }
            }
            
            handler(emailArray)
        }
    }
    
}
