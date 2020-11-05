//
//  ViewController.swift
//  Tipsy
//
//  Created by MAC on 10.10.2020.
//  Copyright © 2020 Litmax. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentTip: Double!
    var result: Double!
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var tenButton: UIButton!
    @IBOutlet weak var twentyButton: UIButton!
    
    @IBOutlet weak var peopleLabel: UILabel!
    @IBOutlet weak var peopleStepper: UIStepper!
    
    @IBAction func actionSteper(_ sender: UIStepper) {
        peopleLabel.text = Int(sender.value).description
        textField.endEditing(true)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let money = Double(textField.text!)!

        result = (money + money * currentTip / 100) / peopleStepper.value

        
        
        performSegue(withIdentifier: "segue", sender: self)
    }
    
    @IBAction func tipButtonPressed(_ sender: UIButton) {
        
        switch sender.currentTitle {
        case "0%":
            currentTip = 0
            resetButtons()
            zeroButton.isSelected = true
        case "10%":
            currentTip = 10
            resetButtons()
            tenButton.isSelected = true
        case "20%":
            currentTip = 20
            resetButtons()
            twentyButton.isSelected = true
        default:
            print("Error")
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue" {
            let resultVC = segue.destination as? ResultViewController
            
            resultVC?.count = peopleStepper.value
            resultVC?.tip = currentTip
            resultVC?.result = result
            
        }
    }
    
    private func resetButtons() {
        
        zeroButton.isSelected = false
        tenButton.isSelected = false
        twentyButton.isSelected = false
        
        textField.endEditing(true)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

