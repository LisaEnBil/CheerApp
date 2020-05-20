//
//  ViewController.swift
//  CheerApp
//
//  Created by Lisa on 2020-05-19.
//  Copyright © 2020 Lisa. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIGestureRecognizerDelegate {

    let context = CIContext()
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func chooseCatButton() {
        
        print("inside choosecatbutton")
    }
   
    override func viewDidLoad() {
        super.viewDidLoad ()
     
    }
    
    @IBAction func tappedImage(sender: UITapGestureRecognizer) {
        
        if sender.view == imageView {
            print("Its hthe same")
        }
    }

}

