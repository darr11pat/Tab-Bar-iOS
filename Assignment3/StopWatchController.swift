//
//  FirstViewController.swift
//  Assignment3
//
//  Created by Darshan Patil on 10/17/16.
//  Copyright © 2016 Darshan Patil. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return .All
    }
    
    @IBOutlet weak var stopWatchDatePicker: UIDatePicker!
    @IBOutlet weak var timeDisplayLabel: UILabel!
    var timer = NSTimer()
    var hour = 0
    var minute = 0
    var second = 0
    var date = 0
    
    @IBAction func startAction(sender: AnyObject) {
        if date <= 0 {
         date = Int(stopWatchDatePicker.countDownDuration)
        }
        if timer.valid{
        } else {
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(decrementClock), userInfo: nil, repeats: true)
        }
    }
    
    @IBAction func pauseAction(sender: AnyObject) {
        if timer.valid {
            timer.invalidate()
        } else {
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(decrementClock), userInfo: nil, repeats: true)
        }
    }
    @IBAction func StopAction(sender: AnyObject) {
        timer.invalidate()
        minute = 0
        second = 0
        hour = 0
        date = 0
        timeDisplayLabel.text = String(format: "%02d:%02d", minute, second);
    }
    
    func decrementClock() {
        if(date > 0 ) {
            hour = date / 3600
            minute = (date % 3600) / 60
            second = (date % 3600) % 60
            if hour > 0 {
                timeDisplayLabel.text = String(format: "%02d:%02d:%02d", hour, minute, second)
            }
            else {
                timeDisplayLabel.text = String(format: "%02d:%02d", minute, second)
            }
            date -= 1
        } else {
            timer.invalidate()
        }
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

