//
//  ViewControllerMain.swift
//  XmasProj
//
//  Created by Jack Younger on 12/19/19.
//  Copyright © 2019 Jack Younger. All rights reserved.
//

import UIKit

class ViewControllerMain: UIViewController {
    
    var buttonChoice: String = ""
    
    @IBAction func clickPeople(_ sender: Any) {
        buttonChoice = getArray(buttonChoice:"people")
    }
    @IBAction func clickFilms(_ sender: Any) {
        buttonChoice = getArray(buttonChoice:"films")
    }
    @IBAction func clickStarships(_ sender: Any) {
       buttonChoice = getArray(buttonChoice:"starships")
    }
    @IBAction func clickVehicles(_ sender: Any) {
        buttonChoice = getArray(buttonChoice:"vehicles")
    }
    @IBAction func clickSpecies(_ sender: Any) {
       buttonChoice = getArray(buttonChoice:"species")
    }
    @IBAction func clickPlanets(_ sender: Any) {
        buttonChoice = getArray(buttonChoice:"planets")
    }
    
    var nameArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func getArray (buttonChoice: String) -> String {
        nameArray = [String]()
        let url: URL = URL(string: "https://swapi.co/api/" + "\(buttonChoice)")!
        let responseData: Data? = try? Data(contentsOf: url)
        let json: Any = try! JSONSerialization.jsonObject(with: responseData!, options: [])
        let dictionary: [String: Any] = json as! [String: Any]
        let results: Array = dictionary["results"] as! Array<[String: Any]>
        for item in results {
            if buttonChoice != "films" {
            nameArray.append(item["name"] as! String)
            } else {
                nameArray.append(item["title"] as! String)
            }
        }
        return buttonChoice
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "transferNames"){
            let displayVC = segue.destination as! TableViewController
            displayVC.nameArray = nameArray
            displayVC.buttonChoice = buttonChoice
        }
        
    }
}
