//
//  Message.swift
//  hacknews
//
//  Created by Bogdan Ponocko on 09/11/2020.
//  Copyright © 2020 Bogdan Ponocko. All rights reserved.
//

import Foundation
import UIKit

class Message {
    
    //MARK: Private variables
    private var _content: String
    private var _senderID: String
    
    //MARK: Public variables
    var content: String {
        return _content
    }
    
    var senderID: String {
        return _senderID
    }
    
    //MARK: Initializer
    init(content: String, senderID: String) {
        
        self._content = content
        self._senderID = senderID
        
    }
    
    
    
}
