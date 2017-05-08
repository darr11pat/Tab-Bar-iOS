//
//  FirstViewController.swift
//  Assignment3
//
//  Created by Darshan Patil on 10/17/16.
//  Copyright © 2016 Darshan Patil. All rights reserved.
//

import UIKit

class StopWatchController: UIViewController {
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {              // upside down orientation
        return .All
    }
    
    @IBOutlet weak var stopBarButton: UIBarButtonItem!                                          // uibarbutton to stop the timer
    @IBOutlet weak var pauseBarButton: UIBarButtonItem!                                         // uibarbutton to pause the timer
    @IBOutlet weak var startBarButton: UIBarButtonItem!                                         // uibarbutton to start the timer
    
    @IBOutlet weak var stopWatchDatePicker: UIDatePicker!                                       // uidatepicker to get the value selected by user
    @IBOutlet weak var timeDisplayLabel: UILabel!                                               // label to display the count down timer

    var timer = NSTimer()                                                                       // timer property to start scheduled time interval
    var hour = 0                                                                                // property to store hour value after computation
    var minute = 0                                                                              // property to store minute value after computation
    var second = 0                                                                              // property to store second value after computation
    var date = 0                                                                                // property to store initial value of datepicker
    
    @IBAction func startAction(sender: AnyObject) {                                             // start action method; activates when start barbutton is clicked
        if date <= 0 {                                                                          // check if the date is 0; so that it does not take new time when the datepicker is changed
         date = Int(stopWatchDatePicker.countDownDuration)                                      // get the countdownduration from the datepicker into date property
         print(date)
        }
        if timer.valid{                                                                         // check whether the timer is valid so that a new timer thread is not created if exists
        } else {
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(decrementClock), userInfo: nil, repeats: true)      // creating nstimer instance
        }
        startBarButton.enabled = false                                                          // set start button to false to disable the button
        pauseBarButton.enabled = true                                                           // set pause button to enable the button
        stopBarButton.enabled = true                                                           // set stop button to enable the button
    }
    
    @IBAction func pauseAction(sender: AnyObject) {                                             // pause action method; temporary termination of timer
        if timer.valid {
            timer.invalidate()                                                                  // invalidate the timer
            startBarButton.enabled = true                                                       // set start button to true to enable the button
            
        } else {
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(decrementClock), userInfo: nil, repeats: true)  // recreate the nstimer thread
            startBarButton.enabled = false                                                      // set start button to false to enable the button
        }
    }
    @IBAction func StopAction(sender: AnyObject) {                                             // stop action method; stops the timer
        timer.invalidate()
        minute = 0                                                                             // timer stopped so re-initialize values
        second = 0
        hour = 0
        date = 0
        timeDisplayLabel.text = String(format: "%02d:%02d", minute, second);                    // formatted display of minute and seconds
        stopBarButton.enabled = false                                                           // set stop button to false to disable the button
        pauseBarButton.enabled = false                                                          // set pause button to true to disable the button
        startBarButton.enabled = true                                                           // set start button to true to enable the button
    }
    
    func decrementClock() {                                                                     // decrement clock function where the clock is decremented
        if(date > 0 ) {
            hour = date / 3600                                                                  // calculate hour
            minute = (date % 3600) / 60                                                         // calculate minute
            second = (date % 3600) % 60                                                         // calculate seconds
            if hour > 0 {                                                                       // check if hour exits to make the display different
                timeDisplayLabel.text = String(format: "%02d:%02d:%02d", hour, minute, second)  // formatted hour minute seconds display
            }
            else {
                timeDisplayLabel.text = String(format: "%02d:%02d", minute, second)             // formatted minute seconds display
            }
            date -= 1                                                                           // decrement the timer
        } else {
            timer.invalidate()                                                                  // invalidate the timer if date is less than 1
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        stopBarButton.enabled = false                                                           // set stop button to false to disable the button
        pauseBarButton.enabled = false                                                          // set pause button to true to disable the button
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

