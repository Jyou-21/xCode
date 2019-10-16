//
//  ViewController.swift
//  pizzaPicker
//
//  Created by Jack Younger on 10/16/19.
//  Copyright © 2019 Jack Younger. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
  
    let pizzaFlavors = ["Hawaiian", "Pineapple", "Mozzarella", "Veggie", "Mancarella",]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pizzaFlavors[row]
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pizzaFlavors.count
    }
    
    @IBOutlet weak var pizzaView: UIPickerView!
    @IBOutlet weak var pizzaLabel: UILabel!
    
    
    @IBAction func didPressOrder(_ sender: UIButton) {
        let row = pizzaView.selectedRow(inComponent: 0)
        pizzaLabel.text = "You ordered: "+pizzaFlavors[row]
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

