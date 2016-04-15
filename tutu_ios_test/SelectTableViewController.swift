//
//  SelectTableViewController.swift
//  tutu_ios_test
//
//  Created by Макаренков Антон Вячеславович on 15/04/16.
//  Copyright © 2016 Макаренков Антон Вячеславович. All rights reserved.
//

import Foundation
import UIKit

class SelectTableViewController : UITableViewController {
    
    //@IBOutlet weak var datePickerCell: UITableViewCell?
    
    @IBOutlet weak var datePickerCell: UITableViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cellIdentifier = "Cell"
//        var cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as UITableViewCell?
//        if cell == nil {
//            cell = UITableViewCell(style: .Default , reuseIdentifier: cellIdentifier)
//        }
//        let newTest = "New singleton test"
//        DataSingleton.sharedInstance().setNewTest(newTest)
//        
//        let test = DataSingleton.sharedInstance().getTest()
//        
//        
//        cell!.textLabel?.text = test
//        return cell!
//    }
    
    
}
