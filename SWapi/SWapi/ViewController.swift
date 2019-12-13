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
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var Submit: UIButton!
    
        
    @IBAction func pressSubmit(_ sender: Any) {
        let film = Int(textField.text!) ?? 1
        let url: URL = URL(string: "https://swapi.co/api/films/" + "\(film)" + "/")!
   let responseData: Data? = try? Data(contentsOf: url)
   if let responseData = responseData {
    let json: Any = try! JSONSerialization.jsonObject(with: responseData, options: [])
    let dictionary: [String: Any] = json as! [String: Any]
    let title: String = dictionary["title"] as! String
    let episode_id: Int = dictionary["episode_id"] as! Int
    Label1.text = " Episode \(episode_id):" + "\n\(title)"
    }
}
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
