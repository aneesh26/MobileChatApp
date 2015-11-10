//
//  ConnectionManager.swift
//  Chat
//
//  Created by Aneesh Shastry on 11/10/15.
//  Copyright © 2015 . All rights reserved.
//

import Foundation

class ConnectionManager: NSObject, NSURLSessionDelegate, NSURLSessionTaskDelegate {
    
    class func callChatServer(inputURL inputURL: String, inputParams: NSMutableDictionary,callType: String, completion: ((result:NSMutableDictionary?) -> Void)!){
        
        var requestURL:String = "http://localhost:8080/ChatApplication/test/message"
        
        let request = NSMutableURLRequest(URL: NSURL(string: requestURL)!)
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
                    var receivedData: Bool = false
                    let jsonStr = NSString(data: data!, encoding: NSUTF8StringEncoding)
                    let statusCode : Int = (response as? NSHTTPURLResponse)!.statusCode
                    
                    //print((response as? NSHTTPURLResponse)!.statusCode)
                    
                    if(receivedData == true){
                        let returnData : NSMutableDictionary = NSMutableDictionary()
                        do{
                            if(contentType == "application/json;charset=UTF-8" || contentType == "application/json"){
                                let receivedMap:NSDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as! NSDictionary
                                let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
                                    if(receivedMap.objectForKey("returnData") != nil){
                                        if let results = try receivedMap["returnData"]!.mutableCopy() as? NSMutableDictionary{
                                            returnData.setValue(results , forKey: "ReturnData")
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