//
//  ViewController.swift
//  MVP
//
//  Created by Sylvia Callejas on 06/11/2018.
//  Copyright © 2018 Sylvia Callejas. All rights reserved.
//

import UIKit

class ViewController: UIViewController, Navigator {
    var presenter: ViewControllerPresenter?
    
    @IBAction func mapButton(_ sender: UIButton) {
        presenter?.mapButtonPressed()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = ViewControllerPresenter(navigator: self)
    }
    
    func navigateToMap() {
        self.performSegue(withIdentifier: "mapview", sender: self)
    }
}
