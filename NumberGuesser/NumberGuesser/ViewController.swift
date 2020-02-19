//
//  ViewController.swift
//  NumberGuesser
//
//  Created by Jack Younger on 2/18/20.
//  Copyright © 2020 Jack Younger. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var labelRange: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var informant: UILabel!
    
    var range = [Int]()
    var answer: Int = 0
    var currentGuess: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.text = "3"
        // Do any additional setup after loading the view.
    }
    
    @objc func buttonClicked(sender: correctButton){
        if sender.guess > answer {
            informant.text = "Lower!"
        }else if sender.guess < answer {
            informant.text = "Higher!"
        }else{
            informant.text = "It was \(sender.guess)!"
        }
    }

    @IBAction func pressEnter(_ sender: UIButton) {
        if boxCheck(input: textField.text ?? "3") == false {
            labelRange.text = "Must be a value <= 3"
        }else{
            range = [Int]()
            range += 1...Int(textField.text!)!
            answer = range.randomElement()!
            for i in range{
                let newButton = correctButton()
                newButton.setTitle("Guess \(i)", for: .normal)
                newButton.setTitleColor(UIColor.black, for: .normal)
                newButton.guess = i
                newButton.addTarget(self, action: #selector(self.buttonClicked(sender:)), for: .touchUpInside)
                newButton.frame = CGRect(x: 0, y: 0, width: 300, height: 30)
                stackView.addArrangedSubview(newButton)
            }
            stackView.frame = CGRect(x: 0, y: 0, width: 300, height: 34 * range.count)
            scrollView.contentSize = CGSize(width: 300, height: 34 * range.count)
        }
        
    }
    
    func boxCheck(input:String) -> Bool {
        var val = Int(input)
        if val == nil {
            return false}
        val = val!
        if val! <= 2 {
            return false}
        return true
    }
    
}

