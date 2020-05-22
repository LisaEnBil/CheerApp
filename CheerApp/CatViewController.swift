//
//  CatViewController.swift
//  CheerApp
//
//  Created by Lisa on 2020-05-22.
//  Copyright © 2020 Lisa. All rights reserved.
//

import UIKit

class CatViewController: UIViewController {

    @IBOutlet weak var catImageView: UIImageView!
    
    var cat = "torsken"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if cat == "torsken" {
            catImageView.image = UIImage(named: "torsken1")
        }
        else if cat == "livli" {
             catImageView.image = UIImage(named: "livli")
        }
       
    }
}
