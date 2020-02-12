//
//  ViewController2.swift
//  DynamicViews
//
//  Created by Jack Younger on 2/10/20.
//  Copyright © 2020 Riley John Gibbs. All rights reserved.
//

import UIKit
import Foundation
class ViewController2: UIViewController {

    @IBOutlet weak var StackView: UIStackView!
    
    var imageCount = 2
    var imageUsing = [UIImage]()
    let screenHeight = UIScreen.main.fixedCoordinateSpace.bounds.height

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageUsing.append(#imageLiteral(resourceName: "riley"))
        
        let images = (1...imageCount).map({(_) in UIImageView()})
                for (i, image) in images.enumerated() {
                    image.image = #imageLiteral(resourceName: "riley")
                    image.autoresizingMask = []
                    let imageHeight = Int(round(Double(StackView.frame.height) / Double(imageCount)))
                    print(imageHeight)
                    image.frame = CGRect(x: 0,y: 0,width: Int(StackView.frame.size.width), height: imageHeight);
                    image.contentMode = .center
                    image.contentMode = .scaleToFill
                    StackView.addArrangedSubview(image)
                    let constraint = NSLayoutConstraint(item: image, attribute: .height, relatedBy: .equal, toItem: images[0], attribute: .height, multiplier: 1, constant: 1)
                    if i > 0 {
                        StackView.addConstraint(constraint)
                    }
                }
            }
        }
