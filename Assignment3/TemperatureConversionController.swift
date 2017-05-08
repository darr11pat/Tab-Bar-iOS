//
//  SecondViewController.swift
//  Assignment3
//
//  Created by Darshan Patil on 10/17/16.
//  Copyright © 2016 Darshan Patil. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask { return .All
    }
    @IBOutlet weak var temperaturePicker: UIPickerView!
    @IBOutlet weak var temperatureDisplayLabel: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var fahrenheitTOCelsius: Array<Int> = Array<Int>(-129...134)
    var celsiusTOFahrenheit: Array<Int> = Array<Int>(-90...57)
    var temp: Int = Int()
    var x: Int = Int()
    
    @IBAction func temperatureConverter(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            temp = fahrenheitTOCelsius[temperaturePicker.selectedRowInComponent(0)]
            temperatureDisplayLabel.text = String(format: "%.0d", Int(Double(temp - 32)/1.80)) + " ºC"
            break
        case 1:
            temp = celsiusTOFahrenheit[temperaturePicker.selectedRowInComponent(0)]
            temperatureDisplayLabel.text = String(format: "%.0d", Int((Double(temp) * 1.80) + 32)) + " ºF"
            break
        default:
            temp = fahrenheitTOCelsius[temperaturePicker.selectedRowInComponent(0)]
            temperatureDisplayLabel.text = String(format: "%.0d", Int(Double(temp - 32)/1.80)) + " ºC"
            break
        }
        temperaturePicker.reloadAllComponents()
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if segmentedControl.selectedSegmentIndex == 0 {
            return fahrenheitTOCelsius.count
        } else {
            return celsiusTOFahrenheit.count
        }
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if segmentedControl.selectedSegmentIndex == 0 {
            return String(fahrenheitTOCelsius[row]) + " ºF"
        } else {
            return String(celsiusTOFahrenheit[row]) + " ºC"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.temperaturePicker.delegate = self
        self.temperaturePicker.dataSource = self
        temperaturePicker.reloadAllComponents()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

