//
//  ViewController.swift
//  CheerApp
//
//  Created by Lisa on 2020-05-19.
//  Copyright © 2020 Lisa. All rights reserved.
//

import UIKit
import MediaPlayer

class CatChooserController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIGestureRecognizerDelegate, UITextFieldDelegate {
    

    override func viewDidLoad() {
        super.viewDidLoad ()
        removeButton.isHidden = true
        
        field.delegate = self
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
        else if segue.identifier == "chosenCat" {
            catController.cat = "chosenCat"
            catController.chosenCat = imageView.image
        }
        
    }
    
    @IBOutlet weak var addedCat: UIView!
    
    @IBOutlet weak var addCatButton: UIButton!
    

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
            addCatButton.isHidden = true
            addedCat.isHidden = false
        }
        catName()
    }
    
    @IBOutlet var field: UITextField!
    @IBOutlet var label: UILabel!

    @IBAction func catName () {
        
        if label.isHidden {
            label.isHidden = true
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
            print("hello")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      
        field.endEditing(true)
        label.text = field.text
        field.isHidden = true
        label.isHidden = false
        removeButton.isHidden = false
        return true
        
    }

    
    @IBAction func removeCat() {
          
        imageView.image = nil
        label.text = nil
        label.isHidden = true
        addedCat.isHidden = true
        removeButton.isHidden = true
        addCatButton.isHidden = false
          
      }
    
    @IBOutlet weak var removeButton: UIButton!
    
    
    
}

