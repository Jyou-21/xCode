//
//  ViewController.swift
//  ice Cream Picker
//
//  Created by Jack Younger on 10/21/19.
//  Copyright © 2019 Jack Younger. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return iceCreamFlavors.count
    }
    
    @IBOutlet weak var icePicker: UIPickerView!
    @IBOutlet weak var flavorLabel: UILabel!

    let iceCreamFlavors = ["Mint Chip", "Fudge", "Strawberry", "Vanilla Bean", "Mancarella"]
    let iceCreamPrices = [2.99,4.49,5.99,3.25,4.20]
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
              return iceCreamFlavors[row]
    }
    @IBAction func didPressOrder(_ sender: UIButton) {
        let row = icePicker.selectedRow(inComponent: 0)
            flavorLabel.text = "You ordered: "+iceCreamFlavors[row] + " - $" + String(iceCreamPrices[row])
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
