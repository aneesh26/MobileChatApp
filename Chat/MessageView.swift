//
//  MessageView.swift
//  Chat
//
//  Created by Aneesh Shastry on 11/8/15.
//  Copyright © 2015 . All rights reserved.
//

import UIKit

class MessageView: UITableViewController {
    
    @IBOutlet var messageTable: UITableView!
    
    var newMessage:Message!
    
    override func viewDidLoad() {
        
        let sender = User(name: "User1", status: "Available", contact: 12345678, email: "user1@chat.com")
        let receiver = User(name: "User1", status: "Available", contact: 12345678, email: "user1@chat.com")

        newMessage = Message(message: "This is a Test Message", date: NSDate(), fromUser: sender, toUser: receiver)
        
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.messageTable.dequeueReusableCellWithIdentifier("viewCell") as UITableViewCell?


        cell?.textLabel?.text = self.newMessage.message
        
        return cell!
    }
    
  
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5;
    }
    
    

}
