//  ViewController.swift
//  photoTaker
//
//  Created by Jack Younger on 2/20/20.
//  Copyright © 2020 Jack Younger. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @IBOutlet weak var imageView: UIImageView!
    
    var takerController: UIImagePickerController!
    var imageCount:Int = 0
    var imageNames: [String] = []
    var image: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video, completionHandler: {(_) in return})
        default:
            return
        }
    }
    
    @IBAction func takePicture(_ sender: UIBarButtonItem) {
        takeIt()
    }
    
    func setupCaptureSession() {
        print("Take a photo!")
        
    }
    
    func takeIt() {
        takerController = UIImagePickerController()
        takerController.delegate = self
        takerController.sourceType = .camera
        present(takerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        takerController.dismiss(animated: true, completion: nil)
        imageView.image = info[.originalImage] as? UIImage
        _ = saveImage(image: imageView.image!)
        
    }
    
    func saveImage(image: UIImage) -> Bool {
        guard let data = image.jpegData(compressionQuality: 1) ?? image.pngData() else {
            return false
        }
        guard let directory = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) as NSURL else {
            return false
        }
        do {
            try data.write(to: directory.appendingPathComponent("\(imageCount).png")!)
            imageNames.append("\(imageCount).png")
            imageCount += 1
            return true
        } catch {
            print(error.localizedDescription)
            return false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue,sender: Any?) {
        print(imageNames)
        let vc = segue.destination as! TableViewController
        vc.imageCount = imageCount
        imageNames.reverse()
        vc.imageNames = imageNames
    }
}








