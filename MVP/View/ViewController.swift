//
//  ViewController.swift
//  MVP
//
//  Created by Sylvia Callejas on 06/11/2018.
//  Copyright © 2018 Sylvia Callejas. All rights reserved.
//

import UIKit

class ViewController: UIViewController, View {
    var presenter: ViewControllerPresenter?
    
    @IBOutlet weak var labelToChange: UILabel!
    @IBAction func changeLabelButton(_ sender: UIButton) {
        presenter?.changeLabelButtonPressed()
    }
    
    func changeLabel(_ text: String) {
        labelToChange.text = text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = ViewControllerPresenter(view: self)
    }
}
