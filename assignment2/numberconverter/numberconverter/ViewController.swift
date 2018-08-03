//
//  ViewController.swift
//  numberconverter
//
//  Created by  on 3/4/17.
//  Copyright © 2017 vergil. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        numberSTepper.value = 100
        numberSTepper.maximumValue = 200
        numberSTepper.minimumValue = 0
        numberSTepper.wraps = true
        functionPicker.delegate = self
        functionPicker.dataSource = self
        answer1.isHidden = true
        answer2.isHidden = true
        answer3.isHidden = true
        answer4.isHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var numberField: UITextField!
    @IBOutlet weak var numberSTepper: UIStepper!
    @IBOutlet weak var functionPicker: UIPickerView!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var resetBUtton: UIButton!
    @IBOutlet weak var basePicker: UISegmentedControl!
    @IBOutlet weak var answer1: UILabel!
    @IBOutlet weak var answer2: UILabel!
    @IBOutlet weak var answer3: UILabel!
    @IBOutlet weak var answer4: UILabel!
    var curStep = 100
    var numberObject: Converter!
    var objectcreated = 0
    var prevBase = 0
    var curRow = 0
    var pickerPicked = 0
    
    @IBAction func numberChanged(_ sender: UITextField) {
        prevBase = basePicker.selectedSegmentIndex
        numberObject = Converter((numberField.text)!, prevBase)
    }
    
    let pickerData = ["Display in Binary", "Display in Decimal", "Display in Hex", "Display in Octal", "Display in all four bases"]
    
    @IBAction func baseChanged(_ sender: Any) {
        numberField.text = ""
    }
    
    @IBAction func stepperClicked(_ sender: UIStepper) {
        if (numberField.text == "" || numberField.text == nil){
            return
        }
        if(objectcreated == 0) {
            numberObject = Converter((numberField.text)!, (basePicker.selectedSegmentIndex))
            objectcreated = 1
        }
        if (Int(sender.value) > curStep) {
            numberField.text = numberObject.increment()
            curStep += 1
        }
        else {
            numberField.text = numberObject.decrement()
            curStep -= 1
        }
        if(pickerPicked == 1) {
            if(curRow == 0) {
                answer1.text = "Binary: " + numberObject.convertTo(2)
                answer1.isHidden = false
            }
            else if(curRow == 1) {
                answer1.text = "Decimal: " + numberObject.convertTo(10)
                answer1.isHidden = false
            }
            else if(curRow == 2) {
                answer1.text = "Hexadecimal: " + numberObject.convertTo(16)
                answer1.isHidden = false
            }
            else if(curRow == 3) {
                answer1.text = "Octal: " + numberObject.convertTo(8)
                answer1.isHidden = false
            }
            else {
                answer1.text = "Binary: " + numberObject.convertTo(2)
                answer2.text = "Octal: " + numberObject.convertTo(8)
                answer3.text = "Decimal: " + numberObject.convertTo(10)
                answer4.text = "Hexadecimal: " + numberObject.convertTo(16)
                answer1.isHidden = false
                answer2.isHidden = false
                answer3.isHidden = false
                answer4.isHidden = false
            }
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        curRow = row
        pickerPicked = 1
        answer1.isHidden = true
        answer2.isHidden = true
        answer3.isHidden = true
        answer4.isHidden = true
        if(numberField.text != "") {
            if(row == 0) {
                answer1.text = "Binary: " + numberObject.convertTo(2)
                answer1.isHidden = false
            }
            else if(row == 1) {
                answer1.text = "Decimal: " + numberObject.convertTo(10)
                answer1.isHidden = false
            }
            else if(row == 2) {
                answer1.text = "Hexadecimal: " + numberObject.convertTo(16)
                answer1.isHidden = false
            }
            else if(row == 3) {
                answer1.text = "Octal: " + numberObject.convertTo(8)
                answer1.isHidden = false
            }
            else {
                answer1.text = "Binary: " + numberObject.convertTo(2)
                answer2.text = "Octal: " + numberObject.convertTo(8)
                answer3.text = "Decimal: " + numberObject.convertTo(10)
                answer4.text = "Hexadecimal: " + numberObject.convertTo(16)
                answer1.isHidden = false
                answer2.isHidden = false
                answer3.isHidden = false
                answer4.isHidden = false
            }
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
}

