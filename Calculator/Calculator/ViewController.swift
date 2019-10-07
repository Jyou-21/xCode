//
//  ViewController.swift
//  Calculator
//
//  Created by Jack Younger on 10/7/19.
//  Copyright © 2019 Jack Younger. All rights reserved.
//

import UIKit
enum modes {
    case not_set
    case addition
    case subtraction
    case multiplication
}
class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    var labelString:String = "0"
    var currentMode:modes = .not_set
    var savedNum:Int = 0
    var lastButtonWasMode:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func didPressNumber(_ sender: UIButton) {let stringValue:String? = sender.titleLabel?.text
        
        labelString = labelString.appending(stringValue!)
        updateText()
    }
    func updateText() {
        guard let labelInt:Int = Int(labelString)else {
            return
        }
        if(currentMode == .not_set) {
            savedNum = labelInt
        }
        label.text = "\(labelInt)"
    }
    

}

