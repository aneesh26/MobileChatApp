//
//  Message.swift
//  Chat
//
//  Created by Aneesh Shastry on 11/10/15.
//  Copyright © 2015 . All rights reserved.
//

import Foundation

class Message{
    var message: String = ""
    var sentTime: String
    var fromUser : User
    var toUser : User
    
    init(message:String,sentTime:String,fromUser:User,toUser:User){
        self.message = message
        self.sentTime = sentTime
        self.fromUser = fromUser
        self.toUser = toUser
    }
}
