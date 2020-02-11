//
//  ViewController.swift
//  Dynamic Buttons
//
//  Created by Jack Younger on 2/7/20.
//  Copyright © 2020 Jack Younger. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func showAlert(){
        let alert = UIAlertController(title: "Hey! Listen", message: "Its dangerous out there.  Take this.", preferredStyle: .alert)
        self.present(alert, animated: true, completion: {})
    }


}

