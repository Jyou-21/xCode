//
//  ViewController.swift
//  jsonDecodeApp
//
//  Created by Riley John Gibbs on 12/3/19.
//  Copyright © 2019 Riley John Gibbs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var jsonFileData: Data?
    var jsonFileString: String?

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myLabel2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let fileUrl = Bundle.main.url(forResource: "data", withExtension: "json") {
            jsonFileData = try? Data(contentsOf: fileUrl)
            jsonFileString = try? String(contentsOf: fileUrl)
        }
        
        // This just puts the file contents (unparsed) into the label.
        if let string = jsonFileString {
            myLabel.text = string
        }
        
        if let data = jsonFileData {
            let json = try? JSONSerialization.jsonObject(with: data, options: [])
            let dictionary = json as! [String: Any]
            let species: String = dictionary["species"] as! String
            let known_Locations: [String] = dictionary["known_Locations"] as! [String]
            // myImage.image =
            let age: Int = dictionary["age"] as! Int
            myLabel.text = "Target Profile: \n" + "species: \(species) \n" + "age: \(age)"
            myLabel2.text = "Last Known Location: \(known_Locations[Int.random(in: 0 ... 3)])"
            
            // TODO: Parse the JSON data and display it in the app.
        
        }
        
    }

}

