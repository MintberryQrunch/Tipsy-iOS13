//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    //Dict of button labels with tip values
    let pctValues = ["0%" : 0.0, "10%" : 0.1, "20%": 0.2]
    //Initial value setting
    var selectedTip = 0.1
    var numberOfPersons = 1.0
    var sumPerPerson = 0.0
    
    //Changing value of the tip by selecting 1 of 3 buttons
    @IBAction func tipChanged(_ sender: UIButton) {
        //Making num pad disappear
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        //Chosing selected tip
        sender.isSelected = true
        if let currentTitle = sender.currentTitle {
            selectedTip = pctValues[currentTitle] ?? 0
        } else {
            print("Unexpected button title")
        }
    }
    
    //Selecting number of people to split the bill between
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPersons = sender.value
    }
    
    //Calculating and triggering segue
    @IBAction func calculatePressed(_ sender: UIButton) {
        if let billText = billTextField.text {
            if let billSum = Double(billText) {
                sumPerPerson = (billSum + billSum * selectedTip) / numberOfPersons
                sumPerPerson = round(sumPerPerson * 100) / 100
            } else {
                print("Unexpected symbols in the text field")
            }
        } else {
            print("Text field is empty")
        }
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.result = sumPerPerson
            destinationVC.split = Int(numberOfPersons)
            destinationVC.tip = Int(selectedTip * 100)
        }
    }
}

