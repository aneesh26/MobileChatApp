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
    var date: NSDate
    var fromUser : User
    var toUser : User
    
    init(message:String,date:NSDate,fromUser:User,toUser:User){
        self.message = message
        self.date = date
        self.fromUser = fromUser
        self.toUser = toUser
    }
}
