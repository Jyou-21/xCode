//
//  ViewController.swift
//  CrossroadsFinder
//
//  Created by Jack Younger on 3/23/20.
//  Copyright © 2020 Jack Younger. All rights reserved.
//
import MapKit
import UIKit

class ViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    let crossPoint = MKMapPoint(CLLocationCoordinate2D(latitude: 34.0246, longitude: -118.4739))
    let stanPoint = MKMapPoint(CLLocationCoordinate2D(latitude: 37.4275, longitude: -122.1697))
    let vanPoint = MKMapPoint(CLLocationCoordinate2D(latitude: 36.1447, longitude: -86.8027))
    var inframe: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mapView.delegate = self
    }
    
    @IBAction func goToCross(_ sender: Any) {
        let size = MKMapSize(width: 1000, height: 1000)
        let rect = MKMapRect(origin: crossPoint, size: size)
        mapView.setRegion(MKCoordinateRegion(rect), animated: true)
    }
    @IBAction func goToVan(_ sender: Any) {
        let size = MKMapSize(width: 1000, height: 1000)
        let rect = MKMapRect(origin: vanPoint, size: size)
        mapView.setRegion(MKCoordinateRegion(rect), animated: true)
    }
    
   
    @IBAction func goToStan(_ sender: Any) {
        let size = MKMapSize(width: 1000, height: 1000)
        let rect = MKMapRect(origin: stanPoint, size: size)
        mapView.setRegion(MKCoordinateRegion(rect), animated: true)
    }
    
    @IBAction func zoomOut(_ sender: Any) {
        let factor = 2.0
        zoom(factor)
    }
    
    @IBAction func zoomIn(_ sender: Any) {
        let factor = 0.5
        zoom(factor)
    }
    
    func zoom(_ zoomFactor: Double) {
        let region = mapView.region
        let span = region.span
        let newLat = span.latitudeDelta * zoomFactor
        let newLong = span.longitudeDelta * zoomFactor
        let newSpawn = MKCoordinateSpan(latitudeDelta: newLat, longitudeDelta: newLong)
        let newRegion = MKCoordinateRegion(center: region.center, span: newSpawn)
        mapView.setRegion(newRegion, animated: true)
    }
    
    
    func createTopLabel(inframe:[String]) -> String {
        if inframe.count == 1 {
            return "\(inframe[0]) is in view!"
        }else if inframe.count == 2 {
            return "\(inframe[0]) and \(inframe[1]) are in view!"
        }else if inframe.count == 3 {
            return "\(inframe[0]), \(inframe[1]), and \(inframe[2]) are all in frame!"
        }else {return "This message should never display.  If you see this, the world is ending"
        }
        
    }
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let rect = mapView.visibleMapRect
        
        inframe = []
        
        if rect.contains(vanPoint){
            inframe.append("Vanderbilt")
        }
        if rect.contains(stanPoint){
            inframe.append("Stanford")
        }
        if rect.contains(crossPoint) {
            inframe.append("Crossroads")
        }
        print(inframe)
        topLabel.text = createTopLabel(inframe:inframe)
    }
}

