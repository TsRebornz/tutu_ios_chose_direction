//
//  DatePickerView.swift
//  tutu_ios_test
//
//  Created by Макаренков Антон Вячеславович on 15/04/16.
//  Copyright © 2016 Макаренков Антон Вячеславович. All rights reserved.
//

import Foundation
import UIKit


protocol DatePickerViewDelegate : class {
    func datePickerViewDelegate(controller : DatePickerView, sendStringDate stringDate: String  )
}

class DatePickerView: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    weak var delegate: DatePickerViewDelegate?
    
    override func viewDidLoad() {
        //send data to selectTableViewController
    }
    @IBAction func done() {                
        delegate?.datePickerViewDelegate(self, sendStringDate: getDateString())
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewWillAppear(animated: Bool) {
       super.viewWillAppear(animated)
       datePicker.becomeFirstResponder()
    }
    
    func getDateString() -> String{
        let dateFormatter = NSDateFormatter()
        
        dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        
        let strDate = dateFormatter.stringFromDate(self.datePicker.date)
        return strDate
    }
    
}
