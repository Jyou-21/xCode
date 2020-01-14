//
//  ViewController.swift
//  AppMemorizer
//
//  Created by Jack Younger on 1/7/20.
//  Copyright © 2020 Jack Younger. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var nameEntry: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let existingName: String? = try? String(contentsOf: getNameFileURL())
        greetingLabel.text = "Hello, \(existingName ?? "Newcomer")!"
    }
    
    func getNameFileURL() -> URL {
        let documentURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        return documentURL.appendingPathComponent("username.txt")
    }
    @IBAction func Remember(_ sender: Any) {
        let name = nameEntry.text!
        try! name.write(to: getNameFileURL(), atomically: true, encoding: .utf8)
        greetingLabel.text = "Sup, \(name)"
    }
    @IBAction func Forget(_ sender: Any) {
        try? FileManager.default.removeItem(at: getNameFileURL())
        greetingLabel.text = "Hello, stranger."
    }
    

}

