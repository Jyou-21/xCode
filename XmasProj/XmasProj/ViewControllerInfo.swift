//
//  ViewControllerInfo.swift
//  XmasProj
//
//  Created by Jack Younger on 12/19/19.
//  Copyright © 2019 Jack Younger. All rights reserved.
//

import UIKit

class ViewControllerInfo: UIViewController {
    
    @IBOutlet weak var infoLabel: UILabel!
    
    var finalInfo: [String: Any] = [:]
    
    let noNos: Array<String> = ["\"","[","[","(",")"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var infoFormat = "\(finalInfo)"
        for noNo in noNos {
            infoFormat = infoFormat.replacingOccurrences(of: noNo, with: "", options: .literal, range: nil)
        }
        infoFormat = infoFormat.replacingOccurrences(of: ",", with: "\n", options: .literal, range: nil)
        
        infoFormat = infoFormat.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression)
        
        infoLabel.text = infoFormat
        
    }
    
}
