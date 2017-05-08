//
//  SecondViewController.swift
//  Assignment3
//
//  Created by Darshan Patil on 10/17/16.
//  Copyright © 2016 Darshan Patil. All rights reserved.
//

import UIKit

class TemperatureConversionController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask { return .All
    }
    
    @IBOutlet weak var temperaturePicker: UIPickerView!                                                          // picker view property
    @IBOutlet weak var temperatureDisplayLabel: UILabel!                                                         // label property to display the conversion
    @IBOutlet weak var segmentedControl: UISegmentedControl!                                                     // segmented control to check which conversion is expected
    
    var fahrenheitTOCelsius: Array<Int> = Array<Int>(-129...134)                                                 // fahrenheit temperature values stored in a integer array
    var celsiusTOFahrenheit: Array<Int> = Array<Int>(-90...57)                                                   // celsius temperature values stored in a integer array
    var temp: Int = Int()                                                                                        // temporary variable to store the value selected in date picker
    
    @IBAction func temperatureConverter(sender: UISegmentedControl) {                                            // segmented control action to change the view and display
        calculation()                                                                                            // calling the calculation function which calculates the conversion and displays
        temperaturePicker.reloadAllComponents()                                                                  // reloads all components of date picker
    }
    
    func calculation() {                                                                                         // calculation function to calcualte the conversion based on segmented control selected
        if segmentedControl.selectedSegmentIndex == 0 {                                                          // check if first segmented control is selected
            temp = fahrenheitTOCelsius[temperaturePicker.selectedRowInComponent(0)]                              // get the current datepicker value
            temperatureDisplayLabel.text = String(format: "%.0d", Int(Double(temp - 32)/1.80)) + " ºC"           // convert it to celsius
        } else {
            temp = celsiusTOFahrenheit[temperaturePicker.selectedRowInComponent(0)]                              // get the current datepicker value
            temperatureDisplayLabel.text = String(format: "%.0d", Int((Double(temp) * 1.80) + 32)) + " ºF"       // convert it to celsius
        }
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {                                      // returns the number of components in picker view
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {                  // returns the number of rows in date picker
        if segmentedControl.selectedSegmentIndex == 0 {                                                         // check if first segmented control is selected
            return fahrenheitTOCelsius.count                                                                    // returns the fahrenheit array count
        } else {
            return celsiusTOFahrenheit.count                                                                    // returns the celsius array count
        }
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {   // sets the values in the date picker
        if segmentedControl.selectedSegmentIndex == 0 {                                                         // check if first segmented control is selected
            return String(fahrenheitTOCelsius[row]) + " ºF"                                                     // set fahrenhiet array values to date picker
        } else {
            return String(celsiusTOFahrenheit[row]) + " ºC"                                                     // set celsius array values to date picker
        }
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {              // didsetrow; calls calculation function each time the datepicker is scrolled
        calculation()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.temperaturePicker.delegate = self
        self.temperaturePicker.dataSource = self
        calculation()                                                                                            // calling calculation to set the initial value
        temperaturePicker.reloadAllComponents()                                                                  // reloads all components of date picker
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

