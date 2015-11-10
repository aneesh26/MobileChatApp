//
//  User.swift
//  Chat
//
//  Created by Aneesh Shastry on 11/10/15.
//  Copyright © 2015 Epifinder. All rights reserved.
//

import Foundation

class User{
    var name:String
    var status:String
    var contact:Int64
    var email:String
    
    init(name:String,status:String,contact:Int64,email:String){
        self.name = name
        self.status = status
        self.contact = contact
        self.email = email
    }
    
}