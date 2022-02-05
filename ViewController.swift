//
//  ViewController.swift
//  Prework
//
//  Created by Ada Pici on 2/4/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var yourTotal: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tipSlider.value = 0
        textLabel.text = String(tipSlider.value)
    }
    
    //get the initial bill amount and calculate the tips, calculate the total cost and update the tip and total labels
    @IBAction func calculateTip(_ sender: Any) {
        //get the bill amount from the text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        // get the total tip by multiplying tip * tip percentage
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        //update tip amount label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        //update total amount
        totalLabel.text = String(format: "$%.2f", total)
        let splitVal = Double(tipSlider.value)*100
        
        let splitTotal = (total) / splitVal
        
        
        yourTotal.text = String(format: "$%.2f", splitTotal)
    }
    //detect value changed
    @IBAction func sliderValueChange(_ sender: Any) {
        textLabel.text = String(format: "%.0f", tipSlider.value * 100)
        
        
    }
}

