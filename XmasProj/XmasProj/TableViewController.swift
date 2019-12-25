//
//  TableViewController.swift
//  XmasProj
//
//  Created by Jack Younger on 12/19/19.
//  Copyright © 2019 Jack Younger. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var nameArray: Array<String> = []
    var buttonChoice: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameArray = Array(nameArray).sorted()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let title = nameArray[indexPath.row]
        cell.textLabel!.text = title
        return cell
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ViewControllerInfo
        let indexPath = self.tableView.indexPathForSelectedRow
        var name = self.nameArray[indexPath!.row]
        name = name.replacingOccurrences(of: " ", with: "%20", options: .literal, range: nil)
        
        let url: URL = URL(string: "https://swapi.co/api/" + "\(buttonChoice)" + "?search=" + "\(name)")!
        let responseData: Data? = try? Data(contentsOf: url)
        let json: Any = try! JSONSerialization.jsonObject(with: responseData!, options: [])
        let dictionary: [String: Any] = json as! [String: Any]
        let results: Array = dictionary["results"] as! Array<[String: Any]>
        
        vc.finalInfo = results.first!
    }
    

}
