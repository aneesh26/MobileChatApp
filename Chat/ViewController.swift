//
//  ViewController.swift
//  Chat
//
//  Created by Aneesh Shastry on 11/4/15.
//  Copyright © 2015 . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView:UITableView!, numberOfRowsInSection section:Int) -> Int {
        return 10
    }
    
    func tableView(tableView:UITableView!, cellForRowAtIndexPath indexPath:NSIndexPath!) -> UITableViewCell! {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "viewCell")
        
        //        cell.text = "Row #\(indexPath.row)"
        //        cell.detailTextLabel.text = "Subtitle #\(indexPath.row)"
        
        cell.textLabel?.text = String(indexPath.row)
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "viewCell")
        
        cell.accessoryType = UITableViewCellAccessoryType.Checkmark
    }


}

