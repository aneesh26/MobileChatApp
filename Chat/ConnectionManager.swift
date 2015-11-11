//
//  ConnectionManager.swift
//  Chat
//
//  Created by Aneesh Shastry on 11/10/15.
//  Copyright © 2015 . All rights reserved.
//

import Foundation

class ConnectionManager: NSObject, NSURLSessionDelegate, NSURLSessionTaskDelegate {
    
    class func callChatServer(inputURL inputURL: String, inputParams: NSMutableDictionary, completion: ((result:NSMutableDictionary?) -> Void)!){
        
        //var requestURL:String = "http://localhost:8080/ChatApplication/test/message"
        print(inputURL)
        let request = NSMutableURLRequest(URL: NSURL(string: inputURL)!)
        var err: NSError?
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let config = NSURLSessionConfiguration()
        
        NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: { data, response, error -> Void in
            
            if (error != nil){
                print("Error in Response")
            }
            else {
            
                let test : NSHTTPURLResponse = (response as? NSHTTPURLResponse)!
                let contentType:String = (test.allHeaderFields["Content-Type"] as? String)!
                
        
                if ((data) != nil && response != nil) {
                    var didReceivedData: Bool = false
                    let jsonStr = NSString(data: data!, encoding: NSUTF8StringEncoding)
                    let statusCode : Int = (response as? NSHTTPURLResponse)!.statusCode
                    
                    print(statusCode)
                    print(jsonStr)
                    //print((response as? NSHTTPURLResponse)!.statusCode)
                    
                    if(statusCode == 200){
                        didReceivedData = true
                    }
                    
                    if(didReceivedData){
                        let returnData : NSMutableDictionary = NSMutableDictionary()
                        do{
                            if(contentType == "application/json;charset=UTF-8" || contentType == "application/json"){
                                let JSONData:NSDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as! NSDictionary
                                let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
                                    if(JSONData.objectForKey("serverData") != nil){
                                        if let results = try JSONData["serverData"]!.mutableCopy() as? NSMutableDictionary{
                                            returnData.setValue(results , forKey: "serverData")
                                        }
                                    }
                                }else{
                                //Invalid content
                            }
                        }
                        catch{
                            print(error)
                        }
                        
                        let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
                        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),{
                            dispatch_async(dispatch_get_main_queue(), {
                                completion(result: returnData)
                            })
                        })
                    }
                    
                }
                
            }
            
        }).resume()
        
    }
}