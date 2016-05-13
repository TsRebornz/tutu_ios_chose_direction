//
//  SelectTableViewController.swift
//  tutu_ios_test
//
//  Created by Макаренков Антон Вячеславович on 15/04/16.
//  Copyright © 2016 Макаренков Антон Вячеславович. All rights reserved.
//

import Foundation
import UIKit

class SelectTableViewController : UITableViewController, DatePickerViewDelegate {
    
    //@IBOutlet weak var datePickerCell: UITableViewCell?
    
    @IBOutlet weak var datePickerCell: UITableViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func datePickerViewDelegate(controller: DatePickerView, sendStringDate stringDate: String) {
        datePickerCell.textLabel?.text = stringDate
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // sender parameter contains a reference to the control that triggered the segue
        let navigationController = segue.destinationViewController as! UINavigationController
        if (segue.identifier == "datePickerSeg"){
                let datePickerController = navigationController.topViewController as! DatePickerView
                datePickerController.delegate = self
        }
//        else if(segue.identifier == "datePickerSeg"){
//                let scheduleTableViewController = navigationController.topViewController as! ScheduleTableViewController
//        }
        
        
        
        
//        if segue.identifier == "AddItem" {
//            let navigationController = segue.destinationViewController as! UINavigationController
//            let controller = navigationController.topViewController as! DetailedViewTableViewController
//            controller.delegate = self
//            
//        }else if segue.identifier == "EditItem"{
//            let navigationController = segue.destinationViewController as! UINavigationController
//            let controller = navigationController.topViewController as! DetailedViewTableViewController
//            controller.delegate = self
//            
//            if let indexPath = tableView.indexPathForCell(sender as! UITableViewCell){
//                controller.editItem = items[indexPath.row]
//            }
//        }
    }

    
    
}
