//
//  ThirdViewController.swift
//  Assignment3
//
//  Created by Darshan Patil on 10/17/16.
//  Copyright © 2016 Darshan Patil. All rights reserved.
//

import UIKit

class TimeIntervalController: UIViewController {
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask { return .All
    }
    
    @IBOutlet weak var datePicker1: UIDatePicker!                                       // date picker for selecting the first date of the time interval
    @IBOutlet weak var datePicker2: UIDatePicker!                                       // date picker for selecting the second date of the time interval
    @IBOutlet weak var displayLabel: UILabel!                                           // label for display the time interval
    
    @IBAction func dateSelector(sender: UIDatePicker) {                                 // datepicker action to check and set the minimum date and maximum date
        if sender == datePicker1 {                                                      // check if date picker is datepicker1
            datePicker2.minimumDate = datePicker1.date                                  // assign datepicker1 date as minimum to datepicker2
        } else if sender == datePicker2 {                                               // check if date picker is datepicker1
            datePicker1.maximumDate = datePicker2.date                                  // assign datepicker2 date as maximum to datepicker1
        }
    }
    
    @IBAction func computeIntervalButton(sender: AnyObject) {                           // button action to compute the time interval
        let initialDate = datePicker1.date                                              // get the value from first date picker
        let finalDate = datePicker2.date                                                // get the value from second date picker
        
        var sec = 0.0
        sec = CFDateGetTimeIntervalSinceDate(finalDate, initialDate)                    // calculate the time interval
        let temp = Int(round(sec/86400.0))                                              // convert the seconds to days and round it to nearst day
        displayLabel.text = String(temp) + " days!"                                     // display the day to the label
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
