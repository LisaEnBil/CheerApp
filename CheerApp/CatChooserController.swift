//
//  ViewController.swift
//  CheerApp
//
//  Created by Lisa on 2020-05-19.
//  Copyright © 2020 Lisa. All rights reserved.
//

import UIKit

class CatChooserController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIGestureRecognizerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad ()
       
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let catController = segue.destination as! CatViewController
        
        catController.cat = "torsken"
        
        if segue.identifier == "livli" {
            catController.cat = "livli"
        }
        else if segue.identifier == "torsken" {
            catController.cat = "torsken"
        }
    
    }
    
    @IBOutlet weak var addedCat: UIView!
    
    
    @IBAction func chooseCatPhoto() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = .photoLibrary
            navigationController?.present(picker, animated: true, completion: nil)
            
        }
    }
    @IBOutlet var imageView: UIImageView!
    var imageAspectConstraint: NSLayoutConstraint?

    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        navigationController?.dismiss(animated: true, completion: nil)
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = image
    
            let aspectRatio = image.size.width / image.size.height
            
            imageAspectConstraint?.isActive = false
            imageAspectConstraint = imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: aspectRatio)
            imageAspectConstraint?.isActive = true
        }
        if addedCat.isHidden {
            addedCat.isHidden = false
        }
        
        
    }
    
}

