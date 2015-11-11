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
        
        let sender = User(name: "User1", status: "Available", contact: "12345678", email: "user1@chat.com")
        let receiver = User(name: "User1", status: "Available", contact: "12345678", email: "user1@chat.com")
        
        self.getDataFromServer()

        newMessage = Message(message: "This is a Test Message", sentTime: "10/10/2015", fromUser: sender, toUser: receiver)
        
        
    }
    
    func getDataFromServer(){
        
        let callURL = "http://localhost:8080/ChatApp/test/message"
        //let callURL = "https://localhost:8443/ChatApp/test/message"
        let requestData :NSMutableDictionary = NSMutableDictionary()
        
        ConnectionManager.callChatServer(inputURL: callURL, inputParams: requestData) { (returnData) -> Void in
          
            let returnDataValue = (returnData as NSMutableDictionary?)!
        //    resultSet.allKeys as NSArray).containsObject("connectionTimeOut")
            if((returnDataValue.allKeys as NSArray).containsObject("serverData" as String)){
                var serverData: NSMutableDictionary = returnDataValue.objectForKey("serverData") as! NSMutableDictionary;
                var messageData: NSMutableDictionary = serverData.objectForKey("message") as! NSMutableDictionary
                print (messageData)
                
                self.newMessage = self.decodeMessage(messageData) as Message
                
                self.messageTable.reloadData()
              //                self.newMessage = serverData.objectForKey("message") as! Message
            }
            
        }
        
    }
    
    func decodeMessage(jsonMessageData : NSMutableDictionary)  -> Message  {
       
        let tempMessage = jsonMessageData.objectForKey("message") as! String
        let tempSentTime = jsonMessageData.objectForKey("sentTime") as! String
        let tempFromUser = decodeUser(jsonMessageData.objectForKey("fromUser") as! NSMutableDictionary) as User
        let tempToUser = decodeUser(jsonMessageData.objectForKey("fromUser") as! NSMutableDictionary) as User
        
        let newMessage: Message = Message(message: tempMessage, sentTime: tempSentTime, fromUser: tempFromUser, toUser: tempToUser)
        
        return newMessage
    }
    
    func decodeUser(jsonUserData: NSMutableDictionary) -> User{
        let tempName = jsonUserData.objectForKey("name") as! String
        let tempStatus = jsonUserData.objectForKey("status") as! String
        let tempContact = jsonUserData.objectForKey("contact") as! String
        let tempEmail = jsonUserData.objectForKey("email") as! String
        
        let newUser:User = User(name: tempName, status: tempStatus, contact: tempContact, email: tempEmail)
        
        return newUser
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
