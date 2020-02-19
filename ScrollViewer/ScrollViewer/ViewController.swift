//
//  ViewController.swift
//  ScrollViewer
//
//  Created by Jack Younger on 2/12/20.
//  Copyright © 2020 Jack Younger. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for i in 1...50{
            let newButton = UIButton()
            newButton.setTitle("Button \(i)", for: .normal)
            newButton.setTitleColor(UIColor.black, for: .normal)
            newButton.addTarget(self, action: #selector(), for: <#T##UIControl.Event#>)
            newButton.frame = CGRect(x: 0, y: 0, width: 200, height: 30)
            stackView.addArrangedSubview(newButton)
        }
        stackView.frame = CGRect(x: 0, y: 0, width: 200, height: 30 * 50)
        scrollView.contentSize = CGSize(width: 200, height: 30 * 50)
    }


}

