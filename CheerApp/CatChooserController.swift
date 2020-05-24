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
        else {
            catController.cat = "torsken"
        }
    }
}


