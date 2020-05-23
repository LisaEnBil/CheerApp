//
//  CatViewController.swift
//  CheerApp
//
//  Created by Lisa on 2020-05-22.
//  Copyright © 2020 Lisa. All rights reserved.
//

import UIKit
import AVFoundation

class CatViewController: UIViewController {

    var audioPlayer: AVAudioPlayer!
    
    func prepareForSound(purrFile: String) {
        
        guard let url = Bundle.main.url(forResource: purrFile, withExtension: "wav") else {
            return
        }
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer.numberOfLoops = -1

            audioPlayer.prepareToPlay()
              
        }
        catch {
            print("Catch")
            print(error)
        }
    }

    
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .landscapeRight
    }
 
    
    @IBOutlet weak var catImageView: UIImageView!
    
    var cat = "torsken"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if cat == "torsken" {
            catImageView.image = UIImage(named: "torsken1")
            prepareForSound(purrFile: "0981")
            
            
        }
        else if cat == "livli" {
            catImageView.image = UIImage(named: "livli")
            prepareForSound(purrFile: "1010")
        }
        
    }
    @IBAction func purr() {
        
        if !audioPlayer.isPlaying {
            audioPlayer.play()
        }
    }
    @IBAction func stopPurring() {
        if audioPlayer.isPlaying {
            audioPlayer.pause()
        }
    }
 
    
}
