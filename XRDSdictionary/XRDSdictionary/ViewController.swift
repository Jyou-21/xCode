//
//  ViewController.swift
//  XRDSdictionary
//
//  Created by Jack Younger on 11/5/19.
//  Copyright © 2019 Jack Younger. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    @IBOutlet weak var defLabel: UILabel!
    
    var vocabWord: String = ""
    var vocabDefinition: String? = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defLabel.text = vocabDefinition
        
    }
    
}
