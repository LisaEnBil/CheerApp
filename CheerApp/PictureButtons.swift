//
//  PictureButtons.swift
//  CheerApp
//
//  Created by Lisa on 2020-05-24.
//  Copyright © 2020 Lisa. All rights reserved.
//

import UIKit

class PictureButtons: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    private func setupButton() {
        layer.cornerRadius = frame.size.height/3
    }
}
