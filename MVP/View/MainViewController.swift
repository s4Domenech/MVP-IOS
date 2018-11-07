//
//  ViewController.swift
//  MVP
//
//  Created by Sylvia Callejas on 06/11/2018.
//  Copyright © 2018 Sylvia Callejas. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, MainNavigator {
    var presenter: MainPresenter?
    
    @IBAction func mapButton(_ sender: UIButton) {
        presenter?.mapButtonPressed()
    }
    
    @IBAction func qrButton(_ sender: UIButton) {
        presenter?.qrButtonPressed()
    }
    
    @IBAction func passButton(_ sender: UIButton) {
        presenter?.passButtonPressed()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = MainPresenter(navigator: self)
    }
    
    func navigateToMapView() {
        self.performSegue(withIdentifier: "mapview", sender: self)
    }
    
    func navigateToQrView() {
        self.performSegue(withIdentifier: "qrview", sender: self)
    }
    
    func navigateToPassView() {
        self.performSegue(withIdentifier: "passview", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let passView = segue.destination as? PassViewController {
            passView.textPassed = "Testing"
        }
    }
}
