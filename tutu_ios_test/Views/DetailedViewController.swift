//
//  DetailedViewController.swift
//  tutu_ios_test
//
//  Created by Макаренков Антон Вячеславович on 11/05/16.
//  Copyright © 2016 Макаренков Антон Вячеславович. All rights reserved.
//

import Foundation
import UIKit



class DetailedViewController : UITableViewController {
    
    @IBOutlet weak var countryTitleCell: UITableViewCell!
    
    @IBOutlet weak var cityTitleCell: UITableViewCell!
    
    @IBOutlet weak var stationTitleCell: UITableViewCell!
    
    var station : Station?
    
    
    @IBAction func cancel(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let st = station{
            // st is now unwrapped value like station!
            self.countryTitleCell.textLabel?.text = st.cityRef?.countryTitle
            self.cityTitleCell.textLabel?.text = st.cityRef?.cityTitle
            self.stationTitleCell.textLabel?.text = st.stationTitle
        }
        
    }
    
}
