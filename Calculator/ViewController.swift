//
//  ViewController.swift
//  Calculator
//
//  Created by Jaden Jung on 2017. 10. 25..
//  Copyright © 2017년 Jaden Jung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTyping = false
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        print("\(digit) was called")
        
        if userIsInTheMiddleOfTyping {
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        }
        else {
            display.text = digit
            userIsInTheMiddleOfTyping = true
        }
    }
    
    var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }

    @IBAction func performOperation(_ sender: UIButton) {
        userIsInTheMiddleOfTyping = false
        if let mathematicalSymbol = sender.currentTitle {
            switch mathematicalSymbol {
            case "π":
                //display.text = String(Double.pi)
                displayValue = Double.pi
            case "√":
                //let operand = Double(display.text!)!
                //display.text = String(sqrt(operand))
                displayValue = sqrt(displayValue)
            default:
                break
            }
        }
    }
    
}

