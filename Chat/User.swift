//
//  User.swift
//  Chat
//
//  Created by Aneesh Shastry on 11/10/15.
//  Copyright © 2015 . All rights reserved.
//

import Foundation

class User:NSObject{
    var name:String
    var status:String
    var contact:String
    var email:String
    
    init(name:String,status:String,contact:String,email:String){
        self.name = name
        self.status = status
        self.contact = contact
        self.email = email
    }
    
   
}