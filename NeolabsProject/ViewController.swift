//
//  ViewController.swift
//  NeolabsProject
//
//  Created by Beks on 9/6/22.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Property
    
    var numberFromScreen: Double = 0;
    var firstNumFromScreen: Double = 0;
    var operation: Int = 0;
    var mathSign: Bool = false
    
    // MARK: - Outlets
    
    
    @IBOutlet var digitsButton: [UIButton]!
    @IBOutlet weak var result: UILabel!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        digitsButton.forEach { button in
            button.layer.cornerRadius = 15
            button.layer.masksToBounds = true
        }
    }
    
    // MARK: - Actions
    
    @IBAction func digits(_ sender: UIButton) {
        if mathSign == true {
            result.text = String(sender.tag)
            mathSign = false
        }
        else{
            result.text = result.text! + String(sender.tag)
        }
        
        numberFromScreen = Double(result.text!)!
        
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        if result.text != "" && sender.tag != 15 && sender.tag != 10{
            firstNumFromScreen = Double(result.text!)!
            
            if sender.tag == 11{
                result.text = "/"
            }
            else if sender.tag == 12{
                result.text = "x"
            }
            else if sender.tag == 13{
                result.text = "-"
            }
            else if sender.tag == 14{
                result.text = "+"
            }

            operation = sender.tag
            mathSign = true;
        }
        else if sender.tag == 15{
            if operation == 11{
                result.text = String(firstNumFromScreen / numberFromScreen)
            }
            else if operation == 12{
                result.text = String(firstNumFromScreen * numberFromScreen)
            }
            else if operation == 13{
                result.text = String(firstNumFromScreen - numberFromScreen)
            }
            else if operation == 14{
                result.text = String(firstNumFromScreen + numberFromScreen)
            }
        }
        else if sender.tag == 10{
            result.text = ""
            firstNumFromScreen = 0
            numberFromScreen = 0
            operation = 0
        }
    }
}

