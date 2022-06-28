//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Konstantin on 05.06.2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var result = 0.0
    var tip = 1
    var split = 1
    
    override func viewDidLoad() {
        totalLabel.text = "\(result)"
        settingsLabel.text = "Split between \(split) people with \(tip)% tip"
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
