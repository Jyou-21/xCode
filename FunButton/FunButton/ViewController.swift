//  ViewController.swift
//  FunButton
//
//  Created by Jack Younger on 2/11/20.
//  Copyright © 2020 Jack Younger. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var funkyButton: NamedButton!
    @IBOutlet weak var curiousButton: NamedButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        funkyButton.name = "Funky Button"
        curiousButton.name = "Curious Button"
        
        
        
    }

    @IBAction func buttonPress(_ sender: NamedButton) {
        let message:String
        if let sender = sender as?  NamedButton{
            message = "Hello, my name is \(sender.name)"
        }else{
            message = "Hello, I don't know who I am"
        }
        
        let alert = UIAlertController(title: "Pressed", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}


