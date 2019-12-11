//
//  ViewController.swift
//  SWapi
//
//  Created by Jack Younger on 12/11/19.
//  Copyright © 2019 Jack Younger. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var Label1: UILabel!
    
    @IBAction func pressButton(_ sender: Any) {
        let url: URL = URL(string: "https://swapi.co/api/people/1/")!
        let responseData: Data? = try? Data(contentsOf: url)
        if let responseData = responseData {
            let json: Any = try! JSONSerialization.jsonObject(with: responseData, options: [])
            let dictionary: [String: Any] = json as! [String: Any]
            let name: String = dictionary["name"] as! String
            Label1.text = name
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

