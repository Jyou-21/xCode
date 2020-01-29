//
//  ViewController.swift
//  wishlist
//
//  Created by Jack Younger on 1/23/20.
//  Copyright © 2020 Jack Younger. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentnote: Note?
    
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var note: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        date.text = "\(currentnote!.date)"
        note.text = "\(currentnote!.note)"

        // Do any additional setup after loading the view.
    }
    override func viewWillDisappear(_ animated: Bool) {
        currentnote?.note = note.text!
    }
}
