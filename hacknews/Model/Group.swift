//
//  Group.swift
//  hacknews
//
//  Created by Bogdan Ponocko on 15.11.20..
//  Copyright © 2020 Bogdan Ponocko. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class Group {
    
    //MARK: - Private variables
    private var _title: String
    private var _description: String
    private var _members: [String]
    private var _membersCounter: Int
    private var _senderID: String
    
    //MARK: - Public variables
    var title: String {
        return _title
    }
    
    var senderID: String {
        return _senderID
    }
    
    var description: String {
        return _description
    }
    
    var members: [String] {
        return _members
    }
    
    var membersCounter: Int {
        return _membersCounter
    }
    
    //MARK: - Initializer
    init(title: String, description: String, members: [String], senderID: String, membersCounter: Int) {
        
        self._title = title
        self._senderID = senderID
        self._description = description
        self._membersCounter = membersCounter
        self._members = members
        
    }
    
}
