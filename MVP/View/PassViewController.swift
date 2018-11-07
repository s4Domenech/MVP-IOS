//
//  PassViewController.swift
//  MVP
//
//  Created by Sylvia Callejas on 07/11/2018.
//  Copyright © 2018 Sylvia Callejas. All rights reserved.
//

import UIKit

class PassViewController: UIViewController {
    @IBOutlet weak var labelText: UILabel!
    
    var textPassed: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelText.text? += textPassed
    }
}
