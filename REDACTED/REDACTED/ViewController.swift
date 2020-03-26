//
//  ViewController.swift
//  REDACTED
//
//  Created by Jack Younger on 3/9/20.
//  Copyright © 2020 Jack Younger. All rights reserved.
//

import UIKit
import SceneKit
import ARKit


class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet weak var sceneView: ARSCNView!
    
    
    
    override func viewDidLoad() {
        sceneView.delegate = self
        let scene = SCNScene(named: "arresources.scnassets/blank.scn")
        sceneView.scene = scene!
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

